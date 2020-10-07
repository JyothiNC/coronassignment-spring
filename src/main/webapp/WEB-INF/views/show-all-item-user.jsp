<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
</head>
<body>
      	<ul> 
	      	<li class="nav-item">
		       <a class="nav-link" href="${pageContext.request.contextPath }/user/home">USER DASHBOARD</a>
		    </li>
		    <li class="nav-item">
	      	  <a class="nav-link" href="${pageContext.request.contextPath }/logout">Sign Out</a>
	      	</li>
	      </ul>	
	 <h3>Products List</h3>
<c:choose>  
        <c:when test="${productlist == null || productlist.isEmpty() }">  
            <p>No Products Available to display</p>  
        </c:when>  
        <c:otherwise>  
			<br/>
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
                        <td><input type="number" id="${product.id }" name="reqQuantity" value="${product.reqQuantity}"></input> </td>
						<td>
						<a href='' onclick="this.href='${pageContext.request.contextPath }/user/add-to-cart?productId=${product.id}&reqQuantity='+document.getElementById('${product.id }').value">Add to cart</a>
						<span>|</span>
						<a href='' onclick="this.href='${pageContext.request.contextPath }/user/delete?productId=${product.id}&reqQuantity='+document.getElementById('${product.id }').value">Remove from cart</a>
						</td>                      
                       
                    </tr>  
                </c:forEach>  
            </table>  
        </c:otherwise>  
    </c:choose> 
    
    <c:if test="${msg != null }">
		<p><strong>${msg }</strong></p>
	</c:if>
	
	<nav>
	<c:if test="${selectedProductsList != null }">
	<a href="${pageContext.request.contextPath }/user/show-kit">Show cart</a>
	</c:if>
	</nav>
   
</body>
</html>