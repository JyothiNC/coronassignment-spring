<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>This is Admin dashboard</h1>

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
	        <a class="nav-link" href="${pageContext.request.contextPath }/admin/product-entry">Add New Product</a>
	      </li>
	      <li class="nav-item">
	      	  <a class="nav-link" href="${pageContext.request.contextPath }/logout">Log Out</a>
	      	</li>
	 </ul> 
	 </div>
	 </nav>
 <c:if test="${msg != null }">  
 	<div class="container-fluid">			
		<div class="alert alert-success"> 
        <Strong>${msg }</Strong> 
        </div>        
     </div>   	
        <br/> 
 </c:if> 
</body>
</html>