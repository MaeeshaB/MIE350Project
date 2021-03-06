package com.mie.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.ProductDao;
import com.mie.dao.WorkspaceDao;
import com.mie.model.Product;
import com.mie.model.Workspace;

public class ProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static String SEARCH_PRODUCT = "/searchProductResult.jsp";
	private static String PRODUCT_DESC = "/productDescription.jsp";
	private ProductDao dao;
	private WorkspaceDao dao_ws;

	/**
	 * Constructor for this class.
	 */
	public ProductController() {
		super();
		dao = new ProductDao();
		dao_ws = new WorkspaceDao();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		//Selecting a product to view more information on
		String forward = PRODUCT_DESC;
		String action = request.getParameter("action");
		int selectedProduct = Integer.parseInt(request.getParameter("prodId"));
		HttpSession session = request.getSession(true);
		
		if (action.equalsIgnoreCase("select")) {
			session.setAttribute("selectedProduct", dao.getProductById(selectedProduct));
		} 

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		 
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		//Finding products based on the quiz
		String[] persona = request.getParameterValues("persona");
		String[] category = request.getParameterValues("category");
		String[] importance = request.getParameterValues("importance");
		String[] type = request.getParameterValues("type");
		
		//Determining if the "importance" question was answered
		List<String> important_list = new ArrayList<String>();
		if (importance!=null) {
			important_list = Arrays.asList(importance);
		}
		
		RequestDispatcher view = request.getRequestDispatcher(SEARCH_PRODUCT);
		HttpSession session = request.getSession(true);
		
		//Getting a product list from the quiz answers
		session.setAttribute("products", dao.getProductFromSuggestedProducts(Arrays.asList(persona)
				, Arrays.asList(category), important_list, Arrays.asList(type)));
		
		//Getting workspace data
		String username = (String) session.getAttribute("username");
		Workspace workspace = dao_ws.getAllSavedItems(username);
		List<Product> products = workspace.getProducts();
				
		session.setAttribute("wsItems", workspace);
		//Changing the selected value of the "sort by" dropdown menu
		session.setAttribute("selected_LH", "");
		session.setAttribute("selected_HL", "");
		session.setAttribute("selected_AZ", "");
		session.setAttribute("selected_ZA", "");

		view.forward(request, response);
	}
}