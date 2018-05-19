import java.util.*;
import java.sql.*;
public class databaseUtil {
   public Connection getConnection() {
	   Connection con = null;
	   try {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe","system","subhash");
			con.setAutoCommit(true);
	   }catch(ClassNotFoundException c) {
		   
	   }catch(SQLException e) {}
	   return con;
   }
   public void close(Connection con) {
	   try {
	   con.close();
	   }catch(SQLException e) {
		   
	   }
   }
}
