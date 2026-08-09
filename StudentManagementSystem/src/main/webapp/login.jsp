<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Student Management System</title>
   <style type="text/css">
   
   /* Reset & Base */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Background */
body {
    height: 100vh;
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Wrapper */
.login-wrapper {
    width: 100%;
    max-width: 400px;
}

/* Card */
.login-card {
    background: #fff;
    padding: 30px 25px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    text-align: center;
}

/* Logo/Icon */
.login-icon {
    width: 60px;
    height: 60px;
    margin: 0 auto 15px;
    background: #4facfe;
    color: white;
    font-size: 22px;
    font-weight: bold;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Heading */
.login-card h1 {
    font-size: 22px;
    margin-bottom: 8px;
    color: #333;
}

/* Subtitle */
.subtitle {
    font-size: 14px;
    color: #777;
    margin-bottom: 20px;
}

/* Form */
.form-group {
    text-align: left;
    margin-bottom: 15px;
}

.form-group label {
    font-size: 14px;
    color: #444;
    display: block;
    margin-bottom: 5px;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    outline: none;
    transition: 0.3s;
}

/* Input focus effect */
.form-group input:focus {
    border-color: #4facfe;
    box-shadow: 0 0 5px rgba(79, 172, 254, 0.5);
}

/* Button */
.btn-login {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 6px;
    background: #4facfe;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

/* Button hover */
.btn-login:hover {
    background: #00c6ff;
}

/* Alerts */
.alert {
    padding: 10px;
    margin-bottom: 15px;
    border-radius: 6px;
    font-size: 14px;
}

.alert-error {
    background: #ffe5e5;
    color: #d8000c;
}

.alert-success {
    background: #e6ffed;
    color: #2e7d32;
}

/* Hint */
.login-hint {
    margin-top: 15px;
    font-size: 12px;
    color: #999;
}
   
   </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-card">
            <div class="login-icon">SM</div>
            <h1>Student Management System</h1>
            <p class="subtitle">Sign in to manage student records</p>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error"><%= request.getAttribute("error") %></div>
            <% } %>

            <% if ("true".equals(request.getParameter("timeout"))) { %>
                <div class="alert alert-error">Your session expired. Please log in again.</div>
            <% } %>

            <% if ("true".equals(request.getParameter("loggedout"))) { %>
                <div class="alert alert-success">You have been logged out successfully.</div>
            <% } %>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required autofocus>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn-login">Sign In</button>
            </form>

            <p class="login-hint">Default admin credentials: admin / admin123</p>
        </div>
    </div>
</body>
</html>
