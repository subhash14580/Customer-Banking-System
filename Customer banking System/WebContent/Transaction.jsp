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
     <span class="glyphicon glyphicon-home"></span>
      <a class="navbar-brand" href="#">TipPay</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Home2.html">Home</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
       <li class="active"><a href="help.jsp">Help</a></li>
       <li class = "active"><a href="#"><% out.println("sign in as "+(String)session.getAttribute("username"));%></a></li>
   		<li class="active"><a href="Home2.html">logout</a></li>
    </ul>
  </div>
</nav>
<%--out.println((String)request.getAttribute("account")); --%>
<% session.setAttribute("username",request.getAttribute("account"));%>
<%-- out.println(session.getAttribute("username"));--%>
<%@page import="java.sql.*" %>
<%String key =""; %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transactions</title>
<script>
 function myFunction(key){
	
	 
	 var form_key = document.getElementById("txt_name").value;
	 document.getElementById("txt_name").value = "";
	 if(key+"" == form_key){
		 //window.prompt(typeof(key)+" "+typeof(form_key));
		 document.getElementById("display").innerHTML = "document is unlocked";
	 }
	 else{
		 document.getElementById("display1").innerHTML= "invalid key";
	 }
	
 }
 
</script>
</head>
<body>
  <%--out.println(session.getAttribute("username")); --%>
  <div class = "container">
  <div class = "row">
  <a href = "AddingTransaction.jsp" >Add</a><br>
 	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo1">Listing all the transactions</button>
   <div id="demo1" class="collapse"><br>
  
       <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo2">payee</button><br>
  	  <div id="demo2" class="collapse">
    		 listing all transactions through the user payee
  	  <br>
  	  </div><br>
  	  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo3">Time</button><br>
  	  <div id="demo3" class="collapse">
    		<table border = "1">
    		<tr>
    		<th>transaction_id</th>
    		<th>transaction time</th>
    		<th>transaction type</th>
    		<th>transaction party</th>
    		</tr>
    		 <%try{
    				Class.forName("oracle.jdbc.driver.OracleDriver");
    				Connection con=DriverManager.getConnection
    						("jdbc:oracle:thin:@localhost:1521:xe","system","subhash");
    				con.setAutoCommit(true);
    				String temp = (String)session.getAttribute("username");
    				
    				PreparedStatement pstmt=con.prepareStatement(" select * from temporary where register_id = ? order by transaction_time");
    		        pstmt.setString(1,temp);
    				ResultSet rs = pstmt.executeQuery();
    				PreparedStatement pstmt1=con.prepareStatement("select key from Customer where register_id = ?");
    				pstmt1.setString(1,temp);
    				ResultSet rs1 = pstmt1.executeQuery();
    				if(rs1.next()){
    					 key = rs1.getString(1);
    				}
    				%><% 
    		    while(rs.next()){
    		    	
    		  	%>
    		  	
    		  	<tr>
    		  	<td> <%= rs.getString(2) %></td>
    		  	<td><%= rs.getString(3)%></td>
    		  	<td><%= rs.getString(5)%></td>
    		  	<td><%= rs.getString(6)%></td>
    		  	</tr>
    		  	<% 
    		    }
    				con.close();
    		 }catch(SQLException e){
    			 e.printStackTrace();}
    		 catch(Exception e){e.printStackTrace();} 
				%>
    		 </table>
  	  <br>
  	  </div><br>
      <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo4">download</button><br>
  	  <div id="demo4" class="collapse">
    		<br>
    		<label><span>enter the authentication key:</span></label>
    		<br>
    		    <div class ="col-xs-4">
    			<input type = "text" id = "txt_name" name = "key1" class ="form-control" placeholder="Enter your key"/><br>
    			<button onclick="myFunction(<%=key%>)" class= "btn btn-primary">submit</button>
    			</div>
    			<span style="color:red;"><p id = "display1"></p></span>
    			<span style="color:green;"><p id = "display"></p></span>
  	  <br>
  	  </div>
  </div>
	</div>
</div>
</body>
</html>