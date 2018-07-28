package br.com.megatecnologiasi.maps.dao;

import br.com.megatecnologiasi.maps.entities.Coordinate;

import java.util.List;

public interface CoordinateDAO {

    Coordinate getCoord(Integer coordId);
    List<Coordinate> getAll();
    void saveCoord(Coordinate coord);
    void deleteCoord(Integer coordId);

}
