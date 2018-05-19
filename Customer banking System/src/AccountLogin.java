

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.servlet.*;
/**
 * Servlet implementation class AccountLogin
 */
@WebServlet("/AccountLogin")
public class AccountLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("this is get request").append(request.getContextPath());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
	
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","subhash");
			PreparedStatement pst = con.prepareStatement("select register_id,key from Customer"
					+ " where register_id = ? and key = ?");
			pst.setString(1, request.getParameter("account"));
			pst.setString(2, request.getParameter("key"));
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				request.setAttribute("account", request.getParameter("account"));
				
				System.out.println("retrieval from database successful");
				RequestDispatcher rd = request.getRequestDispatcher("/Transaction.jsp");
				
                rd.forward(request, response);
			}
			else {
				System.out.println("Unsuccessful");
                request.setAttribute("errorMessage", "Invalid credentials");
                RequestDispatcher rd = request.getRequestDispatcher("/AccountValidation.jsp");
                rd.forward(request, response);    
			}
		}catch(SQLException e) {
			System.out.println(e +"  true");
		}catch(Exception e1) {System.out.println(e1);}
		
	}

}
