package laptrinh.com.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import laptrinh.com.model.Users;
import laptrinh.com.util.JpaUtils;

public class UserDao {

    public List<Users> findAllUser() {
        EntityManager em = JpaUtils.getEntityManager();
        TypedQuery<Users> query = em.createQuery("SELECT u FROM Users u", Users.class);
        return query.getResultList();
    }

    public Users findByUserId(int id) {
        EntityManager em = JpaUtils.getEntityManager();
        Users user = em.find(Users.class, id);
        return user;
    }

    public boolean Login(String username, String password) {
        EntityManager em = JpaUtils.getEntityManager();
        TypedQuery<Users> query = em.createQuery("SELECT u FROM Users u Where u.username=:username "
                + "and u.password=:password", Users.class);
        query.setParameter("username", username);
        query.setParameter("password", password);
        List<Users> list = query.getResultList();
        return !list.isEmpty();
    }

    public Users findByUsername(String username) {
        EntityManager em = JpaUtils.getEntityManager();
        TypedQuery<Users> query = em.createNamedQuery("Users.findByUsername", Users.class);
        query.setParameter("username", username);
        return query.getSingleResult();
    }

    public boolean CheckLoginExist(String username) {
        EntityManager em = JpaUtils.getEntityManager();

        TypedQuery<Users> query = em.createNamedQuery("Users.findByUsername", Users.class);
        query.setParameter("username", username);
        List<Users> list = query.getResultList();
        return !list.isEmpty();
    }

    public void insert(Users user) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction tran = em.getTransaction();
        try {
            tran.begin();
            em.persist(user);
            tran.commit();
        } catch (Exception e) {
            tran.rollback();
        } finally {
            em.close();
        }
    }

    public void update(Users user) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction tran = em.getTransaction();
        try {
            tran.begin();
           em.merge(user);
            tran.commit();
        } catch (Exception e) {
            tran.rollback();
        } finally {
            em.close();
        }
    }

    public void delete(int id) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction tran = em.getTransaction();
        try {
            tran.begin();
            Users user = em.find(Users.class, id);
            if (user != null) {
                em.remove(user);
            } else {
                throw new Exception("User can not found");
            }
            tran.commit();
        } catch (Exception e) {
            tran.rollback();
        } finally {
            em.close();
        }
    }
//   public static void main(String[] args) {
//        UserDao dao = new UserDao();
//       List<Users> list=dao.findAllUser();
//       list.forEach(u -> {
//           System.out.println(u.toString());
//        });
// } 
}
