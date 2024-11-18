package maven.FinanceTracker;



import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;
public class hibernate {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
         if (sessionFactory == null) {
            try {
                 Configuration configuration = new Configuration();

                 // Hibernate settings equivalent to hibernate.cfg.xml's properties
                 Properties settings = new Properties();
                 settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
                 settings.put(Environment.URL, "jdbc:mysql://localhost:3306/tracker");
                 settings.put(Environment.USER, "root");
                 settings.put(Environment.PASS, "Johny#k52");
                 settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQLDialect");

                 settings.put(Environment.SHOW_SQL, "true");
                 settings.put(Environment.FORMAT_SQL, "true");

                // settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

                 settings.put(Environment.HBM2DDL_AUTO, "update");

                 configuration.setProperties(settings);
                 configuration.addAnnotatedClass(reg.class);

                 ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                 .applySettings(configuration.getProperties()).build();
                 System.out.println("Hibernate Java Config serviceRegistry created");
                 sessionFactory = configuration.buildSessionFactory(serviceRegistry);
                 return sessionFactory;

              } catch (Exception e) {
                 e.printStackTrace();
              }
          }
        return sessionFactory;
    }
}