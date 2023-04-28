<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.2/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="vh-100" style="background-image: linear-gradient(145deg, #A9DF9D, #163E0D)">
<nav class="navbar navbar-light bg-dark">
  <div class="container-fluid">
  <a href="/dashboard" class="text-white">Go Back</a>
    <span class="navbar-brand mb-0 h1 mx-auto" style="color: white;">Manag<span style="color: #A9DF9D;">r.</span></span>
    <a href="/logout" class="text-white">Logout</a>

  </div>
  
</nav>
<div class="card text-white bg-dark mb-3 mx-auto mt-5" style="max-width: 50rem;">
  <div class="card-header"><h1 style="color: #A9DF9D;"><c:out value="${employee.employeeName}"/></h1></div>
  <div class="card-body">
    <h2 class="card-title"><c:out value="${employee.department}"/></h2>
    <p class="card-text">Age: <c:out value="${employee.age}"/></p>
    <p class="card-text">Salary: $<c:out value="${employee.salary}"/></p>
    <p class="card-text">On-Board Since: <c:out value="${employee.onBoard}"/></p>
    <h1>Notes</h1>
    <p><c:out value="${employee.notes}"/></p>
  </div>
</div>
</body>
</html>