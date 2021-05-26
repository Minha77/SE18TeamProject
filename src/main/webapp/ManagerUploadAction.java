package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDAO;

public class ManagerUploadAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String upload = request.getRealPath("upload_image");
		String url = "";
		
		int maxSize = 1024*1024*20;		// 업로드 용량 최대 10MB로 제한
		String product_number = request.getParameter("product_number");
		System.out.println(product_number);
		System.out.println("업로드된 이미지 경로" + upload);
		try {
			MultipartRequest multi = new MultipartRequest(request, upload
					, maxSize, "EUC-KR", new DefaultFileRenamePolicy());
			
			ProductDAO pDao = ProductDAO.getInstance();
			int result = pDao.registerProduct(multi);

			System.out.println(result);
			// 상품 등록 성공
			if(result > 0) {
				url = "manage_main.jsp";
			} else {
				url = "manager_register.jsp";
			}
			System.out.println(url);
			
			// 해당 url로 이동
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
