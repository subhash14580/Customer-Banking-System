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
       <li><center><form action="AccountRegistration.jsp" class="inline">
   		 <button class="btn btn-primary navbar-btn btn-block" >Register</button>
		 </form></center></li>
    </ul>
  </div>
</nav>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign in</title>
</head>
<body>
<div class= "container">
  <div class= "row">
  <div class = "col-xs-4"></div>
  <div class ="col-xs-4">
		<form name = "objForm" class ="form-group"action = "AccountLogin" method ="post" >
		  <label>enter the Account number</label>
		  <input type ="text" name = "account" class ="form-control"/><br>
		  <label> enter the authentication key</label>
		  <input type ="text" name = "key" class= "form-control"/>
		  <center><span style="color:red;">
		  <%
    		if(null!=request.getAttribute("errorMessage"))
    		{
        		out.println(request.getAttribute("errorMessage"));
    		}
		%>
		</span><br>
		  <input  type = "submit" value="submit" class ="btn btn-primary"/></center>
		</form>
		
			</div>
		</div>
		</div>
</body>
</html>