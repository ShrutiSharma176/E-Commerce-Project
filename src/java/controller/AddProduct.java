package controller;

import Dto.Product;
import Dao.ProductDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.RequestDispatcher;

public class AddProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int prod_id=0,stock=0;
            double price=0;
            String prod_name="",cat_id="",supp_id="",p_desc="",p_img="";

            DiskFileItemFactory fac = new DiskFileItemFactory();
            ServletFileUpload upl = new ServletFileUpload(fac);
            List<FileItem> list = upl.parseRequest(request);
            Iterator<FileItem> itr = list.iterator();
            while (itr.hasNext()) {
                FileItem fi = itr.next();
                String flname = fi.getFieldName();
                if (fi.isFormField()) {
                    if (flname.equals("prod_id")) {
                        prod_id = Integer.parseInt(fi.getString());
                    }
                    if (flname.equals("prod_name")) {
                        prod_name = fi.getString();
                    }
                    if (flname.equals("cat_id")) {
                        cat_id = fi.getString();
                    }
                    if (flname.equals("stock")) {
                        stock= Integer.parseInt(fi.getString());
                    }
                    if (flname.equals("price")) {
                        price = Double.parseDouble(fi.getString());
                    }
                    if (flname.equals("supp_id")){
                        supp_id = fi.getString();
                    }
                    if (flname.equals("p_desc")) {
                        p_desc = fi.getString();
                    }
                } else {
                    if (flname.equals("p_img")) {
                        p_img = fi.getName();
                        String filepath = getServletContext().getRealPath("/") + "images/" + p_img;
                        filepath = filepath.replace("\\build", "");
                        //out.print(filepath);
                        //System.out.println("file path : " + filepath);
                        try {
                            fi.write(new File(filepath));
                        } catch (Exception e) {
                            System.out.println("exception: " + e);
                        }

                    }
                }
            }

            Product p = new Product();
            p.setProd_id(prod_id);
            p.setProd_name(prod_name);
            p.setCat_id(cat_id);
            p.setStock(stock);
            p.setPrice(price);
            p.setSupp_id(supp_id);
            p.setP_desc(p_desc);
            p.setP_img(p_img);
            
            int i=0;
            ProductDao dao = new ProductDao();
            try {
                i = dao.addProduct(p);
            } catch (Exception e) {
                System.out.println("exception: " + e);
            }
            
            if (i != 0) {
                out.print("Product added successfully..!!");
                RequestDispatcher rd = request.getRequestDispatcher("supplierDash.html");
                rd.forward(request, response);
            } else {
                out.print("Product not added..!!");
            }

        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
