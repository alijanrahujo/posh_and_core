<?php

namespace App\Http\Controllers;

use App\Subtask;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use PHPUnit\Util\Json;

class SubtaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $logged_user = auth()->user();
		if ($logged_user->can('view-client'))
		{
			if (request()->ajax())
			{
				return datatables()->of(Subtask::latest()->get())
					->setRowId(function ($subtask)
					{
						return $subtask->id;
					})
                    ->addColumn('meta', function ($data)
					{
                        return json_decode($data->meta);
					})
					->addColumn('action', function ($data)
					{
						$button = '';
						if (auth()->user()->can('edit-client'))
						{
							$button .= '<button type="button" name="edit" id="' . $data->id . '" class="edit btn btn-primary btn-sm"><i class="dripicons-pencil"></i></button>';
							$button .= '&nbsp;&nbsp;';
						}
						if (auth()->user()->can('delete-client'))
						{
							$button .= '<button type="button" name="delete" id="' . $data->id . '" class="delete btn btn-danger btn-sm"><i class="dripicons-trash"></i></button>';
						}
						return $button;
					})
					->rawColumns(['action'])
					->make(true);
			}

			return view('projects.subtask.index');
		}
		return abort('403', __('You are not authorized'));

        $logged_user = auth()->user();
		if (auth()->user()->role_users_id == 1)
		{
			return view('projects.subtask.index');
		}
		return abort('403', __('You are not authorized'));

        //
        /*
        if(auth()->user()->role_users_id == 1)
        {
            $subtask = Subtask::all();
        
            return view('projects.subtask.index',['subtask'=>$subtask]);
        }
        */
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        

        $validator = Validator::make($request->only('category', 'subtask'),
			[
				'category' => 'required',
			]
		);

		if ($validator->fails())
		{
			return response()->json(['errors' => $validator->errors()->all()]);
		}
        

        $data = [];

        $data['subtask'] = $request->category;
        $data['meta'] = json_encode($request->subtask);

        Subtask::create($data);
        return response()->json(['success' => __('Data Added successfully.')]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Subtask  $subtask
     * @return \Illuminate\Http\Response
     */
    public function show(Subtask $subtask)
    {
        //

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Subtask  $subtask
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
	{

		if (request()->ajax())
		{
			$data = Subtask::findOrFail($id);

			return response()->json(['data' => $data]);
		}
	}

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Subtask  $subtask
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        //
        $logged_user = auth()->user();

		if (auth()->user()->role_users_id == 1)
		{
			$id = $request->hidden_id;

			$subtask = Subtask::findOrFail($id);
            $validator = Validator::make($request->only('category', 'subtask'),
			[
				'category' => 'required',
			]
            );

            if ($validator->fails())
            {
                return response()->json(['errors' => $validator->errors()->all()]);
            }

            $data = [];

            $data['subtask'] = $request->category;
            if($request->subtask != "")
            {
                $data['meta'] = json_encode($request->subtask);
            }
			try
			{
				Subtask::whereId($id)->update($data);
			} catch (Exception $e)
			{
				return response()->json(['error' => trans('file.Error')]);
			}

			return response()->json(['success' => __('Data is successfully updated')]);

		} else
		{
			return response()->json(['success' => __('You are not authorized')]);
		}

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Subtask  $subtask
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        if(!env('USER_VERIFIED'))
		{
			return response()->json(['error' => 'This feature is disabled for demo!']);
		}
		$logged_user = auth()->user();

		if (auth()->user()->role_users_id == 1)
		{
			$client = Subtask::findOrFail($id);
			$client->delete();
			return response()->json(['success' => __('Data is successfully deleted')]);
		}
		return response()->json(['success' => __('You are not authorized')]);
    }
}
