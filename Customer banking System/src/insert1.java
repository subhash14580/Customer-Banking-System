

import java.io.IOException;
import java.text.SimpleDateFormat;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Date;
/**
 * Servlet implementation class insert1
 */
@WebServlet("/insert1")
public class insert1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//response.getWriter().append("post request");
		String type = request.getParameter("type");
		 HttpSession session = request.getSession();
		 SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
			Date date = new Date();
			String time = formatter.format(date).toString();
		if(type == null) {
			
			request.setAttribute("errorMessage", "please select the type");
			RequestDispatcher rd = request.getRequestDispatcher("/AddingTransaction.jsp");
	        rd.forward(request, response);
		}
		if(type.equals("paid")) {
			String number = request.getParameter("number");
			if(number == "") {
				request.setAttribute("errorMessage", "please fill the number number");
				RequestDispatcher rd = request.getRequestDispatcher("/AddingTransaction.jsp");
		        rd.forward(request, response);
			}//insertion into database
			else {
		         databaseUtil db = new databaseUtil();
		        
		         try {
		         Connection con = db.getConnection();
		         con.setAutoCommit(true);
		         PreparedStatement pst = con.prepareStatement("insert into temporary values(?,?,?,?,?,?)");
		         System.out.println(session.getAttribute("username").toString());
		         pst.setString(1, (String)session.getAttribute("username"));
		         generateRandom gr = new generateRandom();
		         
		         pst.setString(2,("TranId"+gr.getRandom()).replace(".",""));
		         pst.setString(3, time);
		         pst.setFloat(4, 13);
		         pst.setString(5,"paid");
		         pst.setString(6, (String)number);
		         System.out.println("how it is inserted " + pst.executeUpdate());
		         db.close(con);
		         }catch(SQLException e) {e.printStackTrace();}
		         session.invalidate();
		         response.sendRedirect("AccountValidation.jsp");
			}
		}
		else if(type.equals("add")) {
			String add = request.getParameter("add");
			if(add == "") {
				request.setAttribute("errorMessage", "please fill  the add field");
				RequestDispatcher rd = request.getRequestDispatcher("/AddingTransaction.jsp");
		        rd.forward(request, response);
			}//insertion into database 
			else {
				databaseUtil db = new databaseUtil();
		         try {
		         
		         Connection con = db.getConnection();
		         PreparedStatement pst = con.prepareStatement("insert into temporary values(?,?,?,?,?,?)");
		         System.out.println("transaction party: add "+(String)session.getAttribute("username"));
		         pst.setString(1,(String)session.getAttribute("username"));
		         generateRandom gr = new generateRandom();
		         
		         pst.setString(2,("TranID"+gr.getRandom()).replace(".",""));
		         pst.setString(3, time);
		         pst.setFloat(4, 13);
		         pst.setString(5,"add");
		         pst.setString(6, (String)add);
		         
		         System.out.println("how it is inserted?"+pst.executeUpdate());
		         db.close(con);
		         }catch(Exception e) {e.printStackTrace();}
		         session.invalidate();
		         response.sendRedirect("AccountValidation.jsp");  
			}
		}
		else response.sendRedirect("Home.jsp");	
	}
}
