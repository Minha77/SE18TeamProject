package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;

public class MangerRegisterAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		CategoryDAO cDao = CategoryDAO.getInstance();
		HttpSession session = request.getSession();
		
		System.out.println(session.getAttribute("category_shop").toString());
		RequestDispatcher dispatcher = request.getRequestDispatcher("manager_register.jsp");
		dispatcher.forward(request, response);
	}
}
