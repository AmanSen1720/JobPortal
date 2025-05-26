<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="front/CSS.jsp"%>

</head>

<body style="background-color:#EAF2F8">
	<%@include file="front/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa-solid fa-user-plus fa-2x"></i>
							<h5>Login Page</h5>

							<c:if test="${not empty msg }">
							<h4 class="text-center text-danger">${msg }</h4>
							<c:remove var="msg"/>
							</c:if>
							
							
							<form action="login" method="post">

								<div class="form-group text-left">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										required="required" aria-describedby="emailHelp" placeholder="Enter email" name="email1">
						
								</div>
								<div class="form-group text-left">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" required="required" placeholder="Password" name="password1">
								</div>
								
								<button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
</div>
</body>
</html>