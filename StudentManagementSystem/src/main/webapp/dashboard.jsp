<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Student Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
            <h2>Student Records</h2>
        </div>

        <c:if test="${param.added == 'true'}">
            <div class="alert alert-success">Student added successfully.</div>
        </c:if>
        <c:if test="${param.updated == 'true'}">
            <div class="alert alert-success">Student updated successfully.</div>
        </c:if>
        <c:if test="${param.deleted == 'true'}">
            <div class="alert alert-success">Student deleted successfully.</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-number">${totalStudents}</div>
                <div class="stat-label">Total Students</div>
            </div>
        </div>

        <div class="toolbar">
            <form class="search-box" action="${pageContext.request.contextPath}/dashboard" method="get">
                <input type="text" name="search" placeholder="Search by name, roll no, course..." value="${searchTerm}">
                <button type="submit" class="btn btn-secondary">Search</button>
            </form>
            <a href="${pageContext.request.contextPath}/add-student">
                <button class="btn btn-primary">+ Add Student</button>
            </a>
        </div>

        <div class="table-card">
            <c:choose>
                <c:when test="${empty students}">
                    <div class="empty-state">
                        <div class="emoji">📋</div>
                        <p>No student records found.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>Roll No</th>
                                <th>Name</th>
                                <th>Course</th>
                                <th>Year</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="s" items="${students}">
                                <tr>
                                    <td><span class="roll-badge">${s.rollNo}</span></td>
                                    <td>${s.name}</td>
                                    <td>${s.course}</td>
                                    <td>${s.year}</td>
                                    <td>${s.email}</td>
                                    <td>${s.phone}</td>
                                    <td class="actions-cell">
                                        <a href="${pageContext.request.contextPath}/edit-student?id=${s.studentId}">
                                            <button class="btn btn-sm btn-edit">Edit</button>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/delete-student?id=${s.studentId}"
                                           onclick="return confirm('Delete this student record?');">
                                            <button class="btn btn-sm btn-delete">Delete</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
