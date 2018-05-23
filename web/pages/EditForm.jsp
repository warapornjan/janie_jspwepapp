<%-- 
    Document   : EditForm
    Created on : May 23, 2018, 10:05:07 PM
    Author     : Jane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <tr>
            <td colspan="2" align="center">
                <h2>Edit Book Form</h2>
            </td>
        </tr>
        <tr>
            <td>BOOKS_ID : </td><td><input type="text" name="books_id" value="${param.books_id}" readonly /></td>
        </tr>

        <tr>
            <td>Book Name : </td><td><input type="text" name="bookname" value="${param.bookname}"/></td>
        </tr>
        <tr>
            <td>Author : </td><td><input type="text" name="author" value="${param.author}"/></td>
        </tr>
        <tr>
            <td>Price : </td><td><input type="text" name="price" value="${param.price}"/></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="EDIT" />
                <input type="reset" value="RESET" />
            </td>
        </tr>
