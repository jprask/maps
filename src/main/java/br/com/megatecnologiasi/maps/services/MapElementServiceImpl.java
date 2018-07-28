package br.com.megatecnologiasi.maps.services;

import br.com.megatecnologiasi.maps.dao.MapElementDAO;
import br.com.megatecnologiasi.maps.entities.Coordinate;
import br.com.megatecnologiasi.maps.entities.MapElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MapElementServiceImpl implements MapElementService {

    @Autowired
    MapElementDAO elementDAO;

    public MapElementServiceImpl() {}

    @Override
    @Transactional
    public List<MapElement> getAll() {
        return elementDAO.getAll();
    }

    @Override
    @Transactional
    public MapElement getElement(Integer id) {
        return elementDAO.getElement(id);
    }

    @Override
    @Transactional
    public void storeElement(MapElement element) {
        elementDAO.storeElement(element);
    }

    @Override
    @Transactional
    public void deleteElement(Integer id) {
        elementDAO.deleteElement(id);
    }

    @Override
    @Transactional
    public void addCoord(MapElement element, Coordinate coord) {
        element.addCoord(coord);
        elementDAO.storeElement(element);
    }

    public MapElementDAO getElementDAO() {
        return elementDAO;
    }

    public void setElementDAO(MapElementDAO elementDAO) {
        this.elementDAO = elementDAO;
    }
}
