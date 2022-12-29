<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<title>SYINET - TESTPROJECT</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="title" content="Volt - Free Bootstrap 5 Dashboard">
<meta name="author" content="Themesberg">
<meta name="description" content="Volt Pro is a Premium Bootstrap 5 Admin Dashboard featuring over 800 components, 10+ plugins and 20 example pages using Vanilla JS.">
<meta name="keywords" content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, themesberg, themesberg dashboard, themesberg admin dashboard" />
<link rel="canonical" href="https://themesberg.com/product/admin-dashboard/volt-premium-bootstrap-5-dashboard">

<!-- Favicon -->
<link rel="apple-touch-icon" sizes="120x120" href="../../assets/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="../../assets/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="../../assets/img/favicon/favicon-16x16.png">
<link rel="manifest" href="../../assets/img/favicon/site.webmanifest">
<link rel="mask-icon" href="../../assets/img/favicon/safari-pinned-tab.svg" color="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">

<!-- Sweet Alert -->
<link type="text/css" href="../../vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">

<!-- Notyf -->
<link type="text/css" href="../../vendor/notyf/notyf.min.css" rel="stylesheet">

<!-- Volt CSS -->
<link type="text/css" href="../../css/volt.css" rel="stylesheet">

<!-- JQuery -->
<script src="../js/jquery-3.6.1.min.js"></script>


<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->

</head>

<body>

	<!-- NOTICE: You can use the _analytics.html partial to include production code specific code & trackers -->

	<nav id="sidebarMenu" class="sidebar d-lg-block bg-gray-800 text-white collapse" data-simplebar>
		<div class="sidebar-inner px-4 pt-3">
			<div class="user-card d-flex d-md-none align-items-center justify-content-between justify-content-md-center pb-4">
				<div class="d-flex align-items-center">
					<div class="avatar-lg me-4">
						<img src="../../assets/img/team/profile-picture-3.jpg" class="card-img-top rounded-circle border-white" alt="Bonnie Green">
					</div>
				</div>
				<div class="collapse-close d-md-none"></div>
			</div>
			<ul class="nav flex-column pt-3 pt-md-0">
				<li class="nav-item">
					<a href="/" class="nav-link d-flex align-items-center"> 
						<span class="sidebar-icon"> 
							<img src="../../assets/img/brand/light.svg" height="20" width="20" alt="Volt Logo">
						</span> 
						<span class="mt-1 ms-1 sidebar-text">Test Project</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="/user/userList.do" class="nav-link"> 
						<span class="sidebar-icon"> 
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16" style="margin-bottom: 6px;">
							  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
							  <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
							</svg>
						</span> 
						<span class="sidebar-text">사용자 목록</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="/user/userReg.do" class="nav-link"> 
						<span class="sidebar-icon"> 
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-plus-fill" viewBox="0 0 16 16" style="margin-bottom: 6px;">
							  <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm6.5-11a.5.5 0 0 0-1 0V6H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V7H10a.5.5 0 0 0 0-1H8.5V4.5z"/>
							</svg>
						</span> 
						<span class="sidebar-text">사용자 등록</span>
					</a>
				</li>
			</ul>
		</div>
	</nav>
	<main class="content">
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<div class="card border-0 shadow" style="margin-top: 15px;">
				<div class="container-fluid"  style="width: 100%;">
					<div id="body"><tiles:insertAttribute name="body"/>
							<div class="card-body">
							    
							</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script type="text/javascript">
		$(function(){
			//페이지 전환시 해당 url에 해당하는 nav-item active 적용
			$('.nav-item').find('a[href="' + document.location.pathname + '"]').parents('li').addClass('active');
		});
	</script>
	
	

	<!-- Core -->
	<script src="../../vendor/@popperjs/core/dist/umd/popper.min.js"></script>
	<script src="../..//vendor/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Vendor JS -->
	<script src="../../vendor/onscreen/dist/on-screen.umd.min.js"></script>

	<!-- Slider -->
	<script src="../../vendor/nouislider/dist/nouislider.min.js"></script>

	<!-- Smooth scroll -->
	<script
		src="../../vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

	<!-- Charts -->
	<script src="../../vendor/chartist/dist/chartist.min.js"></script>
	<script
		src="../../vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>

	<!-- Datepicker -->
	<script
		src="../../vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>

	<!-- Sweet Alerts 2 -->
	<script src="../../vendor/sweetalert2/dist/sweetalert2.all.min.js"></script>

	<!-- Moment JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>

	<!-- Vanilla JS Datepicker -->
	<script
		src="../../vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>

	<!-- Notyf -->
	<script src="../../vendor/notyf/notyf.min.js"></script>

	<!-- Simplebar -->
	<script src="../../vendor/simplebar/dist/simplebar.min.js"></script>

	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<!-- Volt JS -->
	<script src="../../assets/js/volt.js"></script>


</body>

</html>