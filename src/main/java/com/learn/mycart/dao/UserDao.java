package com.learn.mycart.dao;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.learn.mycart.entities.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public User getUserByEmailAndPassword(String email, String password){
		
		User user = null;
		try {
			Session session = this.factory.openSession();
			user = (User) session.createQuery("from User where userEmail = :e and userPassword = :p").setParameter("e", email).setParameter("p", password)
					.uniqueResult();
			session.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
		
	}
}
