<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/register.css">
<title>Create Account | COMP Portal</title>


</head>

<body>

	<!-- HOME BUTTON -->
	<a href="home.jsp" class="home-btn">🏠 Home</a>
	<!-- LEFT PANEL -->

	<div class="left-panel">

		<div class="logo">
			COMP <span>Portal</span>
		</div>

		<div class="left-body">

			<div class="left-tag">Online Job Portal</div>

			<h1 class="left-title">

				Build your career with <strong> confidence. </strong>

			</h1>

			<p class="left-sub">Join thousands of job seekers and recruiters
				on one smart platform.</p>

			<div class="features">

				<div class="feature">
					<div class="dot"></div>
					1000+ Live Jobs
				</div>

				<div class="feature">
					<div class="dot"></div>
					One Click Apply
				</div>

				<div class="feature">
					<div class="dot"></div>
					Recruiter Dashboard
				</div>

			</div>

		</div>

		<div class="left-footer">© 2026 COMP Portal. All Rights
			Reserved.</div>

	</div>

	<!-- RIGHT PANEL -->

	<div class="right-panel">

		<div class="form-wrap">

			<h2 class="form-title">Create Account</h2>

			<p class="form-sub">Create your COMP account below.</p>

			<form action="register" method="post">

				<div class="field">

					<label> Name </label> <input type="text" name="name"
						placeholder="Enter full name" required>

				</div>

				<div class="field">

					<label> Email </label> <input type="email" name="email"
						placeholder="your@email.com" required>

				</div>

				<div class="field">

					<label> Password </label>

					<div class="password-box">

						<input type="password" name="password" id="password"
							placeholder="Create password" required> <span
							onclick="togglePassword()"> 👁 </span>

					</div>

				</div>

				<div class="field">

					<label>Role</label> <select name="role" required>

						<option value="" disabled selected>Select Role</option>

						<option value="JOB_SEEKER">Job Seeker</option>

						<option value="RECRUITER">Recruiter</option>

					</select>

				</div>

				<button type="submit" class="submit-btn">Create Account</button>

			</form>

			<div class="bottom-links">

				Already have an account? <a href="login.jsp"> Sign In </a>

			</div>

		</div>

	</div>

	<script>
		function togglePassword() {

			let password = document.getElementById("password");

			if (password.type === "password") {

				password.type = "text";

			} else {

				password.type = "password";
			}
		}
	</script>

</body>
</html>
