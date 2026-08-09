<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error | Student Management System</title>
   <style type="text/css">
   /* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Background */
body {
    height: 100vh;
    background: linear-gradient(135deg, #ff6a6a, #ffb3b3);
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
    background: white;
    padding: 30px 25px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    text-align: center;
    border-top: 5px solid #c0392b;
}

/* Error Icon */
.login-icon {
    width: 65px;
    height: 65px;
    margin: 0 auto 15px;
    background: #c0392b;
    color: white;
    font-size: 26px;
    font-weight: bold;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    animation: shake 0.6s ease;
}

/* Heading */
.login-card h1 {
    font-size: 22px;
    color: #c0392b;
    margin-bottom: 8px;
}

/* Subtitle */
.subtitle {
    font-size: 14px;
    color: #777;
    margin-bottom: 20px;
}

/* Button */
.btn-login {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 6px;
    background: #c0392b;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

.btn-login:hover {
    background: #a93226;
}

/* Animation (small UX touch) */
@keyframes shake {
    0% { transform: translateX(0); }
    25% { transform: translateX(-4px); }
    50% { transform: translateX(4px); }
    75% { transform: translateX(-4px); }
    100% { transform: translateX(0); }
}</style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-card" style="text-align:center;">
            <div class="login-icon" style="background:#c0392b;">!</div>
            <h1>Something went wrong</h1>
            <p class="subtitle">An unexpected error occurred. Please try again.</p>
            <a href="${pageContext.request.contextPath}/dashboard">
                <button class="btn-login">Back to Dashboard</button>
            </a>
        </div>
    </div>
</body>
</html>
