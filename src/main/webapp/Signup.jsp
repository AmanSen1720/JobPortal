<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<%@include file="front/CSS.jsp"%>

</head>

<body style="background-color:#E8F8F5">
	<%@include file="front/navbar.jsp"%>
	
<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa-solid fa-user-plus fa-2x"></i>
							<h5>Registration</h5>
							
							<c:if test="${not empty msg }">
						<div class="alert alert-success" role="alert">${ msg}</div>
						<c:remove var="msg"/>
						</c:if>

							<form action="add_user" method="post">
							
							<div class="form-group text-left">
									<label for="exampleInputName">Enter full name</label> <input
										type="text" class="form-control" id="exampleInputname"
										required="required" aria-describedby="emailHelp" placeholder="Enter full name" name="fullname">
										</div>
										
							<div class="form-group text-left">
									<label for="exampleInputqualification">Enter Qualification</label> <input
										type="text" class="form-control" id="exampleInputQualification"
										required="required" aria-describedby="emailHelp" placeholder="Enter Qualification" name="qualification">
										</div>
								
								
								<div class="form-group text-left">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										required="required" aria-describedby="emailHelp" placeholder="Enter email" name="email">
						
								</div>
								<div class="form-group text-left">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" required="required" placeholder="Enter Password" name="password">
								</div>
								
								<button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
</div>
</body>
</html>