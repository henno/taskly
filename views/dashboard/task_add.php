lisas töö <b><a href="<?= BASE_URL ?>tasks/view/<?= $event['task_id'] ?>"><?= $event['task_summary'] ?></a></b></br>

<div class="activity-item-description">
	<div class="user-content">
		<?= $event['new_value'] ?>
		<a href="<?= BASE_URL ?>tasks/view/<?= $event['task_id'] ?>" class="content-more">Vaata tööd</a>

	</div>
</div>