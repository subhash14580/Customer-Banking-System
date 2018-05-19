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
       <li class = "active"><a href="#"><% out.println("signed in as "+(String)session.getAttribute("username"));%></a></li>
    </ul>
  </div>
</nav>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Issues</title>
</head>
<body>
    <%-- out.println(session.getAttribute("username"));--%>
    <form method = "post" action ="raiseIssue">
     <input type = "text" name ="query"/>
     <input type = "submit" value ="submit"/>
    </form>
    <%
    		if(null!=request.getAttribute("errorMessage"))
    		{
        		out.println(request.getAttribute("errorMessage"));
    		}
		%>
</body>
</html>