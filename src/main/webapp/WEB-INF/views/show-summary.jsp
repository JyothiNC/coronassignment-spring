<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Summary</title>
</head>
<body>
<h1 align="center">ORDER SUMMARY</h1>

<div class="alert alert-success">
<h1>Congratulations!! Your Order with Order ID ${OrderID} has been Submitted Successfully.</h1>
</div>
<div class="alert alert-info">
<h3>USER DETAILS</h3>
</div>
 <section class="container-fluid p-4">
<div>USER NAME:${username}</div>
<div>EMAIL ID:${email}</div>
<div>CONTACT NUMBER:${contactnumber}</div>
</section>

<div class="alert alert-info">
<h3>Address Details</h3>
</div>
 <section class="container-fluid p-4">
<div>Address1:${Address1}</div>
<div>Address2:${Address2}</div>
<div>City:${City}</div>
<div>State${State}</div>
</section>
<div class="alert alert-info">
<h3>Product Summary</h3>
</div>
            <table border="1" cellspacing="5px" cellpadding="5px">  
                <tr>  
                    <th>Product Name</th>  
                    <th>Quantity</th>  
                    <th>Cost</th>   
                    
                                        
                </tr>  
                <c:forEach items="${kitdetails}" var="kitdetail">  
                    <tr>  
                        <td>${kitdetail.productFullName}</td>  
                        <td>${kitdetail.quantity }</td>  
                        <td>${kitdetail.amount}</td>               
                       
                 
                    </tr>  
                </c:forEach>  
            </table> 

<div class="alert alert-success">
<h4>TOTAL COST: ${Totalamount} INR</h4>
</div>
<br/>

<br/>
</body>
</html>