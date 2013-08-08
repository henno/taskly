<?
/**
 * Display a fancy error page and quit.
 * @param $error_file_name string The view file of the specific error (in views/errors folder, without _error_view.php suffix)
 */
function error_out($error_file_name){
	require('views/errors/master_error_view.php');
	exit();
}

/**
 * Log event in history table
 * @param $task_id int Task associated with the event
 * @param $event_id int Event type
 * @param null $new_value string
 * @param null $old_value string
 */
function log($task_id, $event_type_id, $new_value = null, $old_value = null){
    $data['task_id'] = $task_id;
    $data['user_id'] = get_user_id();
    $data['event_type_id'] = $event_type_id;
    $data['new_value'] = $new_value;
    $data['old_value'] = $old_value;
    insert($task_id, $data);
}

/**
 * Returns the current user's ID
 * @return int
 */
function get_user_id(){
    return (int)$_SESSION['user_id'];
}
