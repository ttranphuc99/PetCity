/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;

/**
 *
 * @author Thien Phuc
 */
public class LoadAccessoryDetailAction {
    private long id;
    private String name, brand, category, type, description, image;
    private float price;
    
    public LoadAccessoryDetailAction() {
    }
    
    public String execute() {
        try {
            AccessoryDAO dao = new AccessoryDAO();
            AccessoryDTO dto = dao.findById(id);
            
            name = dto.getName();
            brand = dto.getBrand();
            description = dto.getDescription();
            image = dto.getImage();
            price = dto.getPrice();
            
            category = dto.getCategory().getName();
            type = dto.getType().getName();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
