/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import DataAccess.Orders.IOrderRepository;
import DataAccess.Orders.OrderRepository;
import Entities.Orders;
import Entities.Productsbyorder;
import Entities.Tables;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "AddOrder", urlPatterns = {"/AddOrder"})
public class AddOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddOrder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddOrder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Tables cUser = (Tables) session.getAttribute("CurrentUser");
        Orders order = new Orders();
        order.setTables(cUser);
        IOrderRepository repo = new OrderRepository();
        String[] orderMakis = request.getParameterValues("chkmakis");
        String[] orderDrinks = request.getParameterValues("chkdrinks");
        String[] orderComps = request.getParameterValues("chkcomp");
        List<Productsbyorder> products = new ArrayList<Productsbyorder>();
        
        if(orderMakis!=null)
        {
            for(String id:orderMakis)
            {
                Productsbyorder product = new Productsbyorder();
                product.setProductId(Integer.valueOf(id));
                product.setProductType("Makis");
                String quantity = request.getParameter("txtMakisNumber"+id);
                product.setQuantity(Integer.valueOf(quantity));
                products.add(product);
            }
        }
        
        if(orderDrinks!=null)
        {
            for(String id:orderDrinks)
            {
                Productsbyorder product = new Productsbyorder();
                product.setProductId(Integer.valueOf(id));
                product.setProductType("Drinks");
                String quantity = request.getParameter("txtDrinksNumber"+id);
                product.setQuantity(Integer.valueOf(quantity));
                products.add(product);
            }
        }
        
        if(orderComps!=null)
        {
            for(String id:orderComps)
            {
                Productsbyorder product = new Productsbyorder();
                product.setProductId(Integer.valueOf(id));
                product.setProductType("Complements");
                String quantity = request.getParameter("txtComplementsNumber"+id);
                product.setQuantity(Integer.valueOf(quantity));
                products.add(product);
            }
        }
        
        
        repo.AddOrder(order, products);
        
        response.sendRedirect("order.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
