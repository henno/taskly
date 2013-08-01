<?php

class tasks {
	function index()
	{}
	function view(){
		global $request;
		global $auth;
		$id=$request->params[0];
		$tasks=get_first("SELECT * FROM task WHERE task_id='$id' ");
		require 'views/master_view.php';
	}
}