package com.sms.servlet;

import com.sms.dao.StudentDAO;
import com.sms.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class AddStudentServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("add-student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String rollNo = request.getParameter("rollNo");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String course = request.getParameter("course");
        String yearStr = request.getParameter("year");
        String address = request.getParameter("address");

        if (name == null || name.trim().isEmpty() || rollNo == null || rollNo.trim().isEmpty()) {
            request.setAttribute("error", "Name and Roll No are required.");
            request.getRequestDispatcher("add-student.jsp").forward(request, response);
            return;
        }

        try {
            int year = (yearStr != null && !yearStr.trim().isEmpty()) ? Integer.parseInt(yearStr.trim()) : 0;
            Student student = new Student(name.trim(), rollNo.trim(), email, phone, course, year, address);
            studentDAO.addStudent(student);
            response.sendRedirect("dashboard?added=true");
        } catch (NumberFormatException nfe) {
            request.setAttribute("error", "Year must be a valid number.");
            request.getRequestDispatcher("add-student.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not add student. Roll No may already exist.");
            request.getRequestDispatcher("add-student.jsp").forward(request, response);
        }
    }
}

