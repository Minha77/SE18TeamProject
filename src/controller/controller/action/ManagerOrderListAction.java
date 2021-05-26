package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import dto.OrderVO;

public class ManagerOrderListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		OrderDAO oDao = OrderDAO.getInstance();
		ArrayList<OrderVO> list = null;
		
		try {
			list = oDao.getAllOrderList();
			
			request.setAttribute("order_list", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("manager_order_list.jsp");
		dispatcher.forward(request, response);
	}
}
