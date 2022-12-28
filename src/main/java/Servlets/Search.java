package Servlets;

import Classes.DbHelper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import netscape.javascript.JSObject;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Search", value = "/Search")
public class Search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        System.out.println("Entered "+input);
        JsonArray array = new JsonArray();
        DbHelper dbHelper = new DbHelper();
        array = dbHelper.connect(input);

        System.out.println(array);

        response.setContentType("application/json");
        response.getWriter().append(array.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
