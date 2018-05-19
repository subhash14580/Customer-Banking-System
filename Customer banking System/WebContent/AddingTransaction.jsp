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
       <li class="active"><a href="help.jsp">Issues with transaction</a></li>
       <li class = "active"><a href="#">
       
       <% out.println("signed in as "+(String)session.getAttribute("username"));%></a></li>
   		<li class="active"><a href="Home2.html">Logout</a></li>
    </ul>
  </div>
</nav>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding Transaction</title>
<script>

	function radiowithPaid(){
		
		document.getElementById("add").style.display='none'; 
		document.getElementById("paid").style.display='inline'; 
	}
	function radiowithAdd(){
		
		document.getElementById("paid").style.display='none';
		document.getElementById("add").style.display='inline'; 
	}
</script>
</head>
<body>
      <%@page import="java.util.UUID" %>
      <%@page import="java.text.*" %>
      <%@page import ="java.util.Date"%>
      <% UUID idone = UUID.randomUUID();
  		String transaction_id = String.valueOf(idone).substring(0, 13); 
  		DateFormat localDateFormat = new SimpleDateFormat("hh:mm:ss a");
        String time = localDateFormat.format(new Date());%>
        <center>
        <%--out.println(session.getAttribute("username")); --%>
        <form name = "objForm" method ="post" action = "insert1" onSubmit = "return validate()">
          <div class ="radio">
        	<label> transaction type:</label>
        	<label>
        	<input type = "radio" value ="paid" name ="type" onclick= "radiowithPaid()"/>paid
        	</label>&nbsp&nbsp<label>
        	<input type = "radio" value ="add" name ="type" onclick= "radiowithAdd()"/>add
        	</label>
        </div>
        <div id ="paid" >
        <br><label>Receiver Number:<input type="text" name ="number"/></label>
        </div>
        <div id ="add" style = "display:none">
        <br><label>Bank Name:<input type="text" name ="add"/></label>
        </div><br><br>
        <input type = "submit" value ="submit"/>
        <span style="color:red;">
       <%
    		if(null!=request.getAttribute("errorMessage"))
    		{
        		out.println(request.getAttribute("errorMessage"));
    		}
		%></span>
        </form>
        </center>
</body>
</html>