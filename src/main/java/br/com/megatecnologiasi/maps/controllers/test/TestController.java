package br.com.megatecnologiasi.maps.controllers.test;

import br.com.megatecnologiasi.maps.entities.Coordinate;
import br.com.megatecnologiasi.maps.entities.MapElement;
import br.com.megatecnologiasi.maps.services.CoordinateService;
import br.com.megatecnologiasi.maps.services.MapElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller("testCtrl")
@RequestMapping("/test")
public class TestController {

    @Autowired
    MapElementService elementService;
    @Autowired
    CoordinateService coordService;

    public TestController() {}

    @GetMapping("/list")
    public String listElements(Model m) {
        List<MapElement> elements = elementService.getAll();

        m.addAttribute("elements", elements);

        return "test/list";
    }

    @GetMapping("viewElmt")
    public String viewElement(@RequestParam(value = "elmtId") int elmtId, Model model) {
        MapElement e = elementService.getElement(elmtId);
        model.addAttribute("element", e);

        return "test/form-elmt";
    }

    @GetMapping("/addElmt")
    public String addElement(Model m) {
        m.addAttribute("element", new MapElement());

        return "test/form-elmt";
    }

    @PostMapping("/saveElmt")
    public String saveElement(@ModelAttribute("element") MapElement element) {
        elementService.storeElement(element);

        return "redirect:/test/list";
    }

    @GetMapping("deleteElmt")
    public String deleteElement(@RequestParam("elmtId") int elmtId, Model model) {
        elementService.deleteElement(elmtId);
        return "redirect:/test/list";
    }

    @GetMapping("viewCoord")
    public String viewCoord(@RequestParam("coordId") int coordId, Model model) {
        Coordinate c = coordService.getCoord(coordId);
        model.addAttribute("coord", c);
        List<MapElement> elements = elementService.getAll();
        model.addAttribute("elements", elements);

        return "test/form-coord";
    }

    @GetMapping("/addCoord")
    public String addCoord(Model m) {
        m.addAttribute("coord", new Coordinate());

        List<MapElement> elements = elementService.getAll();
        m.addAttribute("elements", elements);

        return "test/form-coord";
    }

    @PostMapping("/saveCoord")
    public String saveCoord(@ModelAttribute("coord") Coordinate coord) {
        //for test
        coord.setMarker(false);
        coordService.storeCoord(coord);

        return "redirect:/test/list";
    }

    @GetMapping("deleteCoord")
    public String deleteCoord(@RequestParam("coordId") int coordId, Model model) {
        coordService.deleteCoord(coordId);
        return "redirect:/test/list";
    }

    public MapElementService getElementService() {
        return elementService;
    }

    public void setElementService(MapElementService elementService) {
        this.elementService = elementService;
    }

}