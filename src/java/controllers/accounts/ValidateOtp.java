package bookinghotel.controllers.accounts;

import bookinghotel.users.UserDAO;
import bookinghotel.users.UserDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet(name = "ValidateOtp", urlPatterns = {"/ValidateOtp"})
public class ValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
            try {
                	int value=Integer.parseInt(request.getParameter("otp"));
		HttpSession session=request.getSession();
		int otp=(int)session.getAttribute("otp");
                String username =(String) session.getAttribute("username");
                UserDAO userDao = new UserDAO();
                UserDTO userDto = userDao.getUserByUserName(username);

		RequestDispatcher dispatcher=null;
		
		
		if (value==otp) 
		{
                                request.setAttribute("account", userDto);
				request.setAttribute("email", request.getParameter("email"));
				request.setAttribute("status", "Success !!");
			  dispatcher=request.getRequestDispatcher("newPassword.jsp");
			dispatcher.forward(request, response);
			
		}
		else
		{
			request.setAttribute("message","Wrong OTP");
			
		   dispatcher=request.getRequestDispatcher("EnterOtp.jsp");
			dispatcher.forward(request, response);
		
		}
            } catch (Exception e) {
            }
	
		
	}

}
