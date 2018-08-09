package br.com.megatecnologiasi.maps.entities;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="map_elements")
public class MapElement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="icon")
    private String icon;

    @Column(name="elmt_name")
    @NotBlank(message="Eh nescessario informar o nome")
    private String name;

    @Column(name="elmt_desc")
    private String desc;

    //FtechType Lazy causa problemas, usando EAGER (consome mais recursos)
    @OneToMany(mappedBy = "element", fetch = FetchType.EAGER)
    private List<Coordinate> coords;


    public MapElement() {}

    public void addCoord(Coordinate c) {
        coords.add(c);
        c.setElement(this);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public List<Coordinate> getCoords() {
        return coords;
    }

    public void setCoords(List<Coordinate> coords) {
        this.coords = coords;
    }

}

