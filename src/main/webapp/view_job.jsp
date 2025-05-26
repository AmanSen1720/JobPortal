<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page isELIgnored="false" %>



<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.JobDao"%>
<%@page import="com.entity.Jobs"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Jobs</title>
<%@include file="front/CSS.jsp"%>

</head>


<body style="background-color: #E8F6F3">
	
	<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>
	
	
	<%@include file="front/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<c:if test="${not empty msg }">
					<div class="alert alert-success" role="alert">${ msg}</div>
					<c:remove var="msg" />
				</c:if>


				<%
				JobDao dao = new JobDao(DbConnect.getCon());
				List<Jobs> list = dao.getAllJobs();
				for (Jobs j : list) {
				%>

				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far far-clipboad"></i>
						</div>

						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location :<%=j.getLocation()%>" readonly></input>
							</div>

							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category :<%=j.getCategory()%>" readonly></input>

							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status :<%=j.getStatus()%>" readonly></input>
							</div>


						</div>
						<div class="text-center">
							<a href="edit_job.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a> 
								<a href="delete?id=<%=j.getId()%>"
								   class="btn btn-sm bg-danger text-white">Delete</a>
						</div>
					</div>
				</div>

				<%
				}
				%>

			</div>
		</div>
	</div>
</body>
</html>