package maven.FinanceTracker;

import java.time.LocalDate;
import java.util.*;

import javax.persistence.Entity;
import javax.persistence.criteria.Selection;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class hist {
	  
	public void add(String amt,String fin,String type,String dates,String mail) {
		SessionFactory sf=(SessionFactory) hibernateutil.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		history h=new history();
		//h.setId(333);
		
		String hql = "FROM history"; 
		
		Query<history> query = s.createQuery(hql, history.class);
		List<history> results = query.list();
		int n=results.size();
		System.out.print(n);
		h.setId(n+1);
		h.setMail(mail);
		h.setAmount(amt);
		h.setPay(type);
		h.setDate(dates);
		h.setFin(fin);
		s.persist(h);
		tx.commit();
		s.close();	
	}
	public void savings(String amt,String fin,String dates,String mail) {
		SessionFactory sf1=(SessionFactory) hibernateutil.getSessionFactory();
		Session s1=sf1.openSession();
		Transaction tx1=s1.beginTransaction();
		history h1=new history();
		//h.setId(333);
		
		String hql1 = "FROM history"; 
		
		Query<history> query1 = s1.createQuery(hql1, history.class);
		List<history> results1 = query1.list();
		int n1=results1.size();
		System.out.print(n1);
		h1.setId(n1+1);
		h1.setMail(mail);
		h1.setAmount(amt);
		h1.setDate(dates);
		h1.setFin(fin);
		s1.persist(h1);
		tx1.commit();
		s1.close();	
	}
	public void expenses(String amt,String purpose,String ment,String fin,String dates,String mail) {
		SessionFactory sf=(SessionFactory) hibernateutil.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		history h=new history();
		//h.setId(333);
		
		String hql = "FROM history"; 
		
		Query<history> query = s.createQuery(hql, history.class);
		List<history> results = query.list();
		int n=results.size();
		System.out.print(n+1);
		h.setId(n+1);
		h.setMail(mail);
		h.setAmount(amt);
		h.setDate(dates);
		h.setFin(fin);
		h.setPurpose(purpose);
		h.setOther(ment);
		s.persist(h);
		tx.commit();
		s.close();	
	}
	public void goals(String amt,String purpose,String fin,String dates,String mail) {
		SessionFactory sf=(SessionFactory) hibernateutil.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		history h=new history();
		//h.setId(333);
		
		String hql = "FROM history"; 
		
		Query<history> query = s.createQuery(hql, history.class);
		List<history> results = query.list();
		int n=results.size();
		System.out.print(n+1);
		h.setId(n+1);
		h.setMail(mail);
		h.setAmount(amt);
		h.setDate(dates);
		h.setFin(fin);
		h.setPurpose(purpose);
		s.persist(h);
		tx.commit();
		s.close();	
	}
	public int sumAll(String mail) {
		SessionFactory sf=(SessionFactory) hibernateutil.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		String hql1 = "FROM history s WHERE s.fin = :g AND s.mail = :m";
		Query query1 = s.createQuery(hql1);
		query1.setParameter("g", "Credited");
		query1.setParameter("m", mail);// Assuming you want male students
		List<history> hist1 = query1.list();
		int i=0,tsum=0;
		for(i=0;i<hist1.size();i++) {
			int val=Integer.parseInt(hist1.get(i).getAmount());
			tsum+=val;
		}
		
		String hql2 = "FROM history s WHERE s.fin = :g AND s.mail = :m";
		Query query2 = s.createQuery(hql2);
		query2.setParameter("g", "Savings"); // Assuming you want male students
		query2.setParameter("m", mail);
		List<history> hist2 = query2.list();
		for(i=0;i<hist2.size();i++) {
			int val1=Integer.parseInt(hist2.get(i).getAmount());
			tsum-=val1;
		}
		
		String hql3 = "FROM history s WHERE s.fin = :g AND s.mail = :m";
		Query query3 = s.createQuery(hql3);
		query3.setParameter("g", "Expenses"); // Assuming you want male students
		query3.setParameter("m", mail);
		List<history> hist3 = query3.list();
		for(i=0;i<hist3.size();i++) {
			int val2=Integer.parseInt(hist3.get(i).getAmount());
			tsum-=val2;
		}
		//System.out.println(tsum);
		tx.commit();
		s.close();	
		return tsum;
	}
	
	public List<history> details(String mail) {
		SessionFactory sf=(SessionFactory) hibernateutil.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		String hql1 = "FROM history s WHERE s.mail = :m";
		Query query1 = s.createQuery(hql1);
		query1.setParameter("m", mail);// Assuming you want male students
		List<history> hist1 = query1.list();
		tx.commit();
		s.close();	
		return hist1;
	}
	public List<history> month1(String mail,String cat) {
		SessionFactory sf=(SessionFactory) hibernateutil.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		
		
		String hql1 = "FROM history s WHERE s.mail = :m AND s.fin = :g";
		Query query1 = s.createQuery(hql1);
		query1.setParameter("m", mail);// Assuming you want male students
		query1.setParameter("g", cat);
		List<history> hist1 = query1.list();
		tx.commit();
		s.close();	
		return hist1;
	}
	public List<history> month2(String mail,String cat,String month) {
		SessionFactory sf=(SessionFactory) hibernateutil.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		
		
		String months=month.substring(0,3);
		String st="";
		if(cat!="Goals")
		st="%"+months+"%";
		else {
			if(months=="Jan")
				st="01";
			else if(months=="Feb")
				st="02";
		}
		String hql1 = "FROM history s WHERE s.mail = :m AND s.fin = :g AND s.date LIKE :name";
		Query query1 = s.createQuery(hql1);
		query1.setParameter("m", mail);// Assuming you want male students
		query1.setParameter("g", cat);
		query1.setParameter("name", st);
		List<history> hist1 = query1.list();
		tx.commit();
		s.close();	
		return hist1;
	}
	public List<history> rem(String mail) {
		SessionFactory sf=(SessionFactory) hibernateutil.getSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		LocalDate myObj = LocalDate.now();
		String dateToString= myObj.toString();
		String str1= dateToString.substring(8,10);
		String str= dateToString.substring(5,7);
		String text="";
		System.out.println(str);
		if(str.equals("01"))
            text+="Jan";
        else if(str.equals("02"))
            text+="Feb";
        else if(str.equals("03"))
            text+="Mar";
        else if(str.equals("04"))
            text+="Apr";
        else if(str.equals("05"))
            text+="May";
        else if(str.equals("06"))
            text+="Jun";
        else if(str.equals("07"))
            text+="Jul";
        else if(str.equals("08"))
            text+="Aug";
        else if(str.equals("09"))
            text+="Sep";
        else if(str.equals("10"))
            text+="Oct";
        else if(str.equals("11"))
            text+="Nov";
        else if(str.equals("12"))
            text+="Dec";
		text+=str1;
		String st="%"+text+"%";
		System.out.println(text);
		String hql1 = "FROM history s WHERE s.mail = :m  AND s.date LIKE :name";
		Query query1 = s.createQuery(hql1);
		query1.setParameter("m", mail);// Assuming you want male students
		query1.setParameter("name", st);
		List<history> hist1 = query1.list();
		tx.commit();
		s.close();	
		return hist1;
	}
	
     public static void main(String args[]) {
    	 hist hi=new hist();
    	 List<history> hlist = new ArrayList<>();
    	/*  hlist=hi.rem("s@gmail.com");
    	 System.out.println(hlist.size());*/
    	 hi.expenses("445","rent","null","Savings","2024-11-15","shiva@gmail.com");
    	
    	 
     }
}
