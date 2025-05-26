<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.JobDao"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User view jobs</title>
<%@include file="front/CSS.jsp"%>
</head>
<body style="background-color: #F2F3F4">

<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="front/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>
				
				<c:if test="${not empty msg }">
					<h4 class="text-center text-danger">${msg }</h4>
					<c:remove var="msg" />
				</c:if>

				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>

							<div class="form-gorup col-md-4 mt-1">
								<h5>Category</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="loc" class="custom-select"
									id="inlineCustomFormSelectPref">
									<option selected Value="lo">Choose</option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Delhi">Delhi</option>
									<option value="Banglore">Banglore</option>
									<option value="Chennai">Chennai</option>
								</select>
							</div>

							<div class="form-group col-md-5">
								<select class="CustomSelect" id="inlineFromCustomSelect"
									name="cat">
									<option value="ca" selected>Choose..</option>
									<option value="IT">IT</option>
									<option value="Banking">Banking</option>
									<option value="Developer">Developer</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<button class="btn btn-success">Submit</button>
						</form>
					</div>
				</div>
			<%
				JobDao dao = new JobDao(DbConnect.getCon());
				List<Jobs> list = dao.getAllJobs();
				for(Jobs j : list){
			%>
				<div class="card mt-2">
						<div class="card-body">
						<div class="text-center text-primary">
						<i class="far fa-clipboard fa-2x"></i>
						</div>
					<h6><%=j.getTitle() %></h6>
					
					<% if(j.getDescription().length()>0 && j.getDescription().length() < 120) {
					%>
					<p> <%=j.getDescription()%></p>
					<%
					}else{
						%>
						<p><%=j.getDescription().substring(0,120)%>...
						</p>
					<% 
					}
					%>
					
					<br>
					<div class="form-group">
					<div class="form-group col-md-3">
					<input type="text" class="form-control form-control from-control-sm"
					value="Location : <%=  j.getLocation() %> " readonly>
					</div>
					
					<div class="form-group col-md-3">
					<input type="text" class="form-control form-control-sm"
					value="Category :  <%=j.getCategory()%> "readonly>
					</div>
					</div>
					<h6>Publish Date : <%=  j.getPdate().toString() %></h6>
					
					<div class="text-center">
					<a href="one_view.jsp?id=  <%=j.getId()%>" class="btn btn-sm bg-success text-white">View More</a>
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