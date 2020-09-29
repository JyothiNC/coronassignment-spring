<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products List</title>
</head>
<body>
<nav>
 <div>
 	<ul>
 		<li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath }/admin/home">Admin Dashboard</a>
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
	 
<h3>Products List</h3>
<c:if test="${deleteconfirmationmsg!=null}">
	<p> <b>Product is Deleted.</b></p>
	<br/>
	</c:if>
	 <c:choose>  
        <c:when test="${productlist == null || productlist.isEmpty() }">  
            <p>No Products Available to display</p>  
        </c:when>  
        <c:otherwise>  
            <table border="1" cellspacing="5px" cellpadding="5px">  
                <tr>  
                    <th>Product id#</th>  
                    <th>Product Name</th>  
                    <th>Product Cost</th>  
                    <th>Product Description</th>   
                    <th>Actions</th>                    
                </tr>  
                <c:forEach items="${productlist}" var="product">  
                    <tr>  
                        <td>${product.id }</td>  
                        <td>${product.productName }</td>  
                        <td>${product.cost }</td>  
                        <td>${product.productDescription}</td>                        
                        <td>
                        <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath }/admin/product-delete?productId=${product.id}">DELETE</a>                       
                        </td>
                    </tr>  
                </c:forEach>  
            </table>  
        </c:otherwise>  
    </c:choose>
</body>
</html>