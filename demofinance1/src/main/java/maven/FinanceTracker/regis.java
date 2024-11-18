package maven.FinanceTracker;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;



public class regis {
	public int sh(String fn,String ln,String pass,String mob,String mail) {
		System.out.print("Hey!");
		SessionFactory sf=(SessionFactory) hibernate.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		reg r=new reg();
		reg reg1=s.get(reg.class,mail);
		if(reg1!=null) {
			tx.commit();
			s.close();
			return 0;
		}
		else {
		r.setFname(fn);
		r.setLname(ln);
		r.setPassword(pass);
		r.setMobile(mob);
		r.setMail(mail);
		s.persist(r);
		tx.commit();
		s.close();
		System.out.print("Done!");
		return 1;
		}
	}
	public int log(String mail1,String pass) {
		SessionFactory sf=(SessionFactory) hibernate.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		reg reg1=s.get(reg.class,mail1);
		//System.out.print(reg1.getMail());
		if(reg1!=null) {
			//System.out.println("1");
			if(reg1.getPassword().equals(pass)) {
				tx.commit();
				s.close();
				return 1;
			}
			else {
				tx.commit();
				s.close();
				//System.out.println("2");
				return 0;
			}
		}
		else {
			tx.commit();
			s.close();
			//System.out.println("3");
			return 0;
		}
		
	}
	public static void main(String args[]) {
		regis r=new regis();
		System.out.print(r.log("mail12","pass"));
	}
}
