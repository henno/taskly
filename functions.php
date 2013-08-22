<?
const LOGIN = 1;
const LOGOUT = 2;
const TASK_ADD = 3;
const TASK_EDIT = 4;
const TASK_REMOVE = 5;
const COMMENT_ADD = 6;
const COMMENT_EDIT = 7;
const COMMENT_REMOVE = 8;
const STATUS_EDIT = 9;
/**
 * Display a fancy error page and quit.
 *
 * @param $error_file_name string The view file of the specific error (in views/errors folder, without _error_view.php suffix)
 */
function error_out($error_file_name)
{
	require('views/errors/master_error_view.php');
	exit();
}

/**
 * Log event in history table
 *
 * @param $event_type_id int Event type
 * @param null $task_id int Task associated with the event
 * @param null $field string Changed field's name
 * @param null $new_value string Changed field's new value
 * @param null $old_value string Changed field's old value
 */
function write_log($event_type_id, $task_id = NULL,$field = NULL, $new_value = NULL, $old_value = NULL)
{
	$data['task_id'] = $task_id;
	$data['user_id'] = get_user_id();
	$data['event_type_id'] = $event_type_id;
	$data['new_value'] = $new_value;
	$data['old_value'] = $old_value;
	$data['field'] = $field;
	insert('log', $data);
}

/**
 * Returns the current user's ID
 *
 * @return int
 */
function get_user_id()
{
	return (int) $_SESSION['user_id'];
}

function timespan($ts)
{
	date_default_timezone_set('Europe/Tallinn');
	if (! ctype_digit($ts)) {
		$ts = strtotime($ts);
	}

	$diff = time() - $ts;
	if ($diff == 0) {
		return 'now';
	} elseif ($diff > 0) {
		$day_diff = floor($diff / 86400);
		if ($day_diff == 0) {
			if ($diff < 60) {
				return 'just now';
			}
			if ($diff < 120) {
				return '1 minute ago';
			}
			if ($diff < 3600) {
				return floor($diff / 60).' minutes ago';
			}
			if ($diff < 7200) {
				return '1 hour ago';
			}
			if ($diff < 86400) {
				return floor($diff / 3600).' hours ago';
			}
		}
		if ($day_diff == 1) {
			return 'Yesterday';
		}
		if ($day_diff < 7) {
			return $day_diff.' days ago';
		}
		if ($day_diff < 31) {
			return ceil($day_diff / 7).' weeks ago';
		}
		if ($day_diff < 60) {
			return 'last month';
		}
		return date('F Y', $ts);
	} else {
		$diff = abs($diff);
		$day_diff = floor($diff / 86400);
		if ($day_diff == 0) {
			if ($diff < 120) {
				return 'in a minute';
			}
			if ($diff < 3600) {
				return 'in '.floor($diff / 60).' minutes';
			}
			if ($diff < 7200) {
				return 'in an hour';
			}
			if ($diff < 86400) {
				return 'in '.floor($diff / 3600).' hours';
			}
		}
		if ($day_diff == 1) {
			return 'Tomorrow';
		}
		if ($day_diff < 4) {
			return date('l', $ts);
		}
		if ($day_diff < 7 + (7 - date('w'))) {
			return 'next week';
		}
		if (ceil($day_diff / 7) < 4) {
			return 'in '.ceil($day_diff / 7).' weeks';
		}
		if (date('n', $ts) == date('n') + 1) {
			return 'next month';
		}
		return date('F Y', $ts);
	}
}