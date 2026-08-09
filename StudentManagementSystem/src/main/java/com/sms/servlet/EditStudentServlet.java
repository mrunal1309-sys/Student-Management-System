package com.sms.servlet;

import com.sms.dao.StudentDAO;
import com.sms.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditStudentServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Student student = studentDAO.getStudentById(id);
            if (student == null) {
                response.sendRedirect("dashboard?error=notfound");
                return;
            }
            request.setAttribute("student", student);
            request.getRequestDispatcher("edit-student.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("dashboard?error=invalidid");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("studentId"));
            String name = request.getParameter("name");
            String rollNo = request.getParameter("rollNo");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String course = request.getParameter("course");
            int year = Integer.parseInt(request.getParameter("year"));
            String address = request.getParameter("address");

            Student student = new Student(name.trim(), rollNo.trim(), email, phone, course, year, address);
            student.setStudentId(id);

            studentDAO.updateStudent(student);
            response.sendRedirect("dashboard?updated=true");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not update student.");
            request.getRequestDispatcher("edit-student.jsp").forward(request, response);
        }
    }
}

