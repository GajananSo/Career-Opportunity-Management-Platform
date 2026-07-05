<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title> User Profile | COMP Portal </title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user-profile.css">

</head>

<body>

<%
if(session.getAttribute("user")==null){

	response.sendRedirect("login.jsp");
	return;
}
%>

<!-- Background Effects -->

<div class="bg-blur blur1"></div>
<div class="bg-blur blur2"></div>
<div class="bg-blur blur3"></div>

<!-- Navbar -->

<nav class="navbar">

	<h1 class="nav-logo">

		COMP <span>Portal</span>

	</h1>

	<div class="nav-links">

		<a href="user-dashboard.jsp"> Dashboard </a>

		<a href="viewjob"> View Jobs </a>

		<a href="logout"> Logout </a>

	</div>

</nav>

<!-- Main Container -->

<section class="profile-container">

	<!-- Left Panel -->

	<div class="left-panel">

		<span class="tag"> Job Seeker Profile </span>

		<h1> My Profile </h1>

		<p>
			
			View and manage your profile
			information professionally using
			COMP Portal.

		</p>

		<div class="info-card">

			<h3> Quick Tips </h3>

			<ul>

				<li> Keep profile updated </li>

				<li> Use valid email </li>

				<li> Keep password secure </li>

				<li> Update details regularly </li>

			</ul>

		</div>

	</div>

	<!-- Right Panel -->

	<div class="profile-card">

		<div class="profile-header">

			<div class="profile-avatar">

				${user.name.charAt(0)}

			</div>

			<h2>

				Profile Details

			</h2>

		</div>

		<div class="profile-info">

			<div class="info-box">

				<label>
					User ID
				</label>

				<input
				type="text"
				value="${user.id}"
				readonly>

			</div>

			<div class="info-box">

				<label>
					Full Name
				</label>

				<input
				type="text"
				value="${user.name}"
				readonly>

			</div>

			<div class="info-box">

				<label>
					Email
				</label>

				<input
				type="email"
				value="${user.email}"
				readonly>

			</div>

			<div class="info-box">

				<label>
					Password
				</label>

				<input
				type="password"
				value="${user.password}"
				readonly>

			</div>

			<div class="info-box">

				<label>
					Role
				</label>

				<input
				type="text"
				value="${user.role}"
				readonly>

			</div>

		</div>

		<div class="button-group">

			<form action="userProfileEdit">

				<input type="hidden" name="id" value="${user.id}">

				<button class="edit-btn"> Edit Profile </button>

			</form>

		</div>

	</div>

</section>

<!-- Footer -->

<footer>

	<h3>
		COMP Portal
	</h3>

	<p>
		Build Your Career With Confidence
	</p>

</footer>

</body>
</html>