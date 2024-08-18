package laptrinh.com.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import laptrinh.com.model.Category;
import laptrinh.com.util.JpaUtils;

public class CategoryDao {
     public List<Category>findAllCategory(){
        EntityManager em=JpaUtils.getEntityManager();
        TypedQuery<Category> query=em.createNamedQuery("Category.findAll",Category.class);
        return query.getResultList();
    }
    
    public Category findByCategoryId(int cid){
        EntityManager em=JpaUtils.getEntityManager();
        TypedQuery<Category> query=em.createNamedQuery("Category.findByCategoryid",Category.class);
        query.setParameter("categoryid", cid);
        return query.getSingleResult();
    }
//    public static void main(String[] args) {
//        CategoryDao dao=new CategoryDao();
//        List<Category> list=dao.findByCategoryId(1);
//        list.forEach(c -> {
//            System.out.println(c.toString());
//         });
//    }
}
