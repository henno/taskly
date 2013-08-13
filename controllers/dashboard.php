<?php

class dashboard
{
	function index()
	{
		global $request;
		$events = get_all("SELECT *, DATE_FORMAT(`timestamp`, '%d %b %Y %T') AS 'date_formatted'
		                   FROM log
		                   NATURAL JOIN event_type
		                   NATURAL JOIN task
		                   ORDER BY timestamp DESC
		                   LIMIT 0, 10");
		$lastday = NULL;
		var_dump($events);
		require 'views/master_view.php';

	}
}