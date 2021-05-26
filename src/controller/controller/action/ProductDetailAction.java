package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductVO;

public class ProductDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int product_number = (int)Integer.valueOf(request.getParameter("product_number"));
		
		System.out.println(product_number);
		
		ProductDAO pDao = ProductDAO.getInstance();
		ProductVO pVo = null;
		
		try {
			pVo = pDao.getProductByNumber(product_number);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("product", pVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("product_detail.jsp");
		dispatcher.forward(request, response);
	}

}
