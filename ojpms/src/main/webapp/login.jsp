<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | COMP Portal</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
</head>
<body>
<div class="container">

    <div class="left-panel">
        <h1>COMP Portal</h1>

        <h2>Build Your Career With Confidence</h2>

        <p>
            Explore opportunities, connect with recruiters,
            and manage applications through a modern job portal.
        </p>

        <div class="features">
            <div>✓ Search Jobs</div>
            <div>✓ Easy Apply</div>
            <div>✓ Email Notifications</div>
            <div>✓ Recruiter Access</div>
        </div>
    </div>

    <div class="right-panel">

        <div class="login-card">

            <h2>Welcome Back</h2>

            <p class="subtitle">
                Sign in to continue
            </p>

            <form action="login" method="post">

                <input type="email"
                       name="email"
                       placeholder="Email Address">

                <input type="password"
                       name="password"
                       placeholder="Password">

                <input type="submit"
                       value="Login"
                       class="login-btn">

            </form>

            <a href="reset.jsp" class="forgot">
                Forgot Password?
            </a>

            <p class="error">${error}</p>
            <p class="success">${successMsg}</p>

        </div>

    </div>

</div>
</body>
</html>