package com.andersenlab.oauth2authenticationserver.domain;

import javax.persistence.*;

@Entity
@Table(name = "permission")
public class Permission {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "name")
    private String name;

    public Permission() {
            }

    public Permission(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Permission(Permission prototype) {
        this.id = prototype.getId();
        this.name = prototype.getName();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
