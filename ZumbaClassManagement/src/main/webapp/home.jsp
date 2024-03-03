<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>Zumba Database</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        p {
            color: #666;
        }
        
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to CalmFit Zumba Classes</h1>
        <p>Zumba is a dynamic and energetic dance fitness program that has gained worldwide popularity since its inception in the 1990s. Created by Colombian dancer and choreographer Alberto "Beto" Perez, Zumba combines Latin and international music with dance movements to create a fun and effective workout experience. The primary focus of Zumba is on cardiovascular exercise, with an emphasis on burning calories and improving overall fitness levels. What sets Zumba apart from other dance fitness programs is its incorporation of various dance styles, including salsa, merengue, cumbia, reggaeton, samba, and hip-hop, among others. These dance styles are blended seamlessly into choreographed routines that participants can easily follow.<br><br>Zumba classes typically start with a warm-up session to prepare the body for movement and gradually increase heart rate. Following the warm-up, instructors lead participants through a series of high-energy dance routines set to upbeat music. The choreography is designed to be accessible to people of all fitness levels, with options for modifying movements to suit individual needs.<br><br>Overall, Zumba is a dynamic and inclusive dance fitness program that provides a full-body workout while also promoting joy, self-expression, and community. Whether you're a seasoned dancer or a complete beginner, Zumba offers something for everyone and is a great way to stay fit, have fun, and connect with others.</p>
        <br><br><br><br><br><a href="${pageContext.request.contextPath}/list" class="btn btn-outline-primary">View Student List</a>
    </div>
</body>
</html>
