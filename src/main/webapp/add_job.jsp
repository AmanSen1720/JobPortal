<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page isELIgnored="false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add job</title>
<%@include file="front/CSS.jsp"%>
</head>
<body>
	<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>
	
	
	
	<%@include file="front/navbar.jsp"%>


	<div class="container p-2">

		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						<c:if test="${not empty msg }">
						<div class="alert alert-success" role="alert">${ msg}</div>
						<c:remove var="msg"/>
						</c:if>

						<h5>Add Jobs</h5>

					</div>

					<form action="addjob" method="post">

						<div class="form-group">
							<label>Enter Title</label> <input type="text" required
								class="form-control" name="title">

						</div>


						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label><select name="location"
									class="custom-select" id="inLineFormCustomSelectPref">
									<option selected>Choose..</option>
									<option value="Indore">Indore</option>
									<option value="Chennai">Chennai</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Ahemdabad">Ahemdabad</option>
									<option value="Delhi">Delhi</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Gurgaon">Gurgaon</option>
									<option value="Pune">Pune</option>
								</select>

							</div>

							<div class="form-group col-md-4">
								<label>Category</label><select name="category"
									class="custom-select" id="inLineFormCustomSelectPref">
									<option selected>Choose..</option>
									<option value="IT">IT</option>
									<option value="Teacher">Teacher</option>
									<option value="Developer">Developer</option>
									<option value="Engineer">Engineer</option>
									<option value="Bank Manager">Bank Manager</option>
								</select>
							</div>


							<div class="form-group col-md-3">
								<label>Status</label><select name="status" class="form-control">
									<option selected>Choose..</option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>

								</select>
							</div>
						</div>

						<div class="from-group">
							<label>Enter Description</label>
							<textarea rows="6" cols="" name="desc" class="form-control"></textarea>
						</div>

						<button class="btn btn-success mt-2">Publish Job</button>

					</form>

				</div>
			</div>
		</div>
	</div>


</body>
</html>