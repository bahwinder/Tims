package Servlets;

import Classes.DbHelper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "FillDb", value = "/FillDb")
public class FillDb extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DbHelper db = new DbHelper();
        boolean insertSuccess = db.insert(request.getParameter("name")
                ,request.getParameter("address")
                ,request.getParameter("city")
                ,request.getParameter("rating"));
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().append("{insertSuccess: "+insertSuccess+"}").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
