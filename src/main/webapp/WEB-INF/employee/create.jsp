<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <span class="navbar-brand mb-0 h1 mx-auto" style="color: white;">Manag<span style="color: #A9DF9D;">r.</span></span>
 	<a href="/logout" class="text-white ml-4">Logout</a>
  </div>
</nav>
  <div class="container py-5">
        <div class="card bg-dark text-white mx-auto" style="border-radius: 1rem;width: 50vw">
          <div class="card-body p-5 text-center">

            <form:form class="mb-md-5 mt-md-4 pb-5" action="/process/create" method="post" modelAttribute="employee">
             <form:input type="hidden" path="user" value="${user_id}"/>

              <h2 class="fw-bold mb-4 text-uppercase">Add employee</h2>
              
              <div class="row">
              	<div class="col">
	              <div class="form-outline form-white mb-4">
	                <form:input path="employeeName" class="form-control form-control-lg" />
	                <form:errors path="employeeName" class="text-danger" />
	                <label class="form-label" for="typeEmailX">Name</label>
	              </div>
	            </div>
	            <div class="col">
	              <div class="form-outline form-white mb-4">
	                <form:input path="department" class="form-control form-control-lg" />
	                <form:errors path="department" class="text-danger" />
	                <label class="form-label" for="typeEmailX">Department</label>
	              </div>
	              </div>
				</div>
			<div class="row">
			<div class="col">
              <div class="form-outline form-white mb-4">
                <form:input type="int" path="age" class="form-control form-control-lg" />
                <form:errors path="age" class="text-danger" />
                <label class="form-label">Age</label>
              </div>
            </div>
            <div class="col">
              <div class="form-outline form-white mb-4">
                <form:input type="date" path="onBoard" class="form-control form-control-lg" />
                <form:errors path="onBoard" class="text-danger" />
                <label class="form-label">On-Board since</label>
              </div>
			</div>
			</div>
			<div>
				<form:input type="input" path="salary" class="form-control form-control-sm" />
				<label class="form-label">Salary</label>
			</div>
              <button class="btn btn-outline-light btn-lg px-5 mt-5" type="submit">Add Employee</button>
              
              

            </form:form>
				<a href="/dashboard" class="text-white">Go back</a>

          </div>
        </div>
  </div>
</body>
</html>