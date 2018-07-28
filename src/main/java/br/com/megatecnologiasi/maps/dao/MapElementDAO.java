package br.com.megatecnologiasi.maps.dao;

import br.com.megatecnologiasi.maps.entities.MapElement;
import java.util.List;

public interface MapElementDAO {

    List<MapElement> getAll();
    MapElement getElement(Integer id);
    void storeElement(MapElement element);
    void deleteElement(Integer id);

}
