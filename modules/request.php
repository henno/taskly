<?php
/**
 * Created by JetBrains PhpStorm.
 * User: karmen.kukk
 * Date: 15.04.13
 * Time: 12:48
 * To change this template use File | Settings | File Templates.
 */

class Request
{

	public $controller = DEFAULT_CONTROLLER;
	public $action = 'index';
	public $params = array();

	public function __construct()
    {
		if (isset($_SERVER['PATH_INFO'])) {
			if ($path_info = explode('/', $_SERVER['PATH_INFO'])) {
				array_shift($path_info);
				$this->controller = isset($path_info[0]) ? array_shift($path_info) : DEFAULT_CONTROLLER;
				$this->action = isset($path_info[0]) && ! empty($path_info[0]) ? array_shift($path_info) : 'index';
				$this->params = isset($path_info[0]) ? $path_info : array();
			}
		}

        /** Routings **/

        // tasks/13 ==> tasks/view/13
        if( $this->controller == 'tasks' and is_numeric($this->action) ) {

            // Put task's id to params array
            array_unshift($this->params, $this->action);

            // Overwrite action property
            $this->action = 'view';
        }
    }

	// ümbersuunamine
	public function redirect($destination){
		header('Location: '.BASE_URL.$destination); // header - aadressiribale, Location: peab olema
		// saab väärtuse kui $request->redirect(väärtus)
	}
}

$request = new Request;
