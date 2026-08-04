<?php

namespace App\Http\Controllers\Admin;

use App\Models\Invoice;
use App\Models\Package;
use App\Models\Organization;
use App\Models\System\Menu;
use App\Models\System\Role;
use Illuminate\Http\Request;
use App\Models\UserLoginHistory;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Spatie\Activitylog\Models\Activity;


class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            // Menus for dashboard.
            $menus = Menu::get();
            $dashboardMenus = Menu::query()
                ->where('show_dasboard', true)
                ->get()
                ->each(function ($menu) use ($menus) {
                    $getParentById = function ($id, $parents) {
                        $parent = $parents->firstWhere('id', $id);

                        return $parent;
                    };

                    $parent = $getParentById($menu->parent_id, $menus);

                    if (!is_null($parent)) {
                        $menu->parent_title = $parent->menu_name;
                    } else {
                        $menu->parent_title = $menu->menu_name;
                    }

                    // Resolve the model class and count the total data
                    if ($menu->module_name) {
                        $model = $menu->module_name;
                        $menu->total_data_count = $model::count();
                    } else {
                        $menu->total_data_count = 0;
                    }
                });


            // Get recent application activity.
            $pendingresedences = Organization::with('package:id,title')
                ->select('id', 'package_id', 'saasno', 'Organization_name', 'owner_name', 'mobile', 'email', 'reg_date', 'promo_code')
                ->where('status', 'apply')
                ->take(5)
                ->get();

            $recentinvoices = Invoice::with('Organization:id,Organization_name,owner_name')
                ->where('payment_status', 'paid')
                ->take(5)
                ->get();


            return [
                'dashboardMenus' => $dashboardMenus,
                'pendingresedences' => $pendingresedences,
                'recentinvoices' => $recentinvoices,
                'pieData' => $this->pieData(),
                'barData' => $this->barData(),
            ];
        }

        return view('admin.layouts.admin_app');
    }

    /**
     * Bar chart
     *
     * @return array
     */
    public function barData()
    {
        $startOfMonth = date('Y-m-01'); // মাসের প্রথম দিন
        $endOfMonth   = date('Y-m-t');  // মাসের শেষ দিন

        // Database থেকে তারিখ অনুযায়ী count বের করো
        $data = Organization::select(
            DB::raw('DATE(reg_date) as date'),
            DB::raw('COUNT(*) as total')
        )
            ->whereBetween('reg_date', [$startOfMonth, $endOfMonth])
            ->groupBy(DB::raw('DATE(reg_date)'))
            ->orderBy('date')
            ->pluck('total', 'date')
            ->toArray();

        // মাসের সব তারিখ বের করি
        $labels = [];
        $values = [];
        $period = new \DatePeriod(
            new \DateTime($startOfMonth),
            new \DateInterval('P1D'),
            (new \DateTime($endOfMonth))->modify('+1 day')
        );

        foreach ($period as $date) {
            $d = $date->format('Y-m-d');
            $labels[] = $d;
            $values[] = $data[$d] ?? 0; // যদি না থাকে, 0 বসবে
        }

        return [
            'labels' => $labels,
            'data'   => $values,
        ];
    }

    /**
     * Pie chart
     *
     * @return array
     */
    public function pieData()
    {
        $data = Organization::select('package_id', DB::raw('count(*) as total'))
            ->groupBy('package_id')
            ->pluck('total', 'package_id');

        $packages = Package::whereIn('id', $data->keys())->pluck('title', 'id');

        return [
            'labels' => $packages->values(),    // প্যাকেজ নাম
            'data'   => $data->values(),        // রেসিডেন্স সংখ্যা
        ];
    }
}
