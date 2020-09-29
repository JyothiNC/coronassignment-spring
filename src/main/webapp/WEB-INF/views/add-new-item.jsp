<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
</head>
<body>

<nav>
 <div>
 	<ul>
 		<li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath }/admin/home">Admin Dashboard</a>
	      </li> 
		<li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath }/admin/product-list">Products List</a>
	      </li>
	      <li class="nav-item">
	      	  <a class="nav-link" href="${pageContext.request.contextPath }/logout">Log Out</a>
	      	</li>
	 </ul> 
	 </div>
	 </nav>
	 
<h3 class="jumbotron">Add New Product</h3>
 <section class="container-fluid p-4">
 <div class="col-sm-4">
<form:form action="${pageContext.request.contextPath }/admin/product-save" method="post" modelAttribute="product">  
     
    <br/>        
		<div class="form-group"> 
            <form:label path="productName">Product Name</form:label>  
            <form:input type="text" path="productName" class="form-control"/>  
            <form:errors path="productName" class="alert alert-warning"/>
        </div> 
    <br/>         
        <div class="form-group">
            <form:label path="cost">Product Cost</form:label>  
            <form:input type="number" path="cost" class="form-control" />  
            <form:errors path="cost" class="alert alert-warning"/>
        </div>
    <br/>          
        <div class="form-group">  
            <form:label path="productDescription">Product Description</form:label>  
            <form:input type="text" path="productDescription" class="form-control"/>  
            <form:errors path="productDescription" class="alert alert-warning"/>
        </div>  
    <br/>   
    	<div class="form-group">                          
        <button class="btn pull-right btn-primary">SAVE</button>
    	</div>       
    <br/>             
    </form:form> 
   </div> 
</section>

</body>
</html>