<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Dashboard | Adminstrap</title>
	<!--jquery-->
	<link href="<?=ASSETS_URL?>jquery/css/jquery-ui-1.8.16.custom.css" rel="stylesheet">
	<!--bootstrap-->
	<link href="<?=ASSETS_URL?>bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!--app-->
	<link href="<?=ASSETS_URL?>app/css/style.css" rel="stylesheet">
</head>
<body>
<!--Navigation-->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="brand" href="index.html">
				<img src="<?=ASSETS_URL?>app/img/logo.png" height="45" alt="logo" /></a>
			<ul id="primary-nav" class="nav">
				<li><a href="dashboard.html"><i class="nav-icon-9"></i><span>Dashboard</span></a></li>
				<li class="dropdown"><a href="#" data-toggle="dropdown"><i class="nav-icon-1"></i><span>
                        Reports</span></a>
					<ul class="dropdown-menu">
						<li><a href="report.html"><i class="icon-list-alt"></i>&nbsp;Report 1</a></li>
						<li><a href="report.html"><i class="icon-list-alt"></i>&nbsp;Report 2</a></li>
						<li><a href="report.html"><i class="icon-list-alt"></i>&nbsp;Report 3</a></li>
					</ul>
				</li>
				<li><a href="forms.html"><i class="nav-icon-12"></i><span>Forms</span></a></li>
				<li class="dropdown"><a href="#" data-toggle="dropdown"><i class="nav-icon-11"></i><span>
                        Gallery</span></a>
					<ul class="dropdown-menu">
						<li><a href="slideshow.html"><i class="icon-play-circle"></i>&nbsp;Fullscreen Slideshow</a></li>
						<li><a href="gallery.html"><i class="icon-picture"></i>&nbsp;Image Gallery</a></li>
					</ul>
				</li>
				<li><a href="calendar.html"><i class="nav-icon-10"></i><span>Calendar</span></a></li>
			</ul>
			<ul id="secondary-nav" class="nav pull-right">
				<li><a data-toggle="modal" href="#myModal"><i class="icon-user icon-white"></i>&nbsp;John
						Doe</a></li>
				<li class="dropdown"><a href="#" data-toggle="dropdown"><i class="icon-cog icon-white">
						</i><span>Settings</span></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="icon-wrench"></i>&nbsp;Site Config</a></li>
						<li><a href="#"><i class="icon-picture"></i>&nbsp;Themes</a></li>
					</ul>
				</li>
				<li><a href="index.html"><i class="icon-off icon-white"></i>&nbsp;Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--Profile Form-->
<div class="modal hide fade" id="myModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">
			×</button>
		<h3>
			Profile</h3>
	</div>
	<div class="modal-body">
		<form class="form-horizontal">
			<legend>Contact Info</legend>
			<div class="control-group">
				<label class="control-label" for="txtContactName">
					Name</label>
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-user"></i></span>
						<input class="span4" id="txtContactName" type="text">
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="txtPhone">
					Phone</label>
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-comment"></i></span>
						<input class="span4" id="txtPhone" type="text">
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="txtEmail">
					E-mail</label>
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-envelope"></i></span>
						<input class="span4" id="txtEmail" type="text">
					</div>
				</div>
			</div>
			<legend>Security Info</legend>
			<div class="control-group">
				<label class="control-label" for="txtLoginID">
					Login ID</label>
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-user"></i></span>
						<input class="span4" id="txtLoginID" type="text" value="admin" disabled>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="txtPassword">
					Password
				</label>
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-lock"></i></span>
						<input class="span4" id="txtPassword" type="password">
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a> <a href="#"
		                                                                             class="btn" data-dismiss="modal">Cancel</a>
	</div>
</div>
<!--Container-->
<div class="container-fluid"><?php
	require 'views/'.$request->controller.'_'.$request->action.'_view.php';
	?></div>
<!--jquery-->
<script src="<?=ASSETS_URL?>jquery/js/jquery-1.7.2.min.js"></script>
<!--bootstrap-->
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-transition.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-alert.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-modal.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-dropdown.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-scrollspy.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-tab.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-tooltip.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-popover.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-button.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-collapse.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-carousel.js"></script>
<script src="<?=ASSETS_URL?>bootstrap/js/bootstrap-typeahead.js"></script>
<!--jquery ui-->
<script src="<?=ASSETS_URL?>jquery/js/jquery.easing.min.js"></script>
<script src="<?=ASSETS_URL?>jquery/js/jquery-ui-1.8.16.custom.min.js"></script>
<!--app-->
<script src="<?=ASSETS_URL?>app/js/script.js"></script>
<!--jquery init-->
<script>
	$('document').ready(function () {
		Dashboard.init();
	});

	//Live Tooltip
	$('body').tooltip({
		selector: '[rel=tooltip]'
	});

	function ShowHelp() {
		window.open('help.html', '', 'height=600,width=800,scrollbars=1,resizable=1');
	}
</script>
</body>
</html>
