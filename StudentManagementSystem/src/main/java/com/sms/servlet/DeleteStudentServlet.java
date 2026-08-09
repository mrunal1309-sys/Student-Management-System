package com.sms.servlet;

import com.sms.dao.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            studentDAO.deleteStudent(id);
            response.sendRedirect("dashboard?deleted=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard?error=deletefailed");
        }
    }
}

