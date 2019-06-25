/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import java.util.List;
import phuctt.daos.ServiceDAO;
import phuctt.dtos.ServiceDTO;

/**
 *
 * @author Thien Phuc
 */
public class LoadListServiceAction {
    private int numOfPageDog;
    private int numOfPageCat;
    private int numOfPageHamster;
    private List<ServiceDTO> listDog, listCat, listHamster;
    
    private String mess;
    
    public LoadListServiceAction() {
    }
    
    public String execute() {
        try {
            ServiceDAO dao = new ServiceDAO();
            int recordCount = dao.loadServiceToPage(1);
            numOfPageDog = (int) Math.ceil(recordCount*1.0 / 5);
            listDog = dao.loadServiceToPage(1, 1);
            
            recordCount = dao.loadServiceToPage(2);
            numOfPageCat = (int) Math.ceil(recordCount*1.0 / 5);
            listCat = dao.loadServiceToPage(2, 1);
            
            recordCount = dao.loadServiceToPage(3);
            numOfPageHamster = (int) Math.ceil(recordCount*1.0 / 5);
            listHamster = dao.loadServiceToPage(3, 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    public int getNumOfPageDog() {
        return numOfPageDog;
    }

    public void setNumOfPageDog(int numOfPageDog) {
        this.numOfPageDog = numOfPageDog;
    }

    public int getNumOfPageCat() {
        return numOfPageCat;
    }

    public void setNumOfPageCat(int numOfPageCat) {
        this.numOfPageCat = numOfPageCat;
    }

    public int getNumOfPageHamster() {
        return numOfPageHamster;
    }

    public void setNumOfPageHamster(int numOfPageHamster) {
        this.numOfPageHamster = numOfPageHamster;
    }

    public List<ServiceDTO> getListDog() {
        return listDog;
    }

    public void setListDog(List<ServiceDTO> listDog) {
        this.listDog = listDog;
    }

    public List<ServiceDTO> getListCat() {
        return listCat;
    }

    public void setListCat(List<ServiceDTO> listCat) {
        this.listCat = listCat;
    }

    public List<ServiceDTO> getListHamster() {
        return listHamster;
    }

    public void setListHamster(List<ServiceDTO> listHamster) {
        this.listHamster = listHamster;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
    
}
