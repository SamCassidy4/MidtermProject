<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Category</title>
<%@ include file="../bootstrap.jsp"%>
</head>
<body>
<h1>Create A New Dietary Preference</h1>


<section class="vh-100 bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create A New Dietary Preference</h2>

              <form action="createDp.do" method="GET">

                <div class="form-outline mb-4">
                  <input type="text" name="name" class="form-control form-control-lg" />
                  <label class="name" for="name">Name</label>
                </div>
                <div class="form-outline mb-4">
                  <input type="text" name="description" class="form-control form-control-lg" />
                  <label class="description" for="description">Description</label>
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