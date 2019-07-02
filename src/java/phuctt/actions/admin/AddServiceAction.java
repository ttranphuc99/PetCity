/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import phuctt.daos.ServiceDAO;
import phuctt.dtos.ServiceDTO;
import phuctt.dtos.StaffDTO;
import phuctt.dtos.TypeDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class AddServiceAction implements ServletRequestAware {
    private String name, price, type, duration, description, mess;
    private List<Integer> staff;
    private File image;
    private String imageContentType, imageFileName;
    private HttpServletRequest request;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public AddServiceAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            TypeDTO typeDto = new TypeDTO(Integer.parseInt(type), "");
            
            ServiceDTO dto = new ServiceDTO();
            dto.setName(name);
            dto.setPrice(Float.parseFloat(price));
            dto.setDuration(Float.parseFloat(duration));
            dto.setType(typeDto);
            dto.setDescription(description);
            
            ServiceDAO dao = new ServiceDAO();
            
            List<StaffDTO> listStaff = new ArrayList<>();
            StaffDTO staffDTO = null;
            for (int staffID : staff) {
                staffDTO = new StaffDTO();
                staffDTO.setId(staffID);
                
                listStaff.add(staffDTO);
            }
            
            int id = dao.add(dto, listStaff);
            
            if (id != -1) {
                String destLocation = "D:/file/service";
                String fileExtend = imageFileName.split("\\.")[imageFileName.split("\\.").length - 1];
                
                File f = new File(destLocation, id +"."+ fileExtend);
                FileUtils.copyFile(image, f);
                
                ServletContext sc = request.getSession().getServletContext();
                String dir = sc.getRealPath("") + "img\\file\\service";
                
                f = new File(dir, id + "." + fileExtend);
                FileUtils.copyFile(image, f);
                
                dao.updateImage(id, id +"."+ fileExtend);
                
                mess = "Insert successfully";
                label = SUCCESS;
            } else {
                mess = "Insert fail";
            }
        } catch (Exception e) {
            mess = "Error";
            Logger.log("ERROR at AddServiceAction : " + e.getMessage());
        }
        return label;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
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

    public List<Integer> getStaff() {
        return staff;
    }

    public void setStaff(List<Integer> staff) {
        this.staff = staff;
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

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }
}
