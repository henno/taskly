<form action="" method="post" class="form-group">
	<h2>Lisa uus töö</h2>
	<input id="tasksummary" name="task_summary" type="text" class="input-block-level" placeholder="töö kokkuvõte">
	<input id="datepicker" name="due_date" type="text" class="input-block-level"
	       placeholder="tähtaeg">

	<select name="status_id" type="text" class="dropdown">
		<?if(!empty($statuses)):foreach($statuses as $status):?>
		<option name="status_id" value="<?=$status['status_id']?>"><?=$status['status_name']?></option>
		<?endforeach;endif?>
	</select>
	<button class="btn btn-large btn-primary" type="submit">Lisa</button>
</form>

