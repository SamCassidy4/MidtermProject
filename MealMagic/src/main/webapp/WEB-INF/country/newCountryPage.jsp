<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Country</title>
<%@ include file="../bootstrap.jsp"%>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<h1>Create A New Country</h1>


<section class="vh-100 bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create A New Country</h2>

              <form action="createCountry.do" method="GET">

                <div class="form-outline mb-4">
                  <input type="text" name="name" class="form-control form-control-lg" />
                  <label class="name" for="name">Name</label>
                </div>

                <div class="form-outline mb-4">
                  <input type="text" name="continent" class="form-control form-control-lg" />
                  <label class="continent" for="continent">Continent</label>
                </div>

                <div class="form-outline mb-4">
                  <input type="text" name="region" class="form-control form-control-lg" />
                  <label class="region" for="region">Region</label>
                </div>

 
                <div class="d-flex justify-content-center">
                  <button type="submit"
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Create!</button>
                </div>
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