<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<%@ include file="../bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
</head>
<body id="login">


<section class="vh-100 bg-image">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 50px; " id="createAccount">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>

              <form action="createNewUser.do" method="GET">

                <div class="form-outline mb-4">
                  <input type="text" name="firstName" class="form-control form-control-lg" />
                  <label class="firstName" for="firstName">First Name</label>
                </div>

                <div class="form-outline mb-4">
                  <input type="text" name="lastName" class="form-control form-control-lg" />
                  <label class="lastName" for="lastName"> Last Name</label>
                </div>

                <div class="form-outline mb-4">
                  <input type="text" name="username" class="form-control form-control-lg" />
                  <label class="username" for="username">Username</label>
                </div>

                <div class="form-outline mb-4">
                  <input type="password" name="password" class="form-control form-control-lg" />
                  <label class="password" for="password">Password</label>
                </div>

                <div class="d-flex justify-content-center">
                  <button type="submit"
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Already Have An Account? <a href="login.do"
                    class="fw-bold text-body"><u>Login here</u></a></p>

              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>




</body>
</html>