package br.com.megatecnologiasi.maps.controllers.api;

import br.com.megatecnologiasi.maps.entities.MapElement;
import br.com.megatecnologiasi.maps.services.CoordinateService;
import br.com.megatecnologiasi.maps.services.MapElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController("apiController")
@RequestMapping("/api")
public class EntitiesRestController {

    @Autowired
    private MapElementService elementService;
    @Autowired
    private CoordinateService coordinateService;

    public EntitiesRestController() {}

    @GetMapping
    public List<MapElement> listAll() {
        return elementService.getAll();
    }


    public MapElementService getElementService() {
        return elementService;
    }

    public void setElementService(MapElementService elementService) {
        this.elementService = elementService;
    }

    public CoordinateService getCoordinateService() {
        return coordinateService;
    }

    public void setCoordinateService(CoordinateService coordinateService) {
        this.coordinateService = coordinateService;
    }
}
