package br.com.megatecnologiasi.maps.services;

import br.com.megatecnologiasi.maps.entities.Coordinate;
import br.com.megatecnologiasi.maps.entities.MapElement;

import java.util.List;

public interface MapElementService {

    List<MapElement> getAll();
    MapElement getElement(Integer id);
    void storeElement(MapElement element);
    void deleteElement(Integer id);
    void addCoord(MapElement element, Coordinate coord);

}
