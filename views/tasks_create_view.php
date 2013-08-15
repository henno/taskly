<form action="" method="post" class="form-group">
	<h2>Lisa uus töö</h2>
	<input id="tasksummary" name="task_summary" type="text" class="input-block-level" placeholder="töö kokkuvõte">
	<input id="datepicker" name="task_due" type="text" class="input-block-level"
	       placeholder="tähtaeg">
	<input id="field" name="field" type="text" class="input-block-level" placeholder="field ?">

<select name="user_assignee_id" type="text" class="dropdown">
		<?if(!empty($assignees)):foreach($assignees as $assignee):?>
		<option name="user_assignee_id" value="<?=$assignee['user_id']?>"><?=$assignee['username']?></option>
		<?endforeach;endif?>
	</select>
	<button class="btn btn-large btn-primary" type="submit">Lisa</button>
</form>

