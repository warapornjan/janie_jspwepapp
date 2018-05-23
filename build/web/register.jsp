<%-- 
    Document   : register
    Created on : Feb 14, 2018, 1:53:12 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Kanit" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <title>CATBOOK</title>
    </head>
    <body><center>
          <br><br>
          &nbsp;&nbsp;&nbsp;<img src='css/pony.png' style="width:15%"></img>
        <form method="post" action="RegisterServlet">
        <br>Username:&nbsp; <input type="text" name="user_name" class="form-control input-sm chat-input" placeholder="username"/><br/>
        Password:&nbsp;&nbsp; <input type="password" name="password" class="form-control input-sm chat-input" placeholder="password" /><br/>
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="register" />
        </form></center>
    </body>
</html>
