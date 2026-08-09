package com.sms.servlet;

import com.sms.dao.StudentDAO;
import com.sms.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DashboardServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("search");
        List<Student> students;

        try {
            if (keyword != null && !keyword.trim().isEmpty()) {
                students = studentDAO.searchStudents(keyword.trim());
                request.setAttribute("searchTerm", keyword.trim());
            } else {
                students = studentDAO.getAllStudents();
            }
            request.setAttribute("students", students);
            request.setAttribute("totalStudents", students.size());
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load students: " + e.getMessage());
        }

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
