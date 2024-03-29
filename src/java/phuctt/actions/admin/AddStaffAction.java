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
public class AddStaffAction implements ServletRequestAware {
    private String name, gender, available, mess;
    private File image;
    private String imageContentType, imageFileName;
    private HttpServletRequest request;
    
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
                
                File f = new File(destLocation, id +"."+ fileExtend);
                FileUtils.copyFile(image, f);
                
                ServletContext sc = request.getSession().getServletContext();
                String dir = sc.getRealPath("") + "img\\file\\staff";
                
                f = new File(dir, id + "." + fileExtend);
                FileUtils.copyFile(image, f);
                
                dao.updateImage(id, id +"."+ fileExtend);
                
                mess = "Insert successfully";
                label = SUCCESS;
            }
        } catch (Exception e) {
            Logger.log("ERROR at AddStaffAction : " + e.getMessage());
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

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }
    
}
