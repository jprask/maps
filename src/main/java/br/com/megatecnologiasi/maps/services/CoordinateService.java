package br.com.megatecnologiasi.maps.services;


import br.com.megatecnologiasi.maps.entities.Coordinate;

import java.util.List;

public interface CoordinateService {
    List<Coordinate> getAll();
    Coordinate getCoord(Integer coordId);
    void storeCoord(Coordinate coord);
    void deleteCoord(Integer coordId);
}