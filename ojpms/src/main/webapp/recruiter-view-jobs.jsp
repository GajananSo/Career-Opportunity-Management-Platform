<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title> My Posted Jobs | COMP Portal </title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/recruiter-view-jobs.css">

</head>

<body>

<nav class="navbar">

	<h1 class="nav-logo">
		COMP <span>Portal</span>
	</h1>

	<div class="nav-links">

		<a href="recruiter-dashboard.jsp">Dashboard</a>
		<a href="logout">Logout</a>

	</div>

</nav>

<div class="page-header">

	<div>

		<h1>
			My Posted Jobs
		</h1>

		<p>
			Manage and track
			your active job postings
		</p>

	</div>

</div>


<div class="stats-section">

	<div class="stat-card">

		<h2>
			${RecJobs.size()}
		</h2>

		<p>
			Total Jobs Posted
		</p>

	</div>

	<div class="stat-card">

		<h2>
			Active
		</h2>

		<p>
			Hiring Status
		</p>

	</div>

</div>


<div class="jobs-container">

<c:forEach var="s" items="${RecJobs}">

	<div class="job-card">

		<div class="job-top">

			<div>

				<h2>
					${s.title}
				</h2>

				<p class="company">

					COMP Portal Recruitment

				</p>

			</div>

			<span class="status">

				Active Hiring

			</span>

		</div>


		<div class="job-info">

			<p>

				<span>
					Description:
				</span>

				${s.description}

			</p>

			<p>

				<span>
					Location:
				</span>

				${s.location}

			</p>

			<p>

				<span>
					Salary:
				</span>

				₹${s.salary}

			</p>

		</div>


		<div class="job-footer">

			<form action="editJobByRecruiter">

				<input type="hidden" name="jobId" value="${s.id}">
				<button type="submit" class="edit-btn"> Edit Job </button>

			</form>
			
			
			<form action="viewApplicants">

				<input type="hidden" name="jobId" value="${s.id}">
				<button type="submit" class="edit-btn"> Total Applicant </button>

			</form>
			
			
			
			<form action="deleteJobByRecruiter">

				<input type="hidden" name="jobId" value="${s.id}">
				<button type="submit" class="delete-btn">Delete</button>

			</form>

		</div>

	</div>

</c:forEach>

</div>

</body>
</html>