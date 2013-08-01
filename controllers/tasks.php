<?php

class tasks
{

	function index()
	{
		global $request;


		$tasks = get_all("SELECT * FROM task");

		require 'views/master_view.php';
	}


}