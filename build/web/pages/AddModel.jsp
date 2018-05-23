<%-- 
    Document   : AddModel
    Created on : May 23, 2018, 10:40:12 PM
    Author     : Jane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

        
        
        
    </body>
</html>
