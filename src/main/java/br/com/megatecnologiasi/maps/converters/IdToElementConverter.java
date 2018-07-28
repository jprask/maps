package br.com.megatecnologiasi.maps.converters;

import br.com.megatecnologiasi.maps.entities.MapElement;
import br.com.megatecnologiasi.maps.services.MapElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class IdToElementConverter implements Converter<String, MapElement> {

    @Autowired
    MapElementService elementService;

    public IdToElementConverter() {
    }

    @Override
    public MapElement convert(String id) {
        System.out.println(id);
        return elementService.getElement(Integer.valueOf(id));
    }

    public MapElementService getElementService() {
        return elementService;
    }

    public void setElementService(MapElementService elementService) {
        this.elementService = elementService;
    }
}
