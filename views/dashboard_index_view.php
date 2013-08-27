<style type="text/css">
	.user-icon {
		display: inline;
		float: left;
		height: 48px;
		margin-left: -60px;
		margin-top: 0.9em;
		vertical-align: top;
		width: 48px;
	}

	.activity-item {
		background-position: 0.6em 0.6em;
		background-repeat: no-repeat;
		border-top: 1px solid #EAEAEA;
		color: #404040;
		line-height: 125%;
		min-height: 16px;
		padding: 0 5px 0.8em 65px;
		vertical-align: top;
	}

	p {
		margin-bottom: 1em;
	}

	.activity-item-summary {
		color: #555555;
		line-height: 145%;
		padding-top: 0.8em;
		word-wrap: break-word;
	}

	del {
		background-color: #fdd;
		color: red;
		text-decoration: none;
	}

	ins {
		background-color: #dfd;
		color: green;
		text-decoration: none;
	}
</style>

<div class="span8">
	<? foreach ($events as $event): ?>
		<? if ($event['timestamp'] == $lastday): ?>
			<div class="date-header"><?= timespan($event['timestamp']) ?></div>
			<? $lastday = $event['timestamp'] ?>
		<? endif ?>
		<div class="activity-item">

            <span class="user-icon">
    			<a target="_parent" href="<?= BASE_URL ?>#">
					<img src="<?= ASSETS_URL ?>img/useravatar.png" title="Henno Täht" alt="Henno Täht" height="48"
						 width="48">
				</a>
  			 </span>

			<div class="activity-item-summary">

				<a href="<?= BASE_URL ?>#"
				   class="activity-item-user activity-item-author">
					<?= $event['username'] ?>
				</a>
				<? require 'dashboard/' . $event['event_type_filename'] . '.php'; ?>

			</div>
			<div class="activity-item-info">
				<?= timespan($event['timestamp']) ?>
			</div>
			<div class="clearer"></div>
		</div>
	<? endforeach ?>
</div>
