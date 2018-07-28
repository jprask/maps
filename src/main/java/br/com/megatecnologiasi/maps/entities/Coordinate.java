package br.com.megatecnologiasi.maps.entities;

import javax.persistence.*;

@Entity
@Table(name="coords")
public class Coordinate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;
    @ManyToOne(cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
    @JoinColumn(name="element_id")
    private MapElement element;
    @Column(name="lat")
    private Double lat;
    @Column(name="lng")
    private Double lng;
    @Column(name="marker")
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
