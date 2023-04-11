<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="WebContent/style/bookManager.css" />
<title>Student Management</title>
<style>
input.error{
  border-color: red;
  color:red;
}
</style>
</head>
<body>
	<div class="layout-sc bg-secondary text-dark">
		<jsp:include page="Navbar.jsp"/>
		<div
			class="container-fluid row d-flex flex-column justify-content-around align-items-center ">
			<c:choose>
				<c:when test="${student == null}">
					<h3 class="mt-4">Add New Student</h3>
				</c:when>
				<c:otherwise>
					<h3 class="mt-4">Edit Student</h3>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${student == null}">
					<form id="myform" class="form-edit col-4 bg-light p-3 rounded"
						action="student?action=insert" method="post">
						<div class="form-group">
							<label for="email">Name:</label> <input type="text"
								class="form-control bg-light " name="name"
								placeholder="Enter Name" required="required">
						</div>
						<div class="form-group">
							<label for="pwd">Age:</label> <input type="number" min=1
								class="form-control bg-light " name="age"
								placeholder="Enter Age" required="required">
						</div>

						<label>Gender</label> <select name="gender"
							class="form-control bg-light  mb-4">
							<c:choose>
								<c:when test="${student.isGender() == true}">
									<option value="1" selected>Nam</option>
									<option value="0">Nữ</option>
								</c:when>
								<c:otherwise>
									<option value="0" selected>Nữ</option>
									<option value="1">Nam</option>
								</c:otherwise>
							</c:choose>
						</select>
						<button type="submit" class="btn btn-success btn-lg">Add</button>
						<a href="student" class="btn btn-info btn-lg">Back</a>
					</form>
				</c:when>
				<c:otherwise>
					<form class="form-edit col-4 bg-light p-3 rounded"
						action="student?action=update" method="post">
						<input type="hidden" name="id" value="${student.getStudentID()}" />
						<div class="form-group">
							<label for="email">Name:</label> <input type="text"
								value="${student.getName()}"
								class="form-control bg-light " name="name"
								placeholder="Enter Name">
						</div>
						<div class="form-group">
							<label for="pwd">Age:</label> <input type="number" min=1
								value="${student.getAge()}"
								class="form-control bg-light " name="age"
								placeholder="Enter Age">
						</div>
						<label>Gender</label> <select name="gender"
							class="form-control bg-light  mb-4" required="required">
							<c:choose>
								<c:when test="${student.isGender() == true }">
									<option value="1" selected>Nam</option>
									<option value="0">Nữ</option>
								</c:when>
								<c:otherwise>
									<option value="0" selected>Nữ</option>
									<option value="1">Nam</option>
								</c:otherwise>
							</c:choose>
						</select>
						<button type="submit" class="btn btn-warning btn-lg">Update</button>
						<a href="student" class="btn btn-info btn-lg">Back</a>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
<script>
$(document).ready(function() {
    // áp dụng validation cho biểu mẫu
    $("#myform").validate({
        // thiết lập các quy tắc validation cho từng trường
        rules: {
            name: {
                required: true,
                minlength: 3
            },
            age: {
                required: true,
                digits: true
            },
            gender: {
                required: true
            }
          
        },
        // thiết lập các thông báo lỗi tương ứng với từng trường
        messages: {
            name: {
                required: "Please enter your name",
                minlength: "Name must be at least 3 characters long"
            },
            age: {
                required: "Please enter age",
                digits: "Age must be a number"
            },
            gender: {
                required: "Please select gender"
            }   
        }
    });
});
</script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- jQuery Validation plugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
</html>