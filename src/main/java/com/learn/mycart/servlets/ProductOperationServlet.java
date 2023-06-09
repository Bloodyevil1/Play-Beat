package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.category;
import com.learn.mycart.entities.product;
import com.learn.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PrintWriter out = response.getWriter();
	    String op = request.getParameter("operation");

	    if (op.trim().equals("addcategory")) {
	        String cattitle = request.getParameter("catTitle");
	        String catdesc = request.getParameter("catDescription");
	    	
	        category c = new category();
	        
	        c.setCategoryTitle(cattitle);
	        c.setCategoryDescription(catdesc);
	        
	        CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
	    	
	    	
	        String success= categorydao.saveCategory(c); 
	        out.println("category saved");
	    } else if (op.trim().equals("addproduct")) {
	        String name = request.getParameter("pName");
	        String description = request.getParameter("pDesc");
	        String price = request.getParameter("pPrice");
	        int discount = Integer.parseInt(request.getParameter("pDiscount"));
	        int quantity = Integer.parseInt(request.getParameter("pQuantity"));
	        int catId = Integer.parseInt(request.getParameter("catId"));
	        Part part = request.getPart("pPhoto");

	        product p = new product();

	        // Set other product details
	        p.setpName(name);
	        p.setpDesc(description);
	        p.setpPrice(price);
	        p.setpDiscount(discount);
	        p.setpQuantity(quantity);

	        // Get category by ID
	        CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
	        category category = cdao.getCategoryByID(catId);
	        p.setCategory(category);

	        // Upload photo
	        if (part != null) {
	            String fileName = extractFileName(part);
	            String directoryPath = "C:\\Users\\Sandy\\eclipse-workspace\\My_Project\\src\\main\\webapp\\img\\Products";

	            // Save the file to the specified directory
	            Files.copy(part.getInputStream(), Paths.get(directoryPath, fileName), StandardCopyOption.REPLACE_EXISTING);
	            p.setpPhoto(fileName);
	        }

	        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
	        pdao.savProduct(p);
	        out.println("Saved Successfully");
	        
	    }
	}


	private String extractFileName(Part part) {
	    String contentDisp = part.getHeader("content-disposition");
	    String[] items = contentDisp.split(";");
	    for (String s : items) {
	        if (s.trim().startsWith("filename")) {
	            return s.substring(s.indexOf("=") + 2, s.length() - 1);
	        }
	    }
	    return "";
	}


}
