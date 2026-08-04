<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    /**
     * Global return the response
     *
     * @param [type] $type
     * @param [type] $res
     * @return json
     */
    public function responseReturn($type, $res = null, $slug = null, $extraUpdate = false)
    {
        if (! empty($slug)) {
            return response()->json(
                [
                    'slug' => $slug,
                    'type' => $res || $extraUpdate ? 'success' : 'warning',
                    'message' => $res || $extraUpdate ? 'Update Successfully!' : 'No data updated',
                ],
                200
            );
        }

        if ($type == 'create') {
            $reType = $res ? 'Successfully' : 'Unsuccessful';
            $key = $res ? 'message' : 'error';

            return response()->json([$key => "Save {$reType}!"], 201);
        } elseif ($type == 'update') {
            if ($res->wasChanged() || $extraUpdate) {
                return response()->json(['message' => 'Update Successfully!'], 201);
            }

            return response()->json(['message' => 'No data updated'], 203);
        } elseif ($type == 'delete') {
            $reType = $res ? 'Successfully' : 'Unsuccessful';

            return response()->json(['message' => "Delete {$reType}!"], 201);
        }
    }
}
