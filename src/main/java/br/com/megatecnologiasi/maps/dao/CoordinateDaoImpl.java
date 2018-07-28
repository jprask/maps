package br.com.megatecnologiasi.maps.dao;

import br.com.megatecnologiasi.maps.entities.Coordinate;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CoordinateDaoImpl implements CoordinateDAO {

    @Autowired
    SessionFactory factory;

    public CoordinateDaoImpl() {}

    @Override
    public Coordinate getCoord(Integer coordId) {
        Session session = factory.getCurrentSession();

        return session.get(Coordinate.class, coordId);
    }

    @Override
    public List<Coordinate> getAll() {
        Session session = factory.getCurrentSession();

        Query q = session.createQuery("from Coordinate");

        return q.list();
    }

    @Override
    public void saveCoord(Coordinate coord) {
        Session session = factory.getCurrentSession();

        session.saveOrUpdate(coord);
    }

    @Override
    public void deleteCoord(Integer coordId) {
        Session session = factory.getCurrentSession();

        Query q = session.createQuery("delete from Coordinate where id=:Id");
        q.setParameter("Id", coordId);

        q.executeUpdate();
    }

    public SessionFactory getFactory() {
        return factory;
    }

    public void setFactory(SessionFactory factory) {
        this.factory = factory;
    }
}