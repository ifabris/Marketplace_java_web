/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import hr.algebra.dal.sql.DataSourceSingleton;
import hr.algebra.dal.sql.ProductDao;
import hr.algebra.model.Cart;
import hr.algebra.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;



@WebServlet("/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
                
            try {
                DataSource ds = DataSourceSingleton.getInstance();
                Connection con = ds.getConnection();
                ProductDao pDao = new ProductDao(con);
                Product p = new Product();
		try (PrintWriter out = response.getWriter()) {
			String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                        List<Product> prod_list = pDao.getAllProducts();
			if (action != null && id >= 1) {
				if (action.equals("inc")) {
					for (Cart c : cart_list) {
                                            p.setProizvodID(c.getProizvodID());
                                            for (Product product : prod_list) {
                                                if (product.getProizvodID() == p.getProizvodID()) {
                                                    p = product;
                                                }
                                            }
						if (c.getProizvodID()== id) {
							int quantity = c.getQuantity();
                                                        if (p.getAmount()> c.getQuantity()) {
                                                        quantity++;
							c.setQuantity(quantity);

                                                    }
                                                    response.sendRedirect("cart.jsp");
						}
					}
				}

				if (action.equals("dec")) {
					for (Cart c : cart_list) {
						if (c.getProizvodID()== id && c.getQuantity() > 1) {
							int quantity = c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
							break;
						}
					}
					response.sendRedirect("cart.jsp");
				}
			} else {
				response.sendRedirect("cart.jsp");
			}
		}}
                catch (SQLException ex) {
                Logger.getLogger(QuantityIncDecServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
	}

}
