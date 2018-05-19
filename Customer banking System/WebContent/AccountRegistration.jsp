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
  </div>
</nav>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
</head>
<script language="javascript">
function validate(objForm){
	
	if(objForm.firstName.value.length == 0|| objForm.middleName.value.length ==0||objForm.lastName.value.length == 0){
		alert("please fill all the fields");
		return false;
	}
	if(!validateGender(objForm)) 
		return false;
	if(!(validateEmail(objForm.email.value))) 
		return false;
	
    if(!(phonenumber(objForm.mobile.value))) 
    	 return false;
    if(objForm.key.value.length == 0) 
    	return false;
	return true;
}
function validateEmail(emailField){
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

    if (reg.test(emailField.value) == false) 
    {
        alert('Invalid Email Address');
        return false;
    }

    return true;

}
function phonenumber(inputtxt)
{
  var phoneno = /^\d{10}$/;
  if(inputtxt.value.match(phoneno))
        {
      return true;
        }
      else
        {
        alert("message");
        return false;
        }
}

function validateGender(form)
{
    var genderM=form.gender_male;
    var genderF=form.gender_female;

    if(genderM.checked==false && genderF.checked==false ) {
        alert("You must select male or female");
        return false;
    }   
}
</script>
<body>
<center><h1><b><i>Registration</i></b> </h1></center>
<form  name = "objForm" action = "insert" method = "post" onSubmit = "return validate(this)">
<br>
<div class = "container">
	<div class ="row">
<div class = "col-xs-3">
</div>

<div class = "col-xs-6" enctype="multipart/form-data">
		<div class = "form-group">
			<label style = "align:left">FirstName</label>
			<input type ="text"  class="form-control" name = "firstName" placeholder = "firstname"/><br>
			<label >MiddleName</label>
			<input type = "text" class="form-control" name = "middleName"placeholder = "middlename"/><br>
			<label >LastName</label>
			<input type = "text"  class="form-control" name = "lastName"placeholder = "lastname"/><br>
			<label >Date of Birth</label>
			<input type = "date"  class="form-control" name = "dob"/><br>
		
		<label >Gender:</label>
		<div class ="radio">
		<label>
		<input type = "radio" name = "gender" value = "male" >Male<br>
		</label>
		</div>
		<div class ="radio">
		<label>
		<input type ="radio" name = "gender" value = "female">Female<br>
		</label>
		</div>
		<label>Current Address:</label><input type = "text" class = "form-control"name = "address" placeholder ="address"><br>
		<label>Email :</label><input type = "text" name = "email"  class = "form-control" placeholder="example@gmail.com"><br>
		<label>Mobile Number:</label><input type ="number" name = "mobile"  class = "form-control" placeholder = "phone number"><br>
		<label>Authenticaion Key :</label><input type = "text" name= "key"  class = "form-control" placeholder ="key"><br>
		<center>
		<input type = "submit" class="btn btn-primary" value ="submit"/>
		</center>
		</div>
		</div>
		</div>
</div>
</form>
</body>
</html>