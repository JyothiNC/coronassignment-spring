<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User address/title></title>
</head>
<body>
<h3 class="jumbotron">Enter Shipping Address</h3>
		<hr/>
 <section class="container-fluid p-4">
 <div class="col-sm-4"> 
    
	<form:form action="${pageContext.request.contextPath }/user/finalize" method="post" modelAttribute="Address">
		
		
		<div class="form-group">  
            <form:label path="Address1">Address Line1 :</form:label>  
            <form:input type="text" path="Address1" class="form-control"/>    
            <form:errors path="Address1" class="alert alert-warning"/> 
                 
        </div>  
        
        <div class="form-group">  
            <form:label path="Address2">Address Line2 :</form:label>  
            <form:input type="text" path="Address2" class="form-control"/>
            <form:errors path="Address2" class="alert alert-warning"/>   
        </div>
       
        <div class="form-group">  
            <form:label path="City">City :</form:label>  
            <form:input type="text" path="City" class="form-control"/> 
            <form:errors path="City" class="alert alert-warning"/>  
        </div>
        
        <div class="form-group">  
            <form:label path="State">State :</form:label>  
            <form:input type="text" path="State" class="form-control"/>  
            <form:errors path="State" class="alert alert-warning"/> 
        </div>
        
        <div class="form-group"> 
        <button class="btn pull-right btn-primary">Place Order</button>
        </div>
</form:form>
</div>
</section>
</body>
</html>