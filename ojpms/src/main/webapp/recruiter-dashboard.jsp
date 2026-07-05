<%@ page language="java" contentType="text/html;
charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Recruiter Dashboard | COMP Portal</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/recruiter-dashboard.css">

</head>

<body>

	<%
	if (session.getAttribute("user") == null){
		response.sendRedirect("login.jsp");
		return;
	}
	%>

<% if(request.getAttribute("successMessage") != null){ %>

    <div id="popupSuccess" class="popup success-popup">

    <%= request.getAttribute("successMessage") %>

	</div>

    <script>
        setTimeout(function() {
            document.getElementById("popupSuccess")
                    .style.display = "none";
        }, 3000);
    </script>

<% } %>


<% if(request.getAttribute("errorMessage") != null){ %>

    <div id="popupError" class="popup error-popup">

        <%= request.getAttribute("errorMessage") %>

    </div>

    <script>
        setTimeout(function() {
            document.getElementById("popupError")
                    .style.display = "none";
        }, 3000);
    </script>

<% } %>

	<!-- Background Blur -->

	<div class="bg-blur blur1"></div>
	<div class="bg-blur blur2"></div>
	<div class="bg-blur blur3"></div>

	<!-- Navbar -->

	<header>

		<nav class="navbar">

			<h1 class="nav-logo">
   				 COMP <span>Portal</span>
			</h1>

			<div class="nav-links">

				 <a href="post-job.jsp"> Post Job </a>
				 <a href="viewRecruiterJobs?id=${user.id}">View Jobs</a>
				 <a href="profile?id=${user.id}"> Profile </a>
				 <a href="logout"> Logout </a>

			</div>

		</nav>

	</header>

	<!-- Dashboard Hero -->

	<section class="dashboard">

		<div class="dashboard-left">

			<span class="tag"> Recruiter Panel </span>

			<h1>Welcome, ${user.name}</h1>

			<p>Manage job postings, find top candidates, and hire efficiently
				using OJPMS.</p>

			<div class="dashboard-buttons">

				<a href="post-job.jsp" class="btn"> Post New Job </a>

			</div>

		</div>

		<div class="dashboard-right">

			<div class="glass-card">

				<h3>Quick Overview</h3>

				<p>Total Jobs Posted</p>

				<%-- <h2>${CurrJobCount}</h2> --%>
				<h2>13</h2>

				<p>Applications Received</p>

				<h2>120+</h2>

			</div>

		</div>

	</section>

	<!-- Quick Features -->

	<section class="features">

		<h2>Recruiter Features</h2>

		<div class="card-container">

			<div class="card">

				<h3>Post Jobs</h3>

				<p>Create and publish new job openings.</p>

			</div>

			<div class="card">

				<h3>Manage Jobs</h3>

				<p>Update or remove job listings easily.</p>

			</div>

			<div class="card">

				<h3>View Applicants</h3>

				<p>Check candidate applications quickly.</p>

			</div>

			<div class="card">

				<h3>Hiring Analytics</h3>

				<p>Track recruitment progress effectively.</p>

			</div>

		</div>

	</section>

	<!-- Footer -->

	<footer>

    <h3 class="nav-logo">
        COMP <span>Portal</span>
    </h3>

    <p>
        Recruiter Dashboard
    </p>

	</footer>

</body>
</html>