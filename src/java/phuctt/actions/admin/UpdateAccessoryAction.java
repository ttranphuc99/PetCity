/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;
import phuctt.dtos.CategoryDTO;
import phuctt.dtos.TypeDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class UpdateAccessoryAction implements ServletRequestAware {

    private HttpServletRequest request;
    private long id;
    private int category, type;
    private String name, brand, price, quantity, description, mess, imgName;
    private File image;
    private String imageContentType, imageFileName;
    private AccessoryDTO dto;

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    public UpdateAccessoryAction() {
    }

    public String execute() throws Exception {
        String label = FAIL;
        try {
            AccessoryDAO dao = new AccessoryDAO();
            CategoryDTO categoryDto = new CategoryDTO(category, "");
            TypeDTO typeDto = new TypeDTO(type, "");
            dto = new AccessoryDTO(name, brand, description, "sample", Float.parseFloat(price), categoryDto, Integer.parseInt(quantity), typeDto);
            dto.setId(id);
            dto.setImage(imgName);

            if (dao.update(dto)) {
                if (image != null) {
                    String destLocation = "D:/file/accessory";
                    String fileExtend = imageFileName.split("\\.")[imageFileName.split("\\.").length - 1];

                    ServletContext sc = request.getSession().getServletContext();
                    String dir = sc.getRealPath("") + "img\\file\\accessory";
                    File f = new File(destLocation, id + "." + fileExtend);
                    FileUtils.copyFile(image, f);

                    f = new File(dir, id + "." + fileExtend);
                    FileUtils.copyFile(image, f);
                    
                    dao.updateImage(id, id + "." + fileExtend);
                }
                mess = "Update successfully";
                label = SUCCESS;
            } else {
                mess = "Update fail";
            }
        } catch (Exception e) {
            mess = "Error";
            Logger.log("ERROR at UpdateAccessoryAction : " + e.getMessage());
        }
        return label;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
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

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
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

    public AccessoryDTO getDto() {
        return dto;
    }

    public void setDto(AccessoryDTO dto) {
        this.dto = dto;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

}
