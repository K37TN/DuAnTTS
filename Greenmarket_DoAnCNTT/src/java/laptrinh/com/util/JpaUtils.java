
package laptrinh.com.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class JpaUtils {
    public static EntityManager getEntityManager(){
        EntityManagerFactory factory= Persistence.createEntityManagerFactory("FinalWebProjectPU");
        return factory.createEntityManager();
    }
}
