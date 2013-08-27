<?php

class admin {

	public $public = true;

	function index(){
		global $request;
		require 'views/master_view.php';
	}
}