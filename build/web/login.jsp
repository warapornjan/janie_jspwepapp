
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <title>Login form</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Kanit" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body style="background-color:#ffff99 ; width:100%;" >
    <center>
        <br><br>
        &nbsp;&nbsp;&nbsp;<img src='css/pony.png' style="width:20%"></img><br><br>
        
                    <form method="post" action="LoginServlet" >
                        <font color="black">User name : </font>
                        <input type="text" name="userName" id="userName" class="form-control input-sm chat-input" placeholder="username" /><br/>
                        <font color="black">Password :&nbsp; </font>
                        <input type="password" name="password" id="password" class="form-control input-sm chat-input" placeholder="password"/><br/>
                        <br>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="login" />&nbsp;
                        <input value="register" type="button" onclick ="document.location.href = 'register.jsp'"  />

                    </form></center>
    </body>
</html>
