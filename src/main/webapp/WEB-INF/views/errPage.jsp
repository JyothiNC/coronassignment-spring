<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
pageEncoding="ISO-8859-1"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta charset="ISO-8859-1">  
<title>Error Page</title>
</head>  
<body>  
     <div class="alert alert-danger"> 
    <h3><strong>Error:</strong> ${errMsg }</h3>  
    </div>
    <p>  
        Sorry for the inconvenience!  
        Contact Technology team if problem persists!  
    </p>  
    
</body>  
</html>