
<table class="table table-bordered">
	<? foreach ($tasks as $task): ?>
	<tr>
		<td><a href="<?= BASE_URL ?>tasks/view/<?= $task['task_id'] ?>"><?=$task['task_summary']?></td>
	</tr>
<? endforeach ?>
</table>