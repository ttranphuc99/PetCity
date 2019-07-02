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
import phuctt.daos.StaffDAO;
import phuctt.dtos.StaffDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class UpdateStaffAction implements ServletRequestAware {
    private String name, gender, available, mess, imgName;
    private File image;
    private String imageContentType, imageFileName;
    private HttpServletRequest request;
    private int id;
    private StaffDTO dto;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    public UpdateStaffAction() {
    }
    
    public String execute() throws Exception {
        String label = FAIL;
        try {
            StaffDAO dao = new StaffDAO();
            dto = new StaffDTO(name, available != null, gender.equalsIgnoreCase("male"));
            dto.setId(id);
            dto.setImage(imgName);
            System.out.println(id);
            if (dao.update(dto)) {
                if (image != null) {
                    String destLocation = "D:/file/staff";
                    String fileExtend = imageFileName.split("\\.")[imageFileName.split("\\.").length - 1];

                    File f = new File(destLocation, id +"."+ fileExtend);
                    FileUtils.copyFile(image, f);

                    ServletContext sc = request.getSession().getServletContext();
                    String dir = sc.getRealPath("") + "img\\file\\staff";

                    f = new File(dir, id + "." + fileExtend);
                    FileUtils.copyFile(image, f);
                    
                    dao.updateImage(id, id +"."+ fileExtend);
                }
                label = SUCCESS;
                mess = "Update Staff ID: " +id+ " successfully";
            } else {
                mess = "Update fail";
            }
            
        } catch (Exception e) {
            Logger.log("ERROR at UpdateStaffAction : " + e.getMessage());
            mess = "error";
        }
        return label;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
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

    public StaffDTO getDto() {
        return dto;
    }

    public void setDto(StaffDTO dto) {
        this.dto = dto;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }
    
}
