<%@page import="javafx.scene.control.Alert"%>
<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Books"%>
<%@page import="controller.AddServlet"%>
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
                
                <tr>
                    <td width="10%" class="books_id"><%=data.get(i).getBooks_id()%></td>
                    <td width="27%" class="book_name"><%=data.get(i).getBookname()%></td>
                    <td width="27%" class="book_author"><%=data.get(i).getAuthor()%></td>
                    <td width="15%" class="text-right book_price"><%=data.get(i).getPrice()%></td>

                    <td width="21%">
                <center>
                    <input class="btn btn-danger" value="DELETE" type="button" class="deletebutton" onclick="deletebutton(<%=data.get(i).getBooks_id()%>, this)"  />
<!--                    onclick="document.location.href = 'ListBookServlet?mode=delete&books_id=<%=data.get(i).getBooks_id()%>'"-->
<!--                    <input class="btn btn-warning" value="EDIT" type="button" id="editbutton" onclick="document.location.href = 'AddServlet?mode=edit&books_id=<%=data.get(i).getBooks_id()%>'">-->

                    <input class="btn btn-success editbutton" type="button" data-toggle="modal" data-target="#myModal" value="EDIT" >

                    <!--onclick="document.location.href = 'AddServlet'"-->
                    <!-- Modal -->



                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >

                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">EDIT BOOK </h4>
                                </div>

                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-3"> <label for="recipient-name" class="control-label">BOOK ID:</label> </div>
                                                <div class="col-md-9"><input type="text" class="form-control" id="books_id" name="bookid" value="oldvalue_bookid_add"  > </div>
<!--                                                       <div class="col-md-9"><input type="text" class="form-control" id="books_id" value="$('#add_books_id')">-->

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-3"> <label for="message-text" class="control-label">Book name:</label></div>
                                                <div class="col-md-9"> <input type="text"  class="form-control" id="bookname" value=""></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-3"> <label for="message-text" class="control-label">Author:</label></div>
                                                <div class="col-md-9"> <input type="text"  class="form-control" id="author" value=""></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-3"> <label for="message-text" class="control-label">Price:</label></div>
                                                <div class="col-md-9"> <input type="text"  class="form-control" id="price" value=""></div>
                                            </div>
                                        </div>
                                        <!--
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
                                        </div> -->
                                    </form>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" id="saveupdateaccount"> Save <button>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            <!--               <input class="btn btn-warning" value="EDIT" type="button" id="editbutton" >-->
                                            </center> 

                                            </td>
                                            </tr>
                                            <% }
                                                }
                                            %>
                                            <tr>
                                                <td colspan="5" align="center">
                                                    <input class="btn btn-success" type="button" data-toggle="modal" data-target="#addModal" id="addbutton" value="ADD">

                                                    <!--onclick="document.location.href = 'AddServlet'"-->
                                                    <!-- Modal -->



                                                    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >

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
                                                                                <div class="col-md-9"><input type="text" class="form-control" id="add_books_id"> </div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <div class="row">
                                                                                <div class="col-md-3"> <label for="message-text" class="control-label">Book name:</label></div>
                                                                                <div class="col-md-9"> <input type="text"  class="form-control" id="add_bookname"></textarea></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <div class="row">
                                                                                <div class="col-md-3"> <label for="message-text" class="control-label">Author:</label></div>
                                                                                <div class="col-md-9"> <input type="text"  class="form-control" id="add_author"></textarea></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <div class="row">
                                                                                <div class="col-md-3"> <label for="message-text" class="control-label">Price:</label></div>
                                                                                <div class="col-md-9"> <input type="text"  class="form-control" id="add_price"></textarea></div>
                                                                            </div>
                                                                        </div>
                                                                        <!--
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
                                                                        </div> -->
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
                                                                                    // $('#PPADD').val("add");
                                                                                    var obj = {"bookid": $('#add_books_id').val(),
                                                                                        "bookname": $('#add_bookname').val(),
                                                                                        "author": $('#add_author').val(),
                                                                                        "price": $('#add_price').val(),
                                                                                        "mode": "add"};//var obj
                                                                                    //                                                        obj.bookid = $('#books_id').val();
                                                                                    //                                                        obj.bookname = $('#bookname').val();
                                                                                    //                                                        obj.author = $('#author').val();
                                                                                    //                                                        obj.price = $('#price').val();
                                                                                    //       
                                                                                    //                                                                                                         obj.mode = $('#PPADD').val();

                                                                                    $.ajax({
                                                                                        url: 'AddServlet',
                                                                                        //                           contentType: "application/json",
                                                                                        //   dataType: "json",
                                                                                        //   dataType: 'text',
                                                                                        type: 'POST',
                                                                                        data: obj,
                                                                                        success: function (data) {

                                                                                            //alert(data);
                                                                                            // if (data == "ok") {
                                                                                            alert("Alraedy save");
                                                                                            location.reload();
                                                                                            //} else {

                                                                                            //}

                                                                                        }//success function 
                                                                                        , error: function (request, textStatus, errorThrown) {
                                                                                            alert("ERROR");
                                                                                        }//error function
                                                                                    }); // close ajax

                                                                                    $('#myModal').modal('hide');
                                                                                    //location.reload();

                                                                                });
                                                                                //savenewaccount


                                                                                //saveupdateaccount
                                                                                $('#saveupdateaccount').click(function () {
                                                                                    
                                                                                    
                                                                                    
                                                                                    

                                                                                    var obj = {"bookid": $('#books_id').val(),
                                                                                        "bookname": $('#bookname').val(),
                                                                                        "author": $('#author').val(),
                                                                                        "price": $('#price').val(),
                                                                                        "mode": "edit"};
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
                                                                                            //   if (data == "ok") {
                                                                                            alert("Update");
                                                                                            location.reload();
                                                                                            //  } else {

                                                                                            // }

                                                                                        }, error: function (request, textStatus, errorThrown) {
                                                                                            alert("ERROR");
                                                                                        }
                                                                                    }); // close ajax
                                                                                   
                                                                                        
                                                                                        
                                                                                        
                                                                                    //jQuery("#myModal").remove();
                                                                                    //response.sendRedirect("ListBookServlet");
                                                                                    $('#myModal').modal('hide');
                                                                                    //location.reload();

                                                                                });//saveupdateaccount
                                                                                //    function someFunction(data) {
                                                                                //        // Do something with your data
                                                                                //        //response.sendRedirect("ListBookServlet");
                                                                                //
                                                                                //    }

//delete button 
                                                                                function deletebutton(books_id) {
                                                                                    var obj = {"bookid": books_id,
                                                                                        "bookname": "",
                                                                                        "author": "",
                                                                                        "price": "",
                                                                                        "mode": "delete"};
                                                                                    //                                                        obj.bookid = $('#books_id').val();
                                                                                    //                                                        obj.bookname = $('#bookname').val();
                                                                                    //                                                        obj.author = $('#author').val();
                                                                                    //                                                        obj.price = $('#price').val();
                                                                                    //                                                        obj.mode = $('#PPADD').val();

                                                                                    $.get(
                                                                                            'ListBookServlet?mode=delete&books_id=' + books_id,
                                                                                            function (data) {

                                                                                                //alert(data);
                                                                                                // if (data == "ok") {
                                                                                                //confirm("Are you sure to  delete");

                                                                                               // location.reload();


                                                                                                var txt;
                                                                                                var r = confirm("Are you sure to  delete");
                                                                                                if (r == true) {
                                                                                                    txt = "You pressed OK!";
                                                                                                    location.reload();
                                                                                                    
                                                                                                } else {
                                                                                                    txt = "You pressed Cancel!";
                                                                                                }
//                                                                                                var x = confirm("Are you sure you want to delete?");
//                                                                                                if (x)
//                                                                                                    return true;
//                                                                                                    location.reload();
//                                                                                                else
//                                                                                                    return false;
                                                                                            alert(txt);
                                                                                            }

                                                                                    ); // close ajax

                                                                                    //jQuery("#myModal").remove();
                                                                                    //response.sendRedirect("ListBookServlet");
                                                                                    $('#myModal').modal('hide');
                                                                                    //location.reload();

                                                                                }
                                                                                ;
                                                                                
                                                                                /*$('.editbutton').click(function  (){
                                                                                    var oldvalue_bookid_add = ($("#add_books_id").val());
                                                                                    var oldvalue_bookname_add = ($("#add_bookname").val());
                                                                                    var oldvalue_author_add = ($("#add_author'").val());
                                                                                    var oldvalue_price_add = ($("#add_price'").val());
                                                                                   
                                                                                })*/
                                                                                
                                                                                $('.editbutton').click(function() {
                                                                                    var tr = $(this).parent().parent().parent()
                                                                                    var book_name = tr.find('.book_name').text()
                                                                                    console.log(book_name);
                                                                                    var books_id = tr.find('.books_id').text()
                                                                                    console.log(books_id);
                                                                                    var book_author = tr.find('.book_author').text()
                                                                                    console.log(author);
                                                                                    var book_price = tr.find('.book_price').text()
                                                                                    console.log(price);
                                                                                    var book_mode = tr.find('.mode').text()
                                                                                    console.log(book_mode);
                                                                                    
                                                                                    $("#myModal #books_id").val(books_id)
                                                                                    $("#myModal #bookname").val(book_name)
                                                                                    $("#myModal #author").val(book_author)
                                                                                    $("#myModal #price").val(book_price)
                                                                                   //  $("#myModal #mode").val(book_mode)
                                                                                })
                                                                            </script>    
                                                                            </html>



