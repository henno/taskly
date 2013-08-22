<form action="" method="post" class="form-group">
	<h2>Lisa uus töö</h2>
	<input id="tasksummary" name="task_summary" type="text" class="input-block-level" placeholder="töö kokkuvõte">
	<input id="datepicker" name="task_due" type="text" class="input-block-level"
	       placeholder="tähtaeg">
<p>vastutaja</p>
<select name="user_assignee_id" type="text" class="dropdown">
		<?if(!empty($workers)):foreach($workers as $worker):?>
		<option name="user_assignee_id" value="<?=$worker['user_id']?>"><?=$worker['username']?></option>
		<?endforeach;endif?>
	</select>
	<p>teataja</p>
	<select name="user_reporter_id" type="text" class="dropdown">
		<?if(!empty($workers)):foreach($workers as $worker):?>
			<option name="user_reporter_id" value="<?=$worker['user_id']?>"><?=$worker['username']?></option>
		<?endforeach;endif?>
	</select>
	<button class="btn btn-large btn-primary" type="submit">Lisa</button>
</form>

