package com.sms.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class MainClass {
public static void main(String[] args) {
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("dbInfo");
	EntityManager em =emf.createEntityManager();
	EntityTransaction et =em.getTransaction();
	et.begin();
	et.commit();
	System.out.println("Done..!");
}
}
