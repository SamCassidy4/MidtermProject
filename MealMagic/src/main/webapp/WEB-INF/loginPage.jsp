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
<body class ="loginPage">
<section class="h-100 gradient-form" style="background-color: #eee;">
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
                  <h4 class="mt-1 mb-5 pb-1">Login</h4>
                </div>

                <form action="login.do" method="post">
                  <p>Please login to your account</p>

                  <div class="form-outline mb-4">
                    
                    <input type="text" name="username" class="form-control"
                      placeholder="username" />
                    <label class="form-label" for="username"></label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" name="password" class="form-control" placeholder="password" />
                    <label class="form-label" for="password"></label>
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Log
                      in</button>
                  </div>


                </form>

              </div> 
            </div>
            <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
               <img src="http://drbhole.com/wp-content/uploads/2022/03/Fruits-and-vegetables-1.jpg"
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