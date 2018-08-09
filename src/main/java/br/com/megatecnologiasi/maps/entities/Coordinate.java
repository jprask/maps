package br.com.megatecnologiasi.maps.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="coords")
public class Coordinate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    //FtechType Lazy causa problemas, usando EAGER (consome mais recursos)
    @ManyToOne(cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
    @JoinColumn(name="element_id")
    @NotNull(message="Eh preciso escolher um elemento!!")
    //Ignorando na conversao para JSON, evita recursao infinita
    @JsonIgnore
    private MapElement element;

    @Column(name="lat")
    @NotNull(message="Eh preciso informar a latitude!")
    private Double lat;

    @Column(name="lng")
    @NotNull(message="Eh preciso informar a longitude!")
    private Double lng;

    @Column(name="marker")
    @NotNull
    private Boolean marker;


    public Coordinate() {}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public MapElement getElement() {
        return element;
    }

    public void setElement(MapElement element) {
        this.element = element;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Boolean getMarker() {
        return marker;
    }

    public void setMarker(Boolean marker) {
        this.marker = marker;
    }

}
