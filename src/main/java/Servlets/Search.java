package Servlets;

import Classes.DbHelper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import netscape.javascript.JSObject;

import java.io.IOException;

@WebServlet(name = "Search", value = "/Search")
public class Search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        System.out.println("Entered "+input);
        DbHelper dbHelper = new DbHelper();
        String ob = dbHelper.connect(input);
        response.getWriter().append("{ test : test}").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
