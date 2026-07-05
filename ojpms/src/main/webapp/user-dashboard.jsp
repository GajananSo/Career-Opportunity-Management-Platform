<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Job Seeker Dashboard | COMP Portal</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/user-dashboard.css">

</head>

<body>

	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<%
	String successMessage = (String) session.getAttribute("successMessage");

	if (successMessage != null) {
	%>

	<div id="popupSuccess" class="success-popup">

		<%=successMessage%>

	</div>

	<script>
		setTimeout(function() {
			document.getElementById("popupSuccess").style.display = "none";
		}, 3000);
	</script>

	<%
	session.removeAttribute("successMessage");
	}
	%>

	<!-- Background Effects -->

	<div class="bg-blur blur1"></div>
	<div class="bg-blur blur2"></div>
	<div class="bg-blur blur3"></div>

	<!-- Navbar -->

	<nav class="navbar">

		<h1 class="nav-logo">

			COMP <span> Portal </span>

		</h1>

		<div class="nav-links">

			<a href="viewjob"> View Jobs </a> 
			<a href="savedjobs.jsp"> Saved Jobs </a>
			<a href="userProfile?id=${user.id}"> Profile </a> 
			<a href="logout"> Logout </a>

		</div>

	</nav>

	<!-- Dashboard -->

	<section class="dashboard">

		<!-- Left Side -->

		<div class="dashboard-left">

			<span class="tag"> Job Seeker Portal </span>

			<h1>Welcome, ${user.name}</h1>

			<p>Explore top job opportunities, apply instantly, and track your
				career journey with COMP Portal.</p>

			<div class="dashboard-buttons">

				<a href="viewjob" class="btn"> View Jobs </a>

			</div>

		</div>

		<!-- Right Side -->

		<div class="dashboard-right">

			<div class="glass-card">

				<h3>Quick Overview</h3>

				<p>Available Jobs</p>

				<h2>100+</h2>

				<p>Top Companies</p>

				<h2>50+</h2>

				<p>Career Growth</p>

				<h2>Unlimited</h2>

			</div>

		</div>

	</section>

	<!-- Features -->

	<section class="features">

		<h2>Why Choose COMP Portal?</h2>

		<div class="card-container">

			<div class="card">

				<h3>Explore Jobs</h3>

				<p>Find jobs based on skills, experience and location.</p>

			</div>

			<div class="card">

				<h3>Easy Apply</h3>

				<p>Apply instantly with one click process.</p>

			</div>

			<div class="card">

				<h3>Top Recruiters</h3>

				<p>Connect with trusted companies and recruiters.</p>

			</div>

			<div class="card">

				<h3>Career Growth</h3>

				<p>Build your future with better opportunities.</p>

			</div>

		</div>

	</section>

	<!-- Footer -->

	<footer>

		<h3>COMP Portal</h3>

		<p>Build Your Career With Confidence</p>

	</footer>

</body>
</html>