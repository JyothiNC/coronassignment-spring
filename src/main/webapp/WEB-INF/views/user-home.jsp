<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User-Home</title>
</head>
<body>
<nav>
 <div>
 	<ul>
 		<li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath }/user/home">User Dashboard</a>
	      </li> 
		<li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath }/user/show-list">Products List</a>
	      </li>
	      <li class="nav-item">
	      	  <a class="nav-link" href="${pageContext.request.contextPath }/logout">Log Out</a>
	      	</li>
	 </ul> 
	 </div>
	 </nav>
</body>
</html>