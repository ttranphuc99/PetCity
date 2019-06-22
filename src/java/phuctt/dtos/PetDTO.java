/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.dtos;

import java.io.Serializable;

/**
 *
 * @author Thien Phuc
 */
public class PetDTO implements Serializable {
    private String name;
    private AccountDTO owner;
    private long id;
    private int birthYear;
    private TypeDTO type;
    private boolean gender;

    public PetDTO() {
    }

    public PetDTO(String name, AccountDTO owner, int birthYear, TypeDTO type, boolean gender) {
        this.name = name;
        this.owner = owner;
        this.birthYear = birthYear;
        this.type = type;
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public AccountDTO getOwner() {
        return owner;
    }

    public void setOwner(AccountDTO owner) {
        this.owner = owner;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public TypeDTO getType() {
        return type;
    }

    public void setType(TypeDTO type) {
        this.type = type;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    
}
