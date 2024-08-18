package laptrinh.com.dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import laptrinh.com.model.Cartitem;
import laptrinh.com.util.JpaUtils;

public class CartItemDao {

    private long total;

    public long getTotal(List<Cartitem> list) {
        list.forEach(c -> {
            total = total + c.getQuantity() * c.getProductid().getPrice();
        });
        return total;
    }

    public long getVat(long total) {
        return (long) (total * 0.1);
    }

    public long getSum(long total) {
        return (long) (total * 1.1);
    }

    public List<Cartitem> findAllCartItem() {
        EntityManager em = JpaUtils.getEntityManager();
        TypedQuery<Cartitem> query = em.createQuery("SELECT c FROM Cartitem c", Cartitem.class);
        return query.getResultList();
    }

    public void insert(Cartitem item) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction tran = em.getTransaction();
        try {
            tran.begin();
            em.persist(item);
            tran.commit();
        } catch (Exception e) {
            tran.rollback();
        } finally {
            em.close();
        }
    }

    public void update(Cartitem item) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction tran = em.getTransaction();
        try {
            tran.begin();
            em.merge(item);
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
            Cartitem item = em.find(Cartitem.class, id);
            if (item != null) {
                em.remove(item);
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
    public String InvoiceInfo(List<Cartitem> list){
        String info="";
        info = list.stream().map(c -> c.toString()+"\n").reduce(info, String::concat);
        return info;
    }
    
     public List<Cartitem> findStatus(int status){
        EntityManager em=JpaUtils.getEntityManager();
        
        TypedQuery<Cartitem> query = em.createQuery("SELECT c FROM Cartitem c where c.cartid.status=:status", Cartitem.class);
        query.setParameter("status", status);
        return query.getResultList();
    }
//        public static void main(String[] args) {
//        CartItemDao itemdao=new CartItemDao();
//        List<Cartitem> list=itemdao.findAllCartItem();
//        System.out.println(itemdao.InvoiceInfo(list));
//        
//   }
}
