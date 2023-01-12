<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in to Your Account</title>
<%@ include file="bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<section class="h-100 gradient-form" style="background-color: #F0F8FF;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black">
          <div class="row g-0">
            <div class="col-lg-6">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img src="https://www.creativefabrica.com/wp-content/uploads/2020/02/11/Food-Logo-Graphics-1-70.jpg"
                    style="width: 185px;" alt="logo">
                  <h4 class="mt-1 mb-5 pb-1">We are Magic Meal</h4>
                </div>

                <form action="login.do" method="post">
                  <p>Please login to your account</p>

                  <div class="form-outline mb-4">
                    
                    <input type="text" name="username" class="form-control"
                      placeholder="Phone number or email address" />
                    <label class="form-label" for="username">Username</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="text" name="password" class="form-control" />
                    <label class="form-label" for="password">Password</label>
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Log
                      in</button>
                    <a class="text-muted" href="#!">Forgot password?</a>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">Don't have an account?</p>
                  <!--   <form action="createNewUserPage.do" method="GET"> COMEBACK FIXME MAYBE???-->
                    <button type="submit" class="btn btn-outline-danger">Create new</button>
                    </form>
                  </div>

                </form>

              </div> 
            </div>
            <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
               <img src="https://thewoksoflife.com/wp-content/uploads/2022/10/Chinese-Ingredients-Glossary-Vegetables-Fungi.jpg"
               style="width: 380px; height: 750px;">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>






</body>
</html>