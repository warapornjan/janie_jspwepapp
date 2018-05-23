<%@page import="javafx.scene.control.Alert"%>
<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <title>JSP Page</title>

        <link href="https://fonts.googleapis.com/css?family=Kanit" rel="stylesheet">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- Latest compiled JavaScript -->
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body style="background-color: #ffff99; width:100%; font-family: 'Kanit', sans-serif; " >
    <br><br><center><img src='css/pony.png' style="width:20%"></img></center>
        <%
            ArrayList<Books> data = (ArrayList<Books>) request.getAttribute("listdata");
        %>

    <div class="container">
        <center>
            <table style="background-color: white" class="table table-hover table-bordered" width='100%'>
                <thead style="background-color: green; color: white;">
                    <tr>
                        <th class="text-center">Books_ID</th>
                        <th class="text-center">Book Name</th>
                        <th class="text-center">Author</th>
                        <th class="text-center">Price</th>

                        <th class="text-center">Edit/Delete</th>
                    </tr>  
                </thead>
                <% if (data.size() == 0) {%>
                <td colspan="4">No Data</td>
                <% } else {  %>
                <% for (int i = 0; i < data.size(); i++) {%>
                <tr>'
                    <td width="10%"><%=data.get(i).getBooks_id()%></td>
                    <td width="27%"><%=data.get(i).getBookname()%></td>
                    <td width="27%"><%=data.get(i).getAuthor()%></td>
                    <td width="15%" class="text-right"><%=data.get(i).getPrice()%></td>

                    <td width="21%">
                <center>
                    <input class="btn btn-danger" value="DELETE" type="button" id="deletebutton" onclick="document.location.href = 'ListBookServlet?mode=delete&books_id=<%=data.get(i).getBooks_id()%>'" />
                    <input class="btn btn-warning" value="EDIT" type="button" id="editbutton" onclick="document.location.href = 'AddServlet?mode=edit&books_id=<%=data.get(i).getBooks_id()%>'">
<!--               <input class="btn btn-warning" value="EDIT" type="button" id="editbutton" >-->
                </center> 
                </td>
                </tr>
                <% }
                    }
                %>
                <tr>
                    <td colspan="5" align="center">
                        <input class="btn btn-success" type="button" data-toggle="modal" data-target="#myModal" id="addbutton" value="ADD">

                        <!--onclick="document.location.href = 'AddServlet'"-->
                        <!-- Modal -->

                        

                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
                            
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">ADD NEW BOOK </h4>
                                    </div>

                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-3"> <label for="recipient-name" class="control-label">BOOK ID:</label> </div>
                                                    <div class="col-md-9"><input type="text" class="form-control" id="books_id"> </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-3"> <label for="message-text" class="control-label">Book name:</label></div>
                                                    <div class="col-md-9"> <input type="text"  class="form-control" id="bookname"></textarea></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-3"> <label for="message-text" class="control-label">Author:</label></div>
                                                    <div class="col-md-9"> <input type="text"  class="form-control" id="author"></textarea></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-3"> <label for="message-text" class="control-label">Price:</label></div>
                                                    <div class="col-md-9"> <input type="text"  class="form-control" id="price"></textarea></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-3"> <label for="message-text" class="control-label"> PPADD: </label></div>
                                                    <div class="col-md-9"> <input type="text"  class="form-control" id="PPADD"></textarea></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-3"> <label for="message-text" class="control-label"> PPDELETE: </label></div>
                                                    <div class="col-md-9"> <input type="text"  class="form-control" id="PPDELETE"></textarea></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-3"> <label for="message-text" class="control-label"> PPEDIT: </label></div>
                                                    <div class="col-md-9"> <input type="text"  class="form-control" id="PPEDIT"></textarea></div>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" id="savenewaccount"> Save <button>
                                                </div>
                                                </div>
                                                </div>
                                                </div>




                                                </td>
                                                </tr>
                                                </table>

                                                </center>
                                                </div>

                                                </body>
                                                <script>
                                                    $('#savenewaccount').click(function () {
                                                        var obj = {"bookid": $('#books_id').val(), 
                                                            "bookname": $('#bookname').val(),
                                                            "author": $('#author').val(), 
                                                            "price": $('#price').val(), 
                                                            "mode": $('#PPADD').val()};
//                                                        obj.bookid = $('#books_id').val();
//                                                        obj.bookname = $('#bookname').val();
//                                                        obj.author = $('#author').val();
//                                                        obj.price = $('#price').val();
//                                                        obj.mode = $('#PPADD').val();

                                                        $.ajax({
                                                            url: 'AddServlet',
                                                            //                           contentType: "application/json",
                                                            //   dataType: "json",
                                                            //   dataType: 'text',
                                                            type: 'POST',
                                                            data: obj,
                                                            success: function (data) {

                                                                //alert(data);
                                                                if(data=="ok"){
                                                                    alert("Alraedy save");
                                                                    location.reload();
                                                                }else{
                                                                    
                                                                }

                                                            }, error: function (request, textStatus, errorThrown) {
                                                                alert("ERROR");
                                                            }
                                                        }
                                                        ); // close ajax

                                                        //jQuery("#myModal").remove();
                                                        //response.sendRedirect("ListBookServlet");
                                                        $('#myModal').modal('hide');
                                                        //location.reload();

                                                    });
                                                    //    function someFunction(data) {
                                                    //        // Do something with your data
                                                    //        //response.sendRedirect("ListBookServlet");
                                                    //
                                                    //    }


//                                                    if (id == "addbutton") {
//                                                        $('#addbutton').click(function () {
//                                                            $('#PPADD').val("add");
//                                                        });
//                                                    } else if (id == "delete") {
//                                                        $('#deletebutton').click(function () {
//                                                            $('#PPDELETE').val("delete");
//                                                        });
//                                                    } else if (id = "edit") {
//                                                        $('#editbutton').click(function () {
//                                                            $('#PPEDIT').val("edit");
//                                                        });
//                                                    }
                                                    $('#addbutton').click(function () {
                                                        $('#PPADD').val("add");
                                                    });
                                                    $('#deletebutton').click(function () {
                                                        $('#PPDELETE').val("delete");
                                                    });
                                                    $('#editbutton').click(function () {
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        $('#PPEDIT').val("edit");
                                                    });



                                                </script>    
                                                </html>



