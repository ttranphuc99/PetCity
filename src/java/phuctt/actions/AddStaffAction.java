/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import java.io.File;
import org.apache.commons.io.FileUtils;
import phuctt.daos.StaffDAO;
import phuctt.dtos.StaffDTO;

/**
 *
 * @author Thien Phuc
 */
public class AddStaffAction {
    private String name, gender, available, mess;
    private File image;
    private String imageContentType, imageFileName;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    public AddStaffAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            StaffDAO dao = new StaffDAO();
            
            StaffDTO dto = new StaffDTO(name, available != null, gender.equalsIgnoreCase("male"));
            int id = dao.add(dto);
            
            if (id != -1) {
                String destLocation = "D:/file/staff";
                String fileExtend = imageFileName.split("\\.")[imageFileName.split("\\.").length - 1];
                System.out.println("extend: " + fileExtend);
                
                File f = new File(destLocation, id +"."+ fileExtend);
                FileUtils.copyFile(image, f);
                
                dao.updateImage(id, id +"."+ fileExtend);
                
                mess = "Insert successfully";
                label = SUCCESS;
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
    
}
