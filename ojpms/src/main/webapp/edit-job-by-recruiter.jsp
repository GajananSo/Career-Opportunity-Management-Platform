
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Job | COMP Portal</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/edit-job.css">

</head>

<body>

	<div class="bg-blur blur1"></div>
	<div class="bg-blur blur2"></div>
	<div class="bg-blur blur3"></div>

	<!-- Navbar -->

	<nav class="navbar">

		<h1 class="nav-logo">
			COMP <span>Portal</span>
		</h1>

		<div class="nav-links">

			<a href="recruiter-dashboard.jsp"> Dashboard </a> <a href="logout">
				Logout </a>

		</div>

	</nav>

	<!-- Main Section -->

	<section class="post-job-container">

		<!-- Left Panel -->

		<div class="left-panel">

			<span class="tag"> Recruiter Portal </span>

			<h1>Edit Job</h1>

			<p>Update your job posting professionally using COMP Portal.</p>

			<div class="info-card">

				<h3>Quick Tips</h3>

				<ul>

					<li>Update salary properly</li>

					<li>Keep title clear</li>

					<li>Edit location carefully</li>

					<li>Add accurate description</li>

				</ul>

			</div>

		</div>

		<!-- Edit Form -->

		<div class="post-job-card">

			<h2>Update Job Details</h2>

			<form action="updateJobByRecruiter" method="post">

				<!-- Row 1 -->

				<div class="row">

					<div class="input-group">

						<label> Job ID </label> <input type="text" name="id"
							value="${jobObj.id}" readonly>

					</div>

					<div class="input-group">

						<label> Salary </label> <input type="number" name="salary"
							value="${jobObj.salary}" required>

					</div>

				</div>

				<!-- Row 2 -->

				<div class="row">

					<div class="input-group">

						<label> Job Title </label> <input type="text" name="title"
							value="${jobObj.title}" required>

					</div>

					<div class="input-group">

						<label> Location </label> <input type="text" name="location"
							value="${jobObj.location}" required>

					</div>

				</div>

				<!-- Description -->

				<div class="input-group">

					<label> Job Description </label>

					<textarea name="description" rows="6" required>${jobObj.description}</textarea>

				</div>

				<input type="hidden" name="recId" value="${jobObj.recuriter.id}">

				<!-- Buttons -->

				<div class="button-group">

					<a href="viewRecruiterJobs?id=${jobObj.recuriter.id}"
						class="cancel-btn"> Cancel </a>

					<button type="submit" class="update-btn">Update Job</button>

				</div>

			</form>

		</div>

	</section>

</body>
</html>