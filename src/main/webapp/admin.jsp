<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>

<%@include file="front/CSS.jsp"%>

</head>

<style type="text/css">
.back-img {
	background: url("front/image/admnpage.jpg") no-repeat center center
		fixed;
	width: 100%;
	height: 80vh;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

<body>

<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>
	
	<%@include file="front/navbar.jsp"%>

	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-dark p-4">WELCOME</h1>
		</div>
	</div>



	<%@include file="front/footer.jsp"%>


</body>
</html>