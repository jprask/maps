package br.com.megatecnologiasi.maps.dao;

import br.com.megatecnologiasi.maps.entities.MapElement;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MapElementDaoImpl implements MapElementDAO {

    @Autowired
    private SessionFactory factory;

    public MapElementDaoImpl() {}

    @Override
    public List<MapElement> getAll() {
        Session session = factory.getCurrentSession();;

        Query q = session.createQuery("from MapElement");
        return q.list();
    }

    @Override
    public MapElement getElement(Integer id) {
        Session session = factory.getCurrentSession();
        return session.get(MapElement.class, id);
    }

    @Override
    public void storeElement(MapElement element) {
        Session session = factory.getCurrentSession();
        session.saveOrUpdate(element);
    }

    @Override
    public void deleteElement(Integer id) {
        Session session = factory.getCurrentSession();

        Query q = session.createQuery("delete from MapElement where id=:Id");
        q.setParameter("Id", id);
        q.executeUpdate();
    }

    public SessionFactory getFactory() {
        return factory;
    }

    public void setFactory(SessionFactory factory) {
        this.factory = factory;
    }

}
