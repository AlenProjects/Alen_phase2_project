<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="com.xadmin.zumbaclassmanagement.bean.User"%> 


<html>
<head>
    <title>Zumba Class Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
        <div>
            <a href="https://www.xadmin.net" class="navbar-brand"> Zumba Class Management Application </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <div class="container">
        <h3 class="text-center">List of Students</h3>
        <hr>
        <div class="container text-left">
            <a href="${pageContext.request.contextPath}/new" class="btn btn-success">+ ADD STUDENT</a>
        </div>
        <br>
        <table id="myTable" class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Country</th>
                    <th>Timing</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            	<%ArrayList<User> user =  
            (ArrayList<User>)request.getAttribute("listUser"); 
            	for(User s:user){%> 
                    <tr>
                    	<td><%=s.getId() %></td>
                        <td><%=s.getName() %></td>
                        <td><%=s.getEmail() %></td>
                        <td><%=s.getCountry() %></td>
  						<td><%=s.getTiming() %></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/edit?id=<%=s.getId() %>" class="btn btn-outline-success">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/delete?id=<%=s.getId() %>" class="btn btn-outline-danger">Delete</a>
                        </td>
                    </tr>
                   <%}%>
            
            </tbody>
        </table>
    </div>
</div>
<script>
    $(document).ready( function () {
        $('#myTable').DataTable();
    } );
</script>
</body>
</html>
