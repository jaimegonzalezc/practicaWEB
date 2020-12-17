package com.company;

import java.sql.Connection;

public class Main {

    public static void main(String[] args) {
	// write your code here
        //Connection datos =  DbUtil.getConnection();
        User usuario = new User("78623387G", "Juan", "Gutiérrez", "juan.gutierrez@gmail.com", "juanito123", "Clientes", 981729763);
        UserDao dao = new UserDao();
        dao.addUser(usuario);

    }
}
