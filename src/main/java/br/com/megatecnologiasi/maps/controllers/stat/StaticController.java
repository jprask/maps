package br.com.megatecnologiasi.maps.controllers.stat;

import br.com.megatecnologiasi.maps.entities.Coordinate;
import br.com.megatecnologiasi.maps.entities.MapElement;
import br.com.megatecnologiasi.maps.services.CoordinateService;
import br.com.megatecnologiasi.maps.services.MapElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller("staticController")
@RequestMapping("/maps")
public class StaticController {

    @Autowired
    MapElementService elementService;
    @Autowired
    CoordinateService coordinateService;

    public StaticController() {}

    //Listar todos os elementos e suas respectivas coordenadas
    @GetMapping("/list")
    public String listElements(Model model) {
        model.addAttribute("elements", elementService.getAll());

        return "/static/list";
    }

    //Mostrar um elemento em um form, pode ser editado e salvo
    @GetMapping("/viewElement")
    public String viewElement(@RequestParam("id") Integer id, Model model) {
        model.addAttribute("element", elementService.getElement(id));

        return "/static/element";
    }

    //Criar um novo elemento e mostrar no form
    @GetMapping("/newElement")
    public String newElement(Model model) {
        model.addAttribute("element", new MapElement());

        return "/static/element";
    }

    //Salvar elemento e mostrar a lista de elementos
    @PostMapping("/saveElement")
    public String saveElement(@ModelAttribute MapElement element, Model model) {
        elementService.storeElement(element);

        return "redirect:/maps/list";
    }

    //Deletar elemento e mostrar lista de elementos
    @GetMapping("/deleteElement")
    public String deleteElement(@RequestParam("elementId") Integer id, Model model) {
        elementService.deleteElement(id);

        return "redirect:/maps/list";
    }

    //Mostrar Coordenada em um form
    @GetMapping("/viewCoordinate")
    public String viewCoordinate(@RequestParam("id") Integer id, Model model) {
        Coordinate coordinate = coordinateService.getCoord(id);
        model.addAttribute("elements", elementService.getAll());
        model.addAttribute("coordinate", coordinate);
        model.addAttribute("parentId", coordinate.getElement().getId());

        return "static/coordinate";
    }

    //Criar nova coordenada e mostrar no form, elemento pai pre-selecionado
    @GetMapping("/newCoordinate")
    public String newCoordinate(@RequestParam("parentId") Integer parentId, Model model) {
        model.addAttribute("elements", elementService.getAll());
        model.addAttribute("coordinate", new Coordinate());
        model.addAttribute("parentId", parentId);

        return "static/coordinate";
    }

    //Salvar coordenada e mostrar lista de elementos
    @PostMapping("/saveCoordinate")
    public String saveCoordinate(@ModelAttribute Coordinate coordinate, Model model) {
        coordinateService.storeCoord(coordinate);

        return "redirect:/maps/list";
    }

    //Deletar coordenada e mostrar lista de elementos
    @GetMapping("/deleteCoordinate")
    public String deleteCoordinate(@RequestParam("id") Integer id, Model model) {
        coordinateService.deleteCoord(id);

        return "redirect:/maps/list";
    }

    //enviar todos os elementos para exibiçao no mapa
    @GetMapping("/map")
    public String showMap(Model model) {
        model.addAttribute("elements", elementService.getAll());

        return "static/map";
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
