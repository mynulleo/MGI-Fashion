<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin;

use Storage;
use Exception;
use App\Models\Organization;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Base\BaseController;
use App\Traits\OrganizationTrait;
use App\Traits\ResizeTrait;

class OrganizationController extends BaseController
{
    use OrganizationTrait;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query  = Organization::with(['project:id,title'])->latest();
        $query->whereLike($request->field_name, $request->value);

        if ($request->allData) {
            return $query->get();
        } else {
            $datas = $query->paginate($request->pagination);
            return new Resource($datas);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('layouts.backend_app');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($this->validateCheck($request)) {
            try {
                $data = $request->all();
                $data['saasno'] = Organization::generatesaasno();
                $data['reg_date'] = empty($data['reg_date']) ? $data['reg_date'] : vue_to_server_date($data['reg_date']);
                $data['expired_date'] = empty($data['expired_date']) ? $data['expired_date'] : vue_to_server_date($data['expired_date']);
                // push the insert text
                $res = Organization::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Organization  $organization
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Organization $organization)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        // load package relation
        $organization->load('category:id,title');
        $organization->load('project');
        $organization->load('organization_users:id,organization_id,full_name,role_id,email,mobile');
        // load latest 5 invoices
        $organization->load(['invoice' => function ($query) {
            $query->latest()->take(5); // order by created_at desc + limit 5
        }]);

        // Extra info calculate
        $registrationDate = $organization->created_at;
        $duration = $registrationDate->diffForHumans(now(), true);

        $totalPaid   = $organization->invoice()->where('payment_status', 'paid')->sum('amount');
        $totalUnpaid = $organization->invoice()->where('payment_status', 'unpaid')->sum('amount');

        // extra info $organization object এর মধ্যে inject করা
        $organization->setAttribute('duration', $duration);
        $organization->setAttribute('total_paid', $totalPaid);
        $organization->setAttribute('total_unpaid', $totalUnpaid);

        return $organization;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Organization  $organization
     * @return \Illuminate\Http\Response
     */
    public function edit(Organization $organization)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Organization  $organization
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Organization $organization)
    {
        if ($this->validateCheck($request, $organization->id)) {
            try {
                $data = $request->all();
                $data['reg_date'] = vue_to_server_date($data['reg_date']);
                $data['expired_date'] = vue_to_server_date($data['expired_date']);

                if ($request->password) {
                    $data['password'] = Hash::make($request->password);
                }
                // push the update text
                $organization->fill($data)->save();

                return $this->responseReturn("update", $organization);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Organization  $organization
     * @return \Illuminate\Http\Response
     */
    public function destroy(Organization $organization)
    {
        // delete


        $res = $organization->delete();
        return $this->responseReturn("delete", $res);
    }

    public function Organizationinfo($organizationno)
    {
        $organization = [];
        if ($organizationno) {

            $organization = Organization::with('package:id,title')
                ->where('saasno', $organizationno)
                ->where('status', 'active')
                ->first();
        }
        return $organization;
    }



    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return true;
        return $request->validate([
            //ex: 'name' => 'required|email|nullable|date|string|min:0|max:191',
        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }
}
