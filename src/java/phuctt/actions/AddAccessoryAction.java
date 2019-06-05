/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import java.io.File;
import org.apache.commons.io.FileUtils;
import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;
import phuctt.dtos.CategoryDTO;
import phuctt.dtos.TypeDTO;

/**
 *
 * @author Thien Phuc
 */
public class AddAccessoryAction {

    private String name, brand, price, quantity, category, type, description, mess;
    private File image;
    private String imageContentType, imageFileName;

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    public AddAccessoryAction() {
    }

    public String execute() {
        String label = FAIL;
        try {
            AccessoryDAO dao = new AccessoryDAO();

            CategoryDTO categoryDto = new CategoryDTO(Integer.parseInt(category), "");
            TypeDTO typeDto = new TypeDTO(Integer.parseInt(type), "");
            AccessoryDTO dto = new AccessoryDTO(name, brand, description, "sample", Float.parseFloat(price), categoryDto, Integer.parseInt(quantity), typeDto);

            long id = dao.add(dto);
            if (id != -1) {
                String destLocation = "D:/file";
                String fileExtend = imageFileName.split("\\.")[imageFileName.split("\\.").length - 1];
                System.out.println("extend: " + fileExtend);
                
                File f = new File(destLocation, id +"."+ fileExtend);
                FileUtils.copyFile(image, f);
                
                dao.updateImage(id, id +"."+ fileExtend);
                
                mess = "Insert successfully";
                label = SUCCESS;
            } else {
                mess = "Insert fail";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return label;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
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

    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }

    public String getImageContentType() {
        return imageContentType;
    }

    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

}
