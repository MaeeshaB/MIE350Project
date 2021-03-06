package com.mie.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

public class SearchController extends HttpServlet {
	/**
	 * This class only handles the SEARCH feature of the web app.
	 * 
	 * These are variables that lead to the appropriate JSP pages.
	 * 
	 * SEARCH_USER leads to the search results page.
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String SEARCH_PRODUCT = "/searchProductResult.jsp";
	private ProductDao dao;
	private WorkspaceDao dao_ws;

	/**
	 * Constructor for this class.
	 */
	public SearchController() {
		super();
		dao = new ProductDao();
		dao_ws = new WorkspaceDao();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String forward = SEARCH_PRODUCT;
		HttpSession session = request.getSession(true);
		
		session.setAttribute("products", dao.getAllProducts());
		
		//Changing the selected value of the "sort by" dropdown menu
		session.setAttribute("selected_LH", "");
		session.setAttribute("selected_HL", "");
		session.setAttribute("selected_AZ", "");
		session.setAttribute("selected_ZA", "");

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		//Getting the key search word
		String keyword = request.getParameter("keyword");
		RequestDispatcher view = request.getRequestDispatcher(SEARCH_PRODUCT);
		request.setAttribute("keyword", keyword);
		
		//Getting products based on the key search word
		HttpSession session = request.getSession(true);
		session.setAttribute("products", dao.getProductByKeyword(keyword));
		
		//Getting workspace data
		Workspace workspace = dao_ws.getAllSavedItems("admin01");
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