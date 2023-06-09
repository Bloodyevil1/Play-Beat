package com.learn.mycart.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	private static SessionFactory factory;
	
	
	public static SessionFactory getFactory()
	{
		try {
			
			if(factory == null) {
				factory = new Configuration().configure().buildSessionFactory();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return factory;
	}
}
