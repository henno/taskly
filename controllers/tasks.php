<?php

class tasks {
	function index()
	{global $request;
		$tasks = get_all("SELECT * FROM task");

		require 'views/master_view.php';
	}
	function view(){
		global $request;
		global $auth;
		$id=$request->params[0];
		$tasks=get_first("SELECT * FROM task WHERE task_id='$id' ");
		require 'views/master_view.php';
	}
	function create(){
		global $request;
		global $auth;
		$assignees=get_all("SELECT * FROM user"); // var_dump($assignees);
		if (isset($_POST['task_summary']) && isset($_POST['task_due']) ) {
			$data['task_summary']=$_POST['task_summary'];
			$data['task_due']=$_POST['task_due'];
			$data['user_assignee_id']=$_POST['user_assignee_id'];
			$data['user_reporter_id']=1;


            $task_id = insert("task", $data);
            $field = array_keys($data);
            $field = implode(" | ",$field);

            $new_value = implode(" | ",$data);
          //   die($new_value);
            $event_type_id = get_one("SELECT event_type_id FROM event_type WHERE event_type_id = 3 ");

			tasks_log($task_id, $event_type_id, $field, $new_value, '');

                $request->redirect('');
	}
		require 'views/master_view.php';
		}
}