<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Post Job - COMP Portal</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/post-job.css">

</head>

<body>

	<%
	if (session.getAttribute("user") == null){
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

			<a href="recruiter-dashboard.jsp"> Dashboard </a> 
			<a href="logout">
				Logout </a>

		</div>

	</nav>

	<!-- Main Section -->

	<section class="post-job-container">

		<!-- Left Content -->

		<div class="left-panel">

			<span class="tag"> Recruiter Portal </span>

			<h1>Post New Job</h1>

			<p>Create professional job postings and hire the best candidates
				faster using COMP Portal.</p>

			<div class="info-card">

				<h3>Quick Tips</h3>

				<ul>
					<li>Use clear job title</li>
					<li>Add required skills</li>
					<li>Mention salary details</li>
					<li>Provide deadline</li>
				</ul>

			</div>

		</div>

		<!-- Form Card -->

		<div class="post-job-card">

			<h2>Create Job Posting</h2>

			<form action="postjob" method="post">

				<div class="row">

					<div class="input-group">

						<label> Job Title </label> <input type="text" name="title"
							placeholder="Java Developer" required>

					</div>

				</div>

				<div class="input-group">

					<label> Description </label>

					<textarea 
						name="description"
						rows="5"
						placeholder="Enter job description"
						required></textarea>

				</div>

				<div class="row">

					<div class="input-group">

						<label> Location </label> <input type="text" name="location"
							placeholder="Pune" required>

					</div>

					<div class="input-group">

						<label> Salary </label> <input type="number" name="salary"
							placeholder="500000" required>

					</div>

				</div>

				<button type="submit" class="btn">Post Job</button>

			</form>

		</div>

	</section>

</body>
</html>