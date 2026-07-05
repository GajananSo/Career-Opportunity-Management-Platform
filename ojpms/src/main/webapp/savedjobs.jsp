<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Saved Jobs | COMP Portal</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/viewjob.css">

</head>

<body>

	<%
	if (session.getAttribute("user") == null) {

		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<!-- Background -->

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
		    <a href="userProfile?id=${user.id}"> Profile </a> 
		    <a href="logout"> Logout </a>

		</div>

	</nav>

	<!-- Header -->

	<section class="page-header">

		<div>

			<span class="tag"> Saved Opportunities </span>

			<h1>Saved Jobs</h1>

			<p>View and manage jobs you saved for later application.</p>

		</div>

	</section>

	<!-- Saved Jobs Section -->

	<section class="jobs-section">

		<c:choose>

			<c:when test="${empty user.savedJobs}">

				<div class="no-jobs">

					<h2>No Saved Jobs</h2>

					<p>You haven’t saved any jobs yet.</p>

					<br> <a href="viewjob" class="refresh-btn"> Browse Jobs </a>

				</div>

			</c:when>

			<c:otherwise>

				<div class="jobs-grid">

					<c:forEach var="job" items="${user.savedJobs}">

						<div class="job-card">

							<h2>${job.title}</h2>

							<p>

								<span> Description: </span> ${job.description}

							</p>

							<p>

								<span> Location: </span> ${job.location}

							</p>

							<p>

								<span> Salary: </span> ₹${job.salary}

							</p>

							<!-- Apply Button -->

							<form action="apply" method="post">

								<input type="hidden" name="jobId" value="${job.id}">

								<button type="submit" class="apply-btn">Apply Now</button>

							</form>

							<!-- Remove Saved Job -->

							<form action="unsavejob" method="post">

								<input type="hidden" name="jobId" value="${job.id}">

								<button type="submit" class="unsave-btn">Remove</button>

							</form>

						</div>

					</c:forEach>

				</div>

			</c:otherwise>

		</c:choose>

	</section>

	<!-- Footer -->

	<footer>

		<h3>COMP Portal</h3>

		<p>Build Your Career With Confidence</p>

	</footer>

</body>
</html>