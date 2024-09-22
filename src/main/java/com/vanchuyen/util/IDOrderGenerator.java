package com.vanchuyen.util;

import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class IDOrderGenerator implements IdentifierGenerator {

	private String prefix = "ORD";
	
	public IDOrderGenerator() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		String query = "select c.orderID from Orders c";
		
		int maxID = session.createQuery(query, String.class).stream()
															.map(id -> id.replace(prefix, ""))
															.mapToInt(Integer::parseInt)
															.max()
															.orElse(0);
		return prefix + (String.format("%03d", maxID + 1));
	}
	
}
