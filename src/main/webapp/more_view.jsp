<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jobs</title>
<%@include file="front/CSS.jsp"%>
</head>
<body style="background-color: #F2F3F4 ">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="front/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<%
				String loc = request.getParameter("loc");
				String cat = request.getParameter("cat");
				String msg = "";

				JobDao dao = new JobDao(DbConnect.getCon());
				List<Jobs> list = null;

				if ("lo".equals(loc) && "Ca".equals(cat)) {
					list = new ArrayList<Jobs>();
					msg = "JOBS not available";
				} else if ("lo".equals(loc) || "ca".equals(cat)) {
					list = dao.getJobsORLocationAndCate(cat, loc);
				} else {
					list = dao.getJobsAndLocationAndCate(cat, loc);
				}
				if (list.isEmpty()) {
				%>
				<h4 class="text-center text-danger">Job Not Available</h4>
				<%
				}
				if (list != null) {

				for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="form-row">
							<div class="form-row col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location : <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-row col-md-3 ml-2" >
								<input type="text" class="form-control form-control-sm"
									value="Category : <%=j.getCategory()%>" readonly>
							</div>
						</div>

						<h6>
							Publish Date :
							<%=j.getPdate().toString()%></h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View</a>
						</div>
					</div>
				</div>
				<%
				}
				} else {
					%>
					<h4 class="text-center text-danger"> <%= msg %> </h4>
					<%
					}
				%>
			</div>
		</div>
	</div>



</body>
</html>