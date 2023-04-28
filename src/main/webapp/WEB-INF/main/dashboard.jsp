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
  	<p class="text-white">Welcome, <c:out value="${loggedInUser.userName }"/></p>
    <span class="navbar-brand mb-0 h1 mx-auto" style="color: white;">Manag<span style="color: #A9DF9D;">r.</span></span>
    <a href="/logout" class="text-white">Logout</a>

  </div>
  
</nav>
<section>
<section class="intro mt-5">
  <div class="h-100">
    <div class="mask d-flex align-items-center h-100">
      <div class="container mx-auto">
        <div class="row justify-content-center">
          <div class="col-12">
            <div class="card bg-dark shadow-2-strong">
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-dark table-borderless mb-0">
                    <thead>
                      <tr>
                        <th scope="col">EMPLOYEES</th>
                        <th scope="col">POSITION</th>
                        <th scope="col">AGE</th>
                        <th scope="col">SALARY</th>
                        <th scope="col">ON-BOARD SINCE</th>
                        <th scope="col">ACTIONS</th>
                      </tr>
                    </thead>
                    <tbody>
                   
	                    <c:forEach var="employee" items="${allEmployees}">
	                     <c:if test="${employee.user.id ==  user_id }">
		                      <tr>
		                        <th scope="row"><a href="/display/${employee.id}" style="color:#A9DF9D; text-decoration: none;"><c:out value="${employee.employeeName}"/></a></th>
		                        <td><c:out value="${employee.department} "/></td>
		                        <td><c:out value="${employee.age } "/></td>
		                        <td>$<c:out value="${employee.salary }"/></td>
		                        <td><c:out value="${employee.onBoard }"/></td>
		                        <td><a href="/edit/${employee.id }" class="text-white">Edit</a>      
		                        <form action="/${employee.id}" method="post">
	    						<input type="hidden" name="_method" value="delete"/>
	    						<input type="submit" value="Delete" class="btn-danger"/>
	    						</form> <a href="/notes/${employee.id }">Notes</a></td>
		                      </tr>
		                     </c:if>
	                    </c:forEach>
                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="text-center mt-5">
  	<a href="/create" class="btn btn-dark">Add Employee</a>
  </div>
</section>

</section>
</body>
</html>