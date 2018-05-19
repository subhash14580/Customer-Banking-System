
import javax.servlet.RequestDispatcher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;
import java.sql.*;
import java.util.concurrent.* ;
/**
 * Servlet implementation class insert
 */
@WebServlet("/insert")
public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert() {
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
		 UUID idone = UUID.randomUUID();
			String id = "c2k18"+String.valueOf(idone).substring(0, 6);
			String firstName = request.getParameter("firstName");
			String middleName = request.getParameter("middleName"); 
			String lastName = request.getParameter("lastName");
			String date = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String mobile = (request.getParameter("mobile"));
			String key = request.getParameter("key");
			try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe","system","subhash");
			con.setAutoCommit(true);
			PreparedStatement pstmt=con.prepareStatement("insert into Customer values(?,?,?,?,?,?,?,?,?,?)");	
			pstmt.setString(1,id);
			pstmt.setString(2,firstName);
			pstmt.setString(3,middleName);
			pstmt.setString(4,firstName);
			pstmt.setString(5,date);
			pstmt.setString(6,gender);
			pstmt.setString(7,address);
			pstmt.setString(8,email);
			pstmt.setString(9,mobile);
			pstmt.setString(10,key);
			int status1 =pstmt.executeUpdate();
			pstmt.close();
				con.close();
			}catch(ClassNotFoundException c) {c.printStackTrace();}
			catch(SQLException e){e.printStackTrace();}
			response.sendRedirect("Home2.html");
	}
}
