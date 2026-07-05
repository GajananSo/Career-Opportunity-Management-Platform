<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMP Portal - Home</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/home.css">

</head>

<body>

	<!-- Background Effects -->

	<div class="bg-blur blur1"></div>
	<div class="bg-blur blur2"></div>
	<div class="bg-blur blur3"></div>

	<!-- Header -->

	<header>

		<nav class="navbar">

			<h1 class="nav-logo">
    			COMP <span>Portal</span>
			</h1>

			<div class="nav-links">

				<a href="register.jsp">
					 Create Account
				</a>

				<a href="login.jsp">
					 Sign In
				</a>

			</div>

		</nav>

	</header>

	<!-- Hero Section -->

	<section class="hero">

		<div class="hero-left">

			<span class="tag">
				#1 Smart Job Portal
			</span>

			<h1>
   				 Build Your Career
    			 <br>
    			 With Confidence
			</h1>

			<p>
				  A modern platform where job seekers explore
    			  opportunities and recruiters hire top
     			  talent efficiently.	
			</p>

			<div class="hero-buttons">

				<a href="register.jsp"
				class="btn">

					Get Started

				</a>

				<a href="login.jsp"
				class="btn-outline">

					Explore Jobs

				</a>

			</div>

		</div>

		<div class="hero-right">

			<div class="glass-card">

				<h3>
					Trending Jobs
				</h3>

				<p>
					Java Developer
				</p>

				<p>
					Full Stack Developer
				</p>

				<p>
					QA Engineer
				</p>

				<p>
					UI/UX Developer
				</p>

			</div>

		</div>

	</section>

<!-- Trusted Companies -->

<section class="companies">

    <p class="company-title">
        Trusted By Top Companies
    </p>

    <div class="company-slider">

        <div class="company-track">

            <span>Google</span>
			<span>Amazon</span>
			<span>TCS</span>
			<span>Infosys</span>

			<!-- duplicate -->
			<span>Google</span>
			<span>Amazon</span>
			<span>TCS</span>
			<span>Infosys</span>

        </div>

    </div>

</section>


	<!-- About -->

	<section class="about">

		<h2>
			Why Choose COMP Portal?
		</h2>

		<p>
			COMP Portal simplifies the
			hiring process by
			connecting job seekers
			and recruiters on one
			powerful platform.
		</p>

	</section>

	<!-- Features -->

	<section class="features">

		<h2>
			Our Features
		</h2>

		<div class="card-container">

			<div class="card">

				<h3>
					Job Search
				</h3>

				<p>
					Search jobs based
					on skills, location
					and experience.
				</p>

			</div>

			<div class="card">

				<h3>
					Easy Apply
				</h3>

				<p>
					Apply instantly
					with one click.
				</p>

			</div>

			<div class="card">

				<h3>
					Email Alerts
				</h3>

				<p>
					Get instant email
					notifications.
				</p>

			</div>

			<div class="card">

				<h3>
					Recruiter Access
				</h3>

				<p>
					Post jobs and
					manage candidates
					easily.
				</p>

			</div>

		</div>

	</section>

	<!-- Workflow -->

	<section class="workflow">

		<h2>
			How COMP Portal Works?
		</h2>

		<p class="workflow-text">

			Simple and smooth
			job hiring process.

		</p>

		<div class="timeline">

			<div class="timeline-item">

				<div class="circle">
					1
				</div>

				<h3>
					Register
				</h3>

				<p>
					Create account
					quickly.
				</p>

			</div>

			<div class="line"></div>

			<div class="timeline-item">

				<div class="circle">
					2
				</div>

				<h3>
					Login
				</h3>

				<p>
					Access securely.
				</p>

			</div>

			<div class="line"></div>

			<div class="timeline-item">

				<div class="circle">
					3
				</div>

				<h3>
					Search Jobs
				</h3>

				<p>
					Explore jobs.
				</p>

			</div>

			<div class="line"></div>

			<div class="timeline-item">

				<div class="circle">
					4
				</div>

				<h3>
					Apply
				</h3>

				<p>
					One click apply.
				</p>

			</div>

			<div class="line"></div>

			<div class="timeline-item">

				<div class="circle">
					5
				</div>

				<h3>
					Email Alert
				</h3>

				<p>
					Get confirmation.
				</p>

			</div>

		</div>

	</section>

	<!-- Stats -->

	<section class="stats">

		<div class="stat-box">

			<h2>
				1000+
			</h2>

			<p>
				Jobs Posted
			</p>

		</div>

		<div class="stat-box">

			<h2>
				500+
			</h2>

			<p>
				Companies
			</p>

		</div>

		<div class="stat-box">

			<h2>
				2000+
			</h2>

			<p>
				Users Registered
			</p>

		</div>

	</section>

	<!-- CTA -->

	<section class="cta">

    <h2>
        Ready To Start
        Your Career?
    </h2>

    <p>
        Register today and
        find opportunities
        that match your skills.
    </p>

    <a href="register.jsp"
    class="btn">

        Get Started

    </a>

</section>

	<!-- Footer -->

	<footer>

		<h3 class="nav-logo">
    		COMP <span>Portal</span>
		</h3>

		<p>
			Build Your Career
			With Confidence
		</p>

	</footer>

</body>
</html>