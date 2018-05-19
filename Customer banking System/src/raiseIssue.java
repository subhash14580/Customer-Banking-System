

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class raiseIssue
 */
@WebServlet("/raiseIssue")
public class raiseIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public raiseIssue() {
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
		HttpSession session = request.getSession();
		if(input_query == ""){
			System.out.println("Unsuccessful");
            request.setAttribute("errorMessage", "provide valid query");
            RequestDispatcher rd = request.getRequestDispatcher("/raiseIssue.jsp");
            rd.forward(request, response);
		}
		else {
			System.out.println("successful");
		//storing the query into the database and regenerating into the FAQ
		//based on the questions they ask
		try {
			databaseUtil db = new databaseUtil();
			Connection con = db.getConnection();
			PreparedStatement pst = con.prepareStatement("insert into raiseIssue values(?,?,?)");
			pst.setString(1, (String)session.getAttribute("username"));
			pst.setString(2, input_query);
			pst.setString(3, "your issue is under processing");
			//it will be solved by concerned associatives but it will store in database
			pst.executeQuery();
			db.close(con);
		}catch(SQLException e) {}
        request.setAttribute("errorMessage", "submitted successfully after processing your issue you will be notified through email or calling  your number");
        RequestDispatcher rd = request.getRequestDispatcher("/raiseIssue.jsp");
        rd.forward(request, response);
		}
	}

}
