<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Available Jobs | COMP Portal</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/viewjob.css">

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
			<a href="userProfile?id=${user.id}"> Profile </a> 
			<a href="logout"> Logout </a>

		</div>

	</nav>

	<!-- Header -->

	<section class="page-header">

		<div>

			<span class="tag"> Job Seeker Portal </span>

			<h1>Available Jobs</h1>

			<p>Explore opportunities and apply instantly using COMP Portal.</p>

		</div>

	</section>

	<!-- Search -->

	<section class="search-section">

		<form action="search" method="get" class="search-box">

			<input type="text" name="search"
				placeholder="Search by title, skill or location">

			<button type="submit" class="search-btn">Search</button>

			<a href="viewjob" class="refresh-btn"> Refresh Jobs </a>

		</form>

	</section>


	<!-- Sort Section -->
	<section class="sort-section">

		<span class="sort-label">Sort Jobs</span>

		<div class="sort-buttons">

			<a href="viewjob?sortBy=latest" class="sort-btn ${sortBy == null || sortBy == 'latest' ? 'active' : ''}"> Latest Jobs </a> 
			<a href="viewjob?sortBy=salary" class="sort-btn ${sortBy == 'salary' ? 'active' : ''}"> HighestSalary </a> 
			<a href="viewjob?sortBy=applied" class="sort-btn ${sortBy == 'applied' ? 'active' : ''}"> MostApplied </a>

		</div>

	</section>


	<!-- Jobs Grid -->

	<section class="jobs-section">

		<c:choose>

			<c:when test="${empty jobs}">

				<div class="no-jobs">

					<h2>No Jobs Found</h2>

					<p>Try a different search.</p>

				</div>

			</c:when>

			<c:otherwise>

				<div class="jobs-grid">

					<c:forEach var="job" items="${jobs}">

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

							<form action="apply" method="post">

								<input type="hidden" name="jobId" value="${job.id}">

								<button type="submit" class="apply-btn">Apply Now</button>

							</form>
							
							<!-- ********************** Save Job Form    ******************************   -->
							<form action="savejob" method="post" class="save-form">

								<input type="hidden" name="jobId" value="${job.id}">

								<button type="submit" class="save-btn">Save Job</button>

							</form>
							
							<!-- ************************** Save Job Form    ******************************   -->

							<c:if test="${appliedId == job.id && not empty error}">

								<div class="error-message">${error}</div>

							</c:if>

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