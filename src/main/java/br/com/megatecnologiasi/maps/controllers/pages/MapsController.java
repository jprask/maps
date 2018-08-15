package br.com.megatecnologiasi.maps.controllers.pages;

import br.com.megatecnologiasi.maps.entities.Coordinate;
import br.com.megatecnologiasi.maps.entities.MapElement;
import br.com.megatecnologiasi.maps.services.CoordinateService;
import br.com.megatecnologiasi.maps.services.MapElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * Controller para servir as paginas da aplicaçao
 * */
@Controller("pagesController")
@RequestMapping("/maps")
public class MapsController {

    @Autowired
    MapElementService elementService;
    @Autowired
    CoordinateService coordinateService;

    public MapsController() {}

    //Listar todos os elementos e suas respectivas coordenadas
    @GetMapping("/list")
    public String listElements(Model model) {
        model.addAttribute("elements", elementService.getAll());

        return "/pages/list";
    }

    //Mostrar um elemento em um form, pode ser editado e salvo
    @GetMapping("/viewElement")
    public String viewElement(@RequestParam("id") Integer id, Model model) {
        model.addAttribute("element", elementService.getElement(id));

        return "/pages/element";
    }

    //Criar um novo elemento e mostrar no form
    @GetMapping("/newElement")
    public String newElement(Model model) {
        model.addAttribute("element", new MapElement());

        return "/pages/element";
    }

    //Salvar elemento e mostrar a lista de elementos
    @PostMapping("/saveElement")
    public String saveElement(@Valid @ModelAttribute("element") MapElement element, BindingResult result, Model model) {
        //caso algum campo nao for preenchido transformar string vazia em null
        if(element.getIcon().equals("")) element.setIcon(null);
        if(element.getDesc().equals("")) element.setDesc(null);
        if(element.getName().equals("")) element.setName(null);
        //Caso falhar a validacao, exibir o form novamente
        if(result.hasErrors()) return "/pages/element";
        elementService.storeElement(element);

        return "redirect:/maps/list";
    }

    //Deletar elemento e mostrar lista de elementos
    @GetMapping("/deleteElement")
    public String deleteElement(@RequestParam("id") Integer id, Model model) {
        elementService.deleteElement(id);

        return "redirect:/maps/list";
    }

    //Mostrar Coordenada em um form
    @GetMapping("/viewCoordinate")
    public String viewCoordinate(@RequestParam("id") Integer id, Model model) {
        Coordinate coordinate = coordinateService.getCoord(id);
        //Os elementos serao mostrados em uma combobox para associar ao ponto
        model.addAttribute("elements", elementService.getAll());
        model.addAttribute("coordinate", coordinate);
        //A id do elemento associado ao ponto eh usada para preencher a combobox
        model.addAttribute("parentId", coordinate.getElement().getId());

        return "/pages/coordinate";
    }

    //Criar nova coordenada e mostrar no form, elemento pai pre-selecionado
    @GetMapping("/newCoordinate")
    public String newCoordinate(@RequestParam("parentId") Integer parentId, Model model) {
        model.addAttribute("elements", elementService.getAll());
        model.addAttribute("coordinate", new Coordinate());
        model.addAttribute("parentId", parentId);

        return "/pages/coordinate";
    }

    //Salvar coordenada e mostrar lista de elementos
    @PostMapping("/saveCoordinate")
    public String saveCoordinate(@Valid @ModelAttribute("coordinate") Coordinate coordinate, BindingResult result, Model model) {
        if(result.hasErrors()) {
            //Preencher o form novamente
            model.addAttribute("elements", elementService.getAll());
            //ID pode ser nula
            if(coordinate.getElement() == null) {
                model.addAttribute("parentId", 0);
            } else {
                model.addAttribute("parentId", coordinate.getElement().getId());
            }
            return "/pages/coordinate";
        }
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

        return "pages/map";
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
