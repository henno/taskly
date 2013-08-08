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
		$statuses=get_all("SELECT * FROM status");
		if (isset($_POST['task_summary']) && isset($_POST['due_date']) && isset($_POST['status_id']) ) {
			$data['task_summary']=$_POST['task_summary'];
			$data['task_due']=$_POST['due_date'];
			$data['status_id']=$_POST['status_id'];
			insert("task", $data);
		$request->redirect('');
	}
		require 'views/master_view.php';
		}
}