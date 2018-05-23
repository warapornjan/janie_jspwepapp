<%@page import="model.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CAT BOOK</title>
        <link href="https://fonts.googleapis.com/css?family=Kanit" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">

    </head>
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 50%;
            border-radius: 4px;
        }

        #customers td, #customers th {
            border: 1px solid #ddd;
            padding: 5px;
            border-radius: 4px;
        }

        #customers tr:nth-child(even){
            background-color: #f2f2f2;
            border-radius: 4px;
        }

        #customers tr:hover {
            background-color: #ddd;
            border-radius: 4px;
        }

        #customers th {

            width: 30%;
            margin: 8px 0;
            text-align: left;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
        }
        input[type=text], select {
            width: 100%;
            padding: 5px 5px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: 'Kanit', sans-serif;

        }


        input[type=submit] {
            width: 20%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-family: 'Kanit', sans-serif;

        }
        input[type=reset] {
            width: 20%;
            background-color: orange;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-family: 'Kanit', sans-serif;

        }
        input[type=button] {
            width: 10%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-family: 'Kanit', sans-serif;

        }

        input[type=submit]:hover {
            background-color: #45a049;
            font-family: 'Kanit', sans-serif;

        }
        input[type=reset]:hover {
            background-color: #45a049;
            font-family: 'Kanit', sans-serif;

        }

    </style>
    
    <body style="background-color: wheat" ><center>
        <img src='css/pony.png' style="width:15%"></img>
        <%
            Books stu = (Books) request.getAttribute("stuEdt");
            String mode = (String) request.getAttribute("mode");
        %>

        
        <form name="addBooks" method="post" action="AddServlet" >
            <table  id="customers">

                <input type="hidden" name="mode" value="<%=request.getAttribute("mode")%>" />
                <% if (mode != null && mode.equals("add")) { %>

                <tr>
                    <td colspan="2" align="center">
                        <h2>Add Book Form</h2>
                    </td>
                </tr>
                <tr>
                    <th>BOOKS_ID : </td><td><input type="text" name="books_id"/></th>
                </tr>
                <tr>
                    <th>Book Name : </td><td><input type="text" name="bookname"/></th>
                </tr>
                <tr>
                    <th>Author : </td><td><input type="text" name="author"/></th>
                </tr>
                <tr>
                    <th>Price : </td><td><input type="text" name="price"/></th>
                </tr>


                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="ADD" />
                        <input type="reset" value="RESET" />
                    </td>
                </tr>
        </form>
               
                
                
                

        <% } else if (mode != null && mode.equals("edit")) {%>
        <tr>
            <td colspan="2" align="center">
                <h2>Edit Book Form</h2>
            </td>
        </tr>
        <tr>
            <td>BOOKS_ID : </td><td><input type="text" name="books_id" value="<%=stu.getBooks_id()%>" readonly /></td>
        </tr>

        <tr>
            <td>Book Name : </td><td><input type="text" name="bookname" value="<%=stu.getBookname()%>"/></td>
        </tr>
        <tr>
            <td>Author : </td><td><input type="text" name="author" value="<%=stu.getAuthor()%>"/></td>
        </tr>
        <tr>
            <td>Price : </td><td><input type="text" name="price" value="<%=stu.getPrice()%>"/></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="EDIT" />
                <input type="reset" value="RESET" />
            </td>
        </tr>
        <% }%>

    </table>
</form>
</center>
</body>
</html>
