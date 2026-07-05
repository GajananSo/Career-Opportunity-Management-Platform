<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Applicants | COMP Portal</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/view-applicants.css">

</head>
<body>

	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<!-- Navbar -->

	<nav class="navbar">

		<h1 class="logo">
			COMP <span>Portal</span>
		</h1>

		<div class="nav-links">

			<a href="recruiter-dashboard.jsp">Dashboard</a> <a
				href="userProfile?id=${user.id}">Profile</a> <a href="logout">Logout</a>

		</div>

	</nav>

	<!-- Header -->

	<div class="header">

		<h1>Job Applicants</h1>

		<p>View all candidates who applied for this job.</p>

	</div>

	<!-- Applicants Section -->

	<div class="container">

		<c:choose>

			<c:when test="${empty applicants}">

				<div class="empty-card">

					<h2>No Applicants Yet</h2>

					<p>No candidates have applied for this job.</p>

				</div>

			</c:when>

			<c:otherwise>

				<div class="applicants-grid">

					<c:forEach var="applicant" items="${applicants}">

						<div class="applicant-card">

							<h2>${applicant.user.name}</h2>

							<p>
								<strong>Email :</strong> ${applicant.user.email}
							</p>

							<p>
								<strong>Status :</strong> ${applicant.status}
							</p>

							<div class="btn-group">

								<form action="updateApplicationStatus" method="post">
									<!-- Accept -->

									<input type="hidden" name="applicationId" value="${applicant.id}">

									<input type="hidden" name="jobId" value="${applicant.job.id}">

									<input type="hidden" name="status" value="ACCEPTED">
									
									<button type="submit" class="select-btn">Select</button>

								</form>

								<form action="updateApplicationStatus" method="post">
								
									<input type="hidden" name="applicationId" value="${applicant.id}">

									<input type="hidden" name="jobId" value="${applicant.job.id}">

									<input type="hidden" name="status" value="REJECTED">

									<button type="submit" class="reject-btn">Reject</button>
								</form>

							</div>

						</div>

					</c:forEach>

				</div>

			</c:otherwise>

		</c:choose>

	</div>

</body>
</html>