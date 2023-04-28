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
<body>
<nav class="navbar navbar-light bg-dark">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1 mx-auto" style="color: white;">Manag<span style="color: #A9DF9D;">r.</span></span>
  </div>
</nav>
<section class="vh-100" style="background-image: linear-gradient(145deg, #A9DF9D, #163E0D)">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <form:form class="mb-md-5 mt-md-4 pb-5" action="/process/register" method="post" modelAttribute="newUser">

              <h2 class="fw-bold mb-2 text-uppercase">Register</h2>
              <p class="text-white-50 mb-5">Make a new account!</p>

              <div class="form-outline form-white mb-4">
                <form:input path="userName" class="form-control form-control-lg" />
                <form:errors path="userName" class="text-danger" />
                <label class="form-label" for="typeEmailX">Username</label>
              </div>
              
              <div class="form-outline form-white mb-4">
                <form:input path="email" class="form-control form-control-lg" />
                <form:errors path="email" class="text-danger" />
                <label class="form-label" for="typeEmailX">Email</label>
              </div>

              <div class="form-outline form-white mb-4">
                <form:input path="password" class="form-control form-control-lg" />
                <form:errors path="password" class="text-danger" />
                <label class="form-label">Password</label>
              </div>
              <div class="form-outline form-white mb-4">
                <form:input path="confirm" class="form-control form-control-lg" />
                <form:errors path="confirm" class="text-danger" />
                <label class="form-label">Confirm Password</label>
              </div>

              <button class="btn btn-outline-light btn-lg px-5" type="submit">Register</button>

            </form:form>

            <div>
              <p class="mb-0">Don't have an account? <a href="#!" style="color: #A9DF9D;" class="fw-bold">Sign Up</a>
              </p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>