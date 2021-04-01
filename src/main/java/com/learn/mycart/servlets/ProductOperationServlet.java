
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**
 *
 * @author Neha
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            // fetching category details
            String op = request.getParameter("operation");
            if(op.trim().equals("addcategory"))        // adding category details
            {
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                Category category = new Category();
                category.setTitle(title);
                category.setCategoryDescription(description);
                // saving it to database
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId=categoryDao.saveCategory(category);
                // out.println("category saved");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category Added successfully!");
                response.sendRedirect("admin.jsp");
                return;
            }
            else if(op.trim().equals("addproduct"))  //adding product details
            {
               
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDescription");
                int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
                int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                int catId=Integer.parseInt(request.getParameter("catId"));
                
                
                  Part part=request.getPart("pImage");
                  Product p = new Product();
                  
                  p.setpName(pName);
                  p.setpDesc(pDesc);
                  p.setpPrice(pPrice);
                  p.setpQuantity(pQuantity);
                  p.setpDiscount(pDiscount);
                
                  p.setpImage(part.getSubmittedFileName());
               
                  // getting category by id
                
                  CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
                  Category category = cdao.getCategoryById(catId);
                
                  p.setCategory(category);
                  //saving the product
             
                ProductDao pdao= new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                // picture upload
                
                //path for uploading image
                String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                
                // saving image file into the folder
                try {
                    
                    FileOutputStream fos;
                    fos = new FileOutputStream(path);
                 
                    InputStream fis=part.getInputStream();
                    byte []data= new byte[fis.available()];
                    fis.read(data);
                    fos.write(data);
                    fis.close();
                    fos.close();
                            
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product Added successfully!");
                response.sendRedirect("admin.jsp");
                return;
                
            }
            
          
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
        processRequest(request, response);
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
