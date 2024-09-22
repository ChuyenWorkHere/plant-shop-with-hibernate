import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.vanchuyen.model.Orders;
import com.vanchuyen.util.HibernateUtil;

public class Test {
	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		
        Orders o = new Orders();
		o.setAddress("Number 5, Tom Street");
		o.setCity("New York");
		o.setCompany("Toho");
		o.setEmail("admin@example.com");
		o.setfName("Tom");
		o.setlName("Cruise");
		o.setNote("Nothing");
		o.setPhone("011335577");
		o.setStatus("SUCCESS");
		
		Session session = sessionFactory.openSession();
		
		session.getTransaction().begin();
		
		
		session.persist(o);
		
		session.getTransaction().commit();
		
	}
}
