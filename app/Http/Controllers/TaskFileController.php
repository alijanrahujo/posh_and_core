<?php

namespace App\Http\Controllers;

use App\Task;
use App\TaskFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TaskFileController extends Controller {

	public function index(Task $task)
	{

		if (request()->ajax())
		{
			return datatables()->of(TaskFile::with('user:id,username')->where('task_id', $task->id)->get())
				->setRowId(function ($file)
				{
					return $file->id;
				})
				->addColumn('file_description', function ($row)
				{
					if ($row->file_description)
					{
						return $row->file_description;
					} else
					{
						return '';
					}
				})
				->addColumn('subtask', function ($row)
				{
					$result ="";
					$subtask = json_decode($row->subtask);
					foreach($subtask->subtask as $key=>$value)
					{
						$result .= $key+1;
						$result .=") ".$value;
						if($subtask->file[$key] != '')
						{
							$result .= ' (<a href="' . route('tasks.downloadFile',$subtask->file[$key]) . '">' . trans('file.File') . '</a>)';
						}
						if($subtask->Remarks[$key] != '')
						{
							$result .= " (".$subtask->Remarks[$key].")";
						}
						$result .="<br>";
					}

					return $result;

				})
				->addColumn('action', function ($data)
				{

					$button = '<button type="button" name="delete" id="' . $data->id . '" class="delete-file btn btn-danger btn-sm"><i class="dripicons-trash"></i></button>';

					return $button;
				})
				->rawColumns(['action', 'file_description','subtask'])
				->make(true);

		}
	}

	public function store(Request $request, Task $task)
	{

		$validator = Validator::make($request->only('file_title', 'file_description', 'file_attachment','remarks','subtask'),
			[
				'file_title' => 'required',
				'file_attachment.*' => 'required|file|max:10240|mimes:jpeg,png,jpg,gif,ppt,pptx,doc,docx,pdf',
				'remarks.*' => 'required',
				'subtask.*' => 'required',
			]
		);


		if ($validator->fails())
		{
			return response()->json(['errors' => $validator->errors()->all()]);
		}

		$data = [];
		
		$subtask = explode(',',$request->subtask);
		$type = explode(',',$request->type);
		$subtaskarray = array();
		$i =0;
		$j = 0;
		foreach($subtask as $key=>$subtask)
		{
			$subtaskarray['subtask'][] = $subtask;
			if($type[$key] == "File")
			{
				$file = $request->file_attachment[$i];
				$i++;
				if (isset($file))
				{
					if ($file->isValid())
					{
						$file_name = 'task_file_' . time() . '.' . $file->getClientOriginalExtension();
						$file->storeAs('task_file_attachments', $file_name);
						$subtaskarray['file'][] = $file_name;
					}
					else
					{
						$subtaskarray['file'][] = "";
					}
				}
				else
				{
					$subtaskarray['file'][] = "";
				}
			}
			else
			{
				$subtaskarray['file'][] = "";
			}

			if($type[$key] == "Remarks")
			{
				$subtaskarray['Remarks'][] = $request->remarks[$j];
				$j++;
			}
			else
			{
				$subtaskarray['Remarks'][] = "";
			}
		}
		

		$data['file_description'] = $request->get('file_description');
		$data['file_title'] = $request->file_title;
		$data['subtask'] = json_encode($subtaskarray);
		$data ['task_id'] = $task->id;

		/*
		$file = $request->file_attachment[0];
		$file_name = null;

		if (isset($file))
		{
			if ($file->isValid())
			{
				$file_name = 'task_file_' . time() . '.' . $file->getClientOriginalExtension();
				$file->storeAs('task_file_attachments', $file_name);
				$data['file_attachment'] = $file_name;
			}
		}
		*/

		TaskFile::create($data);

		return response()->json(['success' => __('Data Added successfully.')]);
	}

	public function destroy($id)
	{
		$file = TaskFile::findOrFail($id);
		$file_path = $file->file_attachment;

		if ($file_path)
		{
			$file_path = public_path('uploads/task_file_attachments/' . $file_path);
			if (file_exists($file_path))
			{
				unlink($file_path);
			}
		}

		$file->delete();

		return response()->json(['success' => __('Data is successfully deleted')]);
	}


	public function download($id)
	{

		//$file = TaskFile::findOrFail($id);

		//$file_path = $file->file_attachment;
		$file_path = $id;
		$download_path = public_path("uploads/task_file_attachments/" . $file_path);

		if (file_exists($download_path))
		{
			$response = response()->download($download_path);

			return $response;
		} else
		{
			return abort('404', __('File not Found'));
		}
	}
}
