<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Edit Profile | COMP Portal</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/edit-profile.css">

</head>

<body>

<%
if(session.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
}
%>

<!-- Background Blur -->

<div class="bg-blur blur1"></div>
<div class="bg-blur blur2"></div>
<div class="bg-blur blur3"></div>

<!-- Navbar -->

<nav class="navbar">

	<h1 class="nav-logo">
		COMP <span>Portal</span>
	</h1>

	<div class="nav-links">

		<a href="recruiter-dashboard.jsp">
			Dashboard
		</a>

		<a href="profile?id=${user.id}">
			Profile
		</a>

		<a href="logout">
			Logout
		</a>

	</div>

</nav>

<!-- Main Container -->

<section class="profile-edit-container">

	<!-- Left Panel -->

	<div class="left-panel">

		<span class="tag">
			Recruiter Profile
		</span>

		<h1>
			Edit Profile
		</h1>

		<p>
			Update your recruiter profile
			information professionally
			using COMP Portal.
		</p>

		<div class="info-card">

			<h3>
				Quick Tips
			</h3>

			<ul>

				<li>
					Keep your profile updated
				</li>

				<li>
					Use valid email address
				</li>

				<li>
					Keep password secure
				</li>

				<li>
					Maintain accurate information
				</li>

			</ul>

		</div>

	</div>

	<!-- Right Form Card -->

	<div class="edit-card">

		<div class="edit-header">

			<div class="edit-avatar">

				${user.name.substring(0,1)}

			</div>

			<h2>
				Update Profile
			</h2>

		</div>

		<form action="updateProfile" method="post">

			<div class="form-group">

				<label>
					ID
				</label>

				<input
				type="text"
				name="id"
				value="${user.id}"
				readonly>

			</div>

			<div class="form-group">

				<label>
					Full Name
				</label>

				<input
				type="text"
				name="name"
				value="${user.name}"
				required>

			</div>

			<div class="form-group">

				<label>
					Email Address
				</label>

				<input
				type="email"
				name="email"
				value="${user.email}"
				required>

			</div>

			<div class="form-group">

				<label>
					Password
				</label>

				<input
				type="password"
				name="password"
				value="${user.password}"
				required>

			</div>

			<div class="form-group">

				<label>
					Role
				</label>

				<input
				type="text"
				name="role"
				value="${user.role}"
				readonly>

			</div>

			<button
			type="submit"
			class="btn">

				Update Profile

			</button>

		</form>

	</div>

</section>

</body>
</html>