package com.flower.interceptor;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 去掉首尾空格
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class HibernateInterceptor implements Interceptor {

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public void destroy() {

	}

	@Override
	public void init() {
		
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//System.out.println("hibernate session");
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
		
		try{
			String ret = invocation.invoke();
			session.flush();
			tx.commit();
			return ret;
		} catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

}
