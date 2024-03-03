<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Zumba Class Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
        <div>
            <a href="https://www.xadmin.net" class="navbar-brand"> Zumba Class Management</a>
        </div>

        <ul class="navbar-nav">
            <li><a href="${pageContext.request.contextPath}/list" class="nav-link">Students</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/insert" method="post">

                <caption>
                    <h2>Add New Student Details</h2>
                </caption>

                <fieldset class="form-group">
                    <label>Student Name</label>
                    <input type="text" class="form-control" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Student Email</label>
                    <input type="text" class="form-control" name="email">
                </fieldset>

                <fieldset class="form-group">
                    <label>Student Country</label>
                    <input type="text" class="form-control" name="country">
                </fieldset>

                <fieldset class="form-group">
                    <label>Preferred Timings</label>
                    <input type="text" class="form-control" name="timing">
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
