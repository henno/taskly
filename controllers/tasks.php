<?php

class tasks {
	function index()
	{}
	function view(){
		global $request;
		global $auth;
		$id=$request->params[0];
		$tasks=get_all("SELECT * FROM task WHERE task_id='$id' ");
		$tasks=$tasks[0];
		require 'views/master_view.php';
	}
}