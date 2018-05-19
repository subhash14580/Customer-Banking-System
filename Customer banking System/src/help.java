

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class help
 */
@WebServlet("/help")
public class help extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public help() {
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
		String input_query = (String)request.getParameter("query");
		
		if(input_query == ""){
			System.out.println("Unsuccessful");
            request.setAttribute("errorMessage", "provide valid query");
            RequestDispatcher rd = request.getRequestDispatcher("/help.jsp");
            rd.forward(request, response);
		}
		else {
			System.out.println("successful");
		//storing the query into the database and regenerating into the FAQ
		//based on the questions they ask
		try {
			databaseUtil db = new databaseUtil();
			Connection con = db.getConnection();
			PreparedStatement pst = con.prepareStatement("insert into FAQ values(?,?)");
			pst.setString(1, input_query);
			pst.setString(2, "not answered");
			//it will be solved by concerned associatives but it will store in database
			pst.executeQuery();
			db.close(con);
		}catch(SQLException e) {}
        request.setAttribute("errorMessage", "submitted successfully");
        RequestDispatcher rd = request.getRequestDispatcher("/help.jsp");
        rd.forward(request, response);
		}
	}
}
