<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Satisfy' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type = "text/css" href="{% static 'css_style/style.css'%}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">TipPay</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Home2.html">Home</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
       <li class="active"><a href="help.jsp">Help</a></li>
    	
    </ul>
  </div>
</nav>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Help</title>
</head>
<body>

<h2>Frequently asked questions..</h2>
    <ol>
    <%@ page import="java.sql.*" %>
       <%try{
    				Class.forName("oracle.jdbc.driver.OracleDriver");
    				Connection con=DriverManager.getConnection
    						("jdbc:oracle:thin:@localhost:1521:xe","system","subhash");
    				con.setAutoCommit(true);
    				%>
    				<ol>
    				<% 
    				PreparedStatement pstmt=con.prepareStatement("select * from FAQ");
    				
    				ResultSet rs = pstmt.executeQuery();
    		          while(rs.next()){
    		        	  %>
    		        	  <%if(!rs.getString(2).equals("not answered")){ %>
    		        	  <li><h3><%= rs.getString(1)%></h3></li>
    		        	  <b>Ans :</b><i><%=rs.getString(2)%></i>
    		        	  <%}else out.println("this sholud be printed");
    		          }
    		          %>
    		           </ol>
    		          <% 
    		 }catch(SQLException e){
    			out.println("excepton");}
    		 catch(Exception e){out.println("bigger exception");} 
				%>
    </ol>  
    <div class="col-xs-6">
    <form method = "post" action ="help" class = "form-group">
           <label><span>Any queries:</span></label>
           <input type = "text" name = "query" class = "form-control" placeholder="ask question"><br>
            <input type="submit" class="btn btn-primary" name="submit" value="Submit"/>
    		<span style="color:red;">
		  <%
    		if(null!=request.getAttribute("errorMessage"))
    		{
    			if(request.getAttribute("errorMessage").toString().equals("provide valid query"))
        		out.println(request.getAttribute("errorMessage"));
    			else{
    			%>
    			</span><span style="color:green;">
    			<% out.println(request.getAttribute("errorMessage"));
    			}
    		}
		%>
		</span><br>
    </form>
    </div>   
    

</body>
</html>