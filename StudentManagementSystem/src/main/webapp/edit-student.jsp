<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student | Student Management System</title>
    <style>
    /* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Body */
body {
    background: linear-gradient(135deg, #fff3e0, #ffe0b2);
}

/* Navbar */
.navbar {
    background: #ff9800;
    color: white;
    padding: 15px 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.brand {
    font-size: 18px;
    font-weight: bold;
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 15px;
}

.user-chip {
    background: rgba(255, 255, 255, 0.25);
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 14px;
}

/* Logout */
.btn-logout {
    padding: 6px 12px;
    border: none;
    border-radius: 6px;
    background: white;
    color: #ff9800;
    cursor: pointer;
    transition: 0.3s;
}

.btn-logout:hover {
    background: #fff3e0;
}

/* Container */
.container {
    max-width: 900px;
    margin: 30px auto;
    padding: 0 15px;
}

/* Header */
.page-header h2 {
    margin-bottom: 20px;
    color: #e65100;
}

/* Card */
.form-card {
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    border-left: 5px solid #ff9800;
}

/* Grid */
.form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
}

.full-width {
    grid-column: span 2;
}

/* Form */
.form-group {
    display: flex;
    flex-direction: column;
}

.form-group label {
    font-size: 14px;
    margin-bottom: 5px;
    color: #444;
}

.form-group input {
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    transition: 0.3s;
}

/* Focus effect */
.form-group input:focus {
    border-color: #ff9800;
    box-shadow: 0 0 5px rgba(255, 152, 0, 0.5);
    outline: none;
}

/* Buttons */
.form-actions {
    margin-top: 20px;
    display: flex;
    gap: 10px;
}

/* Update button */
.btn-primary {
    background: #ff9800;
    color: white;
    border: none;
    padding: 10px 18px;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s;
}

.btn-primary:hover {
    background: #e68900;
}

/* Cancel */
.btn-secondary {
    background: #ddd;
    color: #333;
    border: none;
    padding: 10px 18px;
    border-radius: 6px;
    cursor: pointer;
}

.btn-secondary:hover {
    background: #ccc;
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

/* Responsive */
@media (max-width: 768px) {
    .form-grid {
        grid-template-columns: 1fr;
    }

    .full-width {
        grid-column: span 1;
    }
}
    </style>

</head>
<body>

    <nav class="navbar">
        <div class="brand">🎓 Student Management System</div>
        <div class="nav-right">
            <span class="user-chip">👤 ${sessionScope.username}</span>
            <a href="${pageContext.request.contextPath}/logout">
                <button class="btn-logout">Logout</button>
            </a>
        </div>
    </nav>

    <div class="container">
        <div class="page-header">
            <h2>Edit Student</h2>
        </div>

        <div class="form-card">
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error"><%= request.getAttribute("error") %></div>
            <% } %>

            <form action="${pageContext.request.contextPath}/edit-student" method="post">
                <input type="hidden" name="studentId" value="${student.studentId}">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="name">Full Name *</label>
                        <input type="text" id="name" name="name" value="${student.name}" required>
                    </div>
                    <div class="form-group">
                        <label for="rollNo">Roll Number *</label>
                        <input type="text" id="rollNo" name="rollNo" value="${student.rollNo}" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="${student.email}">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" id="phone" name="phone" value="${student.phone}">
                    </div>
                    <div class="form-group">
                        <label for="course">Course</label>
                        <input type="text" id="course" name="course" value="${student.course}">
                    </div>
                    <div class="form-group">
                        <label for="year">Year</label>
                        <input type="number" id="year" name="year" min="1" max="5" value="${student.year}">
                    </div>
                    <div class="form-group full-width">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address" value="${student.address}">
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Update Student</button>
                    <a href="${pageContext.request.contextPath}/dashboard">
                        <button type="button" class="btn btn-secondary">Cancel</button>
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
