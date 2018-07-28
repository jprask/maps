package br.com.megatecnologiasi.maps.services;

import br.com.megatecnologiasi.maps.dao.CoordinateDAO;
import br.com.megatecnologiasi.maps.entities.Coordinate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CoordinateServiceImpl implements CoordinateService {


    @Autowired
    CoordinateDAO coordDao;

    public CoordinateServiceImpl() {}

    @Override
    @Transactional
    public List<Coordinate> getAll() {
        return coordDao.getAll();
    }

    @Override
    @Transactional
    public Coordinate getCoord(Integer coordId) {
        return coordDao.getCoord(coordId);
    }

    @Override
    @Transactional
    public void storeCoord(Coordinate coord) {
        coordDao.saveCoord(coord);
    }

    @Override
    @Transactional
    public void deleteCoord(Integer coordId) {
        coordDao.deleteCoord(coordId);
    }

    public CoordinateDAO getCoordDao() {
        return coordDao;
    }

    public void setCoordDao(CoordinateDAO coordDao) {
        this.coordDao = coordDao;
    }
}
