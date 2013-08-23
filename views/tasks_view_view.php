<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type='text/javascript' src='<?=ASSETS_URL?>jquery\js\tasks_edit.js'></script>

<style></style>
<?if(isset($task['task_summary'])&&strlen($task['task_summary'])):?>
	<table>

		<tr><td>Kokkuvõte</td>
			<td class="edit" id="tasksummary" name="task_summary"><?=$task['task_summary'];?></td></tr>
		<tr><td>Tähtaeg</td><td class="edit" id="task_due" name="task_due"><?=$task['task_due'];?></td></tr>
		<tr><td>Vastutaja</td><td class="edit" id="user_assignee_id"><?=$assignee_name?></td></tr>
		<tr><td>Teataja</td><td class="edit" id="user_reporter_id"><?=$reporter_name?></td></tr>
		<tr><td>Aeg</td><td id="task_reported_time"><?=$task['task_reported_time'];?></td></tr>

	</table>


<?endif?>