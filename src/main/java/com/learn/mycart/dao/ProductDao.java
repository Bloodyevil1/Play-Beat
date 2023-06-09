package com.learn.mycart.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.mycart.entities.product;

public class ProductDao {

	private SessionFactory factory;
	public  ProductDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public boolean savProduct(product product) {
		boolean f = false;
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();  
			
			session.save(product);
			
			tx.commit();
			session.close();
			f=true; 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<product> getAllProduct(){
		Session s = this.factory.openSession();
		Query query = s.createQuery("from product");
		List<product> list=query.getResultList();
		return list;
	}
	
	public List<product> getAllProductById(int cid){
		Session s = this.factory.openSession();
		Query query = s.createQuery("from product as p where p.category.categoryId = :id");
		query.setParameter("id", cid);
		List<product> list=query.getResultList();
		return list;
	}
	
}
