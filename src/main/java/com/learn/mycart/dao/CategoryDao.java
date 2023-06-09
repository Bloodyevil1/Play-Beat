package com.learn.mycart.dao;

import java.util.List;

import javax.persistence.Query;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.mycart.entities.category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public String saveCategory(category cat) {
		
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction(); 
		session.save(cat);
		
		
		tx.commit();
		session.close();
		return "success" ;
	}
	
	public List<category> getCategories(){
		Session session = this.factory.openSession();
		Query query = session.createQuery("from category");
		List<category> list = query.getResultList();
		return list;
		
	}
	
	
	public category getCategoryByID(int cid) {
		category cat = null;
		try {
			Session session = this.factory.openSession();
			cat = session.get(category.class, cid);
			
			
			
			
			session.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cat;
	}
}
