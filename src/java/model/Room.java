/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author wachirawittan
 */
public class Room {

    private static ArrayList<Books> books = new ArrayList<Books>();

    public static boolean addBook(Books stu) {

        if (books.add(stu)) {
            return true;
        } else {
            return false;
        }
    }

    public static ArrayList<Books> getAllBook() {

        return books;
    }

    public static void deleteBook(String name) {
        for (int i = 0; i < books.size(); i++) {
            if (name.equals(books.get(i).getBooks_id())) {
                books.remove(i);
            }
        }
    }

    public static Books getBookByName(String name) {
        Books datatemp = null;
        for (int i = 0; i < books.size(); i++) {
            if (name.equals(books.get(i).getBookname())) {
                datatemp = books.get(i);
            }
        }
        return datatemp;
    }

    public static boolean UpdateBook(String bookname, String author, String price) {
        boolean result = false;
        for (int i = 0; i < books.size(); i++) {
            if (bookname.equals(books.get(i).getBookname())) {
                books.get(i).setBookname(bookname);
                books.get(i).setAuthor(author);
                books.get(i).setPrice(price);
                result = true;
            }
        }
        return result;
    }

}
