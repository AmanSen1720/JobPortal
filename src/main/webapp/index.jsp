<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="front/CSS.jsp"%>
</head>
<style type="text/css">
.back-img {
	background: url("front/image/job3.png") no-repeat center center fixed;
	width: 100%;
	height: 80vh;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

<body>

	
	<%@include file="front/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-dark p-4">
				<i class="fa-sharp fa-solid fa-book"></i> JOBS
			</h1>
		</div>
	</div>

	<%@include file="front/footer.jsp"%>

</body>
</html>