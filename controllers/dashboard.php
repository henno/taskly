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
		include 'modules/finediff.php';
		for ($n = 0; $n < count($events); $n++) {
			$opcodes = FineDiff::getDiffOpcodes($events[$n]['old_value'], $events[$n]['new_value'], FineDiff::$wordGranularity);
			$events[$n]['diff'] = html_entity_decode(FineDiff::renderDiffToHTMLFromOpcodes($events[$n]['old_value'], $opcodes));

			// Crop context
			// TODO: "|" not working on this next line
			// $events[$n]['diff'] = preg_replace('#.*(\<(ins|del)\>.*\</(del|ins)\>).*#','$1',$events[$n]['diff']);
		}
		require 'views/master_view.php';

	}
}