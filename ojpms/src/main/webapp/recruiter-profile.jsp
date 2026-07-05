
<%@ page language="java" contentType="text/html;
charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>User Profile | COMP Portal</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/recruiter-profile.css">

</head>

<body>

<%
if(session.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
}
%>


<nav class="navbar">

	<h1 class="nav-logo">
		COMP <span>Portal</span>
	</h1>

	<div class="nav-links">

		<a href="recruiter-dashboard.jsp">
			Dashboard
		</a>

		<a href="viewRecruiterJobs?id=${user.id}">
			View Jobs
		</a>

		<a href="logout">
			Logout
		</a>

	</div>

</nav>


<div class="background-blur blur1"></div>
<div class="background-blur blur2"></div>

<div class="recruiter-container">

	<!-- HEADER -->
	<div class="recruiter-cover">

		<div class="avatar-section">

			<div class="avatar">

				${user.name.charAt(0)}

			</div>

			<div class="profile-info">

				<h1>
					${user.name}
				</h1>

				<div class="recruiter-badge">

					RECRUITER

				</div>

				<p>
					${user.email}
				</p>

			<!-- 	<span class="status">
					● Active Hiring
				</span> -->

			</div>

		</div>

	</div>

	<!-- DASHBOARD -->
	<div class="dashboard-content">

		<!-- QUICK STATS -->
		<div class="stats-grid">

			<div class="stat-card">

				<h2>25+</h2>

				<p>
					Jobs Posted
				</p>

			</div>

			<div class="stat-card">

				<h2>180+</h2>

				<p>
					Candidates
				</p>

			</div>

			<div class="stat-card">

				<h2>45</h2>

				<p>
					Interviews Scheduled
				</p>

			</div>

			<div class="stat-card">

				<h2>12</h2>

				<p>
					Open Positions
				</p>

			</div>

		</div>

		<!-- MAIN GRID -->
		<div class="main-grid">

			<!-- PROFILE INFO -->
			<div class="card">

				<h2>
					Recruiter Information
				</h2>

				<div class="detail-row">

					<span>User ID</span>

					<strong>
						#${user.id}
					</strong>

				</div>

				<div class="detail-row">

					<span>Full Name</span>

					<strong>
						${user.name}
					</strong>

				</div>

				<div class="detail-row">

					<span>Email</span>

					<strong>
						${user.email}
					</strong>

				</div>

				<div class="detail-row">

					<span>Password</span>

					<strong>
						********
					</strong>

				</div>

				<div class="detail-row">

					<span>Role</span>

					<strong>
						${user.role}
					</strong>

				</div>

			</div>

			<!-- HIRING INSIGHTS -->
			<div class="card">

				<h2>
					Hiring Insights
				</h2>

				<div class="insight-box">

					<span>
						 Most Hiring Role
					</span>

					<h3>
						Software Engineer
					</h3>

				</div>

				<div class="insight-box">

					<span>
						 Candidate Response Rate
					</span>

					<h3>
						84%
					</h3>

				</div>

				<div class="insight-box">

					<span>
						 Recruitment Efficiency
					</span>

					<h3>
						Excellent
					</h3>

				</div>

			</div>

		</div>

		<!-- ACTIONS -->
		<div class="action-buttons">

			<form action="editProfile">

				<input
				type="hidden"
				name="id"
				value="${user.id}">

				<button type="submit" class="primary-btn">

					Edit Profile

				</button>

			</form>

			<!-- <a
			href="post-job.jsp"
			class="secondary-btn">

				Post Job

			</a> -->

		</div>

	</div>

</div>

</body>
</html>