<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Project;
use App\Models\Category;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    public function allprojects(Request $request, $slug = null)
    {
        $category_id = $request->category_id;

        $qCategory = null;
        if ($category_id) {
            $qCategory = $category_id;
        }

        $categories = Category::with('projects')->orderBy('sorting', 'asc')->get();
        $projectQuery = Project::where('status', 'active');

        if ($category_id) {
            $projectQuery->where('category_id', $category_id);
        }

        if ($slug) {
            $category = Category::where('slug', $slug)->first();
            $projectQuery->where('category_id', $category->id);
        }

        $projects = $projectQuery->orderBy('sorting', 'asc')->paginate(9);

        return view(themeBlade('pages.project.project-list'), compact('projects', 'categories'));
        // return response()->json($projects);
    }

    public function fetchProjects(Request $request)
    {
        $category_id = $request->input('category_id');
        $slug = $request->slug;

        // Query projects based on category_id
        $projectQuery = Project::with('category')->where('status', 'active');

        if ($category_id) {
            $projectQuery->where('category_id', $category_id);
            return $projectQuery->get();
        }

        if ($slug) {
            $category = Category::where('slug', $slug)->first();
            $projectQuery->where('category_id', $category->id);
        }

        if ($request->ajax()) {
            return $projectQuery->paginate(9);
        }

        $projects = $projectQuery->orderBy('sorting', 'asc')->paginate(9);

        // Prepare pagination links for AJAX response
        $paginationHtml = view(themeBlade('components.paginate', ['projects' => $projects]))->render();


        // Return JSON response with projects data and pagination links
        return response()->json([
            'projects' => [
                'data' => $projects->items(),
                'links' => $paginationHtml,
            ],
        ]);
    }

    public function details(Request $request, $slug)
    {
        $project = Project::where('slug', $slug)->with('client', 'category')->firstOrFail();
        // dd($project);
        return view(themeBlade('pages.project.project-details'), compact('project'));
    }
}
