package com.cosmicbyte.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration	
@ComponentScan(basePackages="com.cosmicbyte.*") 	//It will scan all the files automatically from 'com.k17'
@EnableTransactionManagement 
public class AppConfig {
	
/*
 * '@Bean' is use for creating memory for this methods.
 * So whenever we are calling 'AppConfig' Class Automatically the memory is going to create 
 * For 'DataSource' Object , For 'Properties' Object, For 'SessionFactory' Object. 
 */
	@Bean(name = "datasource")
	public DataSource getDataSource() {		//<- This code we write for connecting to our database, Same like 'cfg.xml' file. 
		

		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/cosmicbyte");

		dataSource.setUsername("root"); 
		dataSource.setPassword("root");
		return dataSource;
	}
	
	private Properties getHibernateProperties()	{	//<- This code also shifted from 'cfg.xml' file to here.
		 
	   	Properties properties = new Properties();
	   	properties.put("hibernate.show_sql", "true");
	   	properties.put("hibernate.hbm2ddl.auto", "update");
	   	properties.put("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
	   	return properties;
	 }
	
	 @Bean (name = "sessionFactory")
	 public LocalSessionFactoryBean getSessionFactory() {
		/*
		 * This SessionFactory which creates a session with the database 
		 * In this method we are providing 'DataSource', 'PackagesToScan' and 'HibernateProperties' to 'SessionFactory'.	
		 */
		 LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
	  
		/*
		 * Here we providing 'getDataSource()' Method, 'getDataSource()' Method has information that we needed 
		 * to connect with our data base.
		 */
		 sessionFactory.setDataSource(getDataSource());	
	  
		/*
		 * Here we providing Model package name which has all the classes in it, 
		 * So we not need to pass each class name individually 
		 */
		 sessionFactory.setPackagesToScan("com.cosmicbyte.model");
	  
		/*
		 * Here we providing 'getHibernateProperties()' Method, 'getHibernateProperties()' Method has some HIBERNATE 
		 * information like:- we have to show SQL Query, Generate Tables, Update Tables Automatically
		 */
		 sessionFactory.setHibernateProperties(getHibernateProperties());	 
	     return sessionFactory;
	   }
	 
	   /*
	    * If we add this TransactionManager in AppConfig so we don't have to manage 
	    * the transaction this is going to manage the transactions.
	    */
	    @Bean(name = "transactionManager")
		public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
	    	 
			HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
			return transactionManager;
	    }

}
