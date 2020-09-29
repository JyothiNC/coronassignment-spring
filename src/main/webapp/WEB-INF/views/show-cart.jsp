<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Cart</title>
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
	      
	 </ul> 
	 </div>
	 </nav>
	 
<c:choose>
		<c:when test="${selectedProductsList == null || selectedProductsList.isEmpty() }">
			<p>No products were selected</p>
		</c:when>
		<c:otherwise>
		<h3>Products added to cart by you!!</h3>
		<hr/>
			<table border="1" cellspacing="5px" cellpadding="5px">
				<tr>
					<th>Description</th>
					<th>Name</th>
					<th>MRP</th>
					<th>Required Quantity</th>
				</tr>
				<c:forEach items="${selectedProductsList }" var="pm" varStatus="products">
					<tr>
						<td>${pm.productDescription }</td>
						<td>${pm.productName }</td>
						<td>${pm.cost }</td>
						<td>${pm.reqQuantity }</td>
					</tr> 
				</c:forEach>
			</table>
			<br/>
			<br/>
			
			<nav>
		<a href="${pageContext.request.contextPath }/user/checkout">Checkout</a> 
		</nav>
		</c:otherwise>
	</c:choose>
	
	<c:if test="${msg != null }">
		<p><strong>${msg }</strong></p>
	</c:if>
	
	
</body>
</html>