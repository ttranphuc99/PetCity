/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import java.util.List;
import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;

/**
 *
 * @author Thien Phuc
 */
public class WelcomeAction {

    private String mess;
    private List<AccessoryDTO> listDogFood, listDogClothes, listDogToys, listDogComestic, 
            listCatFood, listCatClothes, listCatToys, listCatComestic,
            listHamsterFood, listHamsterClothes, listHamsterToys, listHamsterComestic;

    public WelcomeAction() {
    }

    public String execute() {
        try {
            AccessoryDAO dao = new AccessoryDAO();
            
            listDogFood = dao.loadTopMostBuy(5, 1, 1);
            listDogClothes = dao.loadTopMostBuy(5, 1, 2);
            listDogToys = dao.loadTopMostBuy(5, 1, 3);
            listDogComestic = dao.loadTopMostBuy(5, 1, 4);
            
            listCatFood = dao.loadTopMostBuy(5, 2, 1);
            listCatClothes = dao.loadTopMostBuy(5, 2, 2);
            listCatToys = dao.loadTopMostBuy(5, 2, 3);
            listCatComestic = dao.loadTopMostBuy(5, 2, 4);
            
            listHamsterFood = dao.loadTopMostBuy(5, 3, 1);
            listHamsterClothes = dao.loadTopMostBuy(5, 3, 2);
            listHamsterToys = dao.loadTopMostBuy(5, 3, 3);
            listHamsterComestic = dao.loadTopMostBuy(5, 3, 4);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
    
    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public List<AccessoryDTO> getListDogFood() {
        return listDogFood;
    }

    public void setListDogFood(List<AccessoryDTO> listDogFood) {
        this.listDogFood = listDogFood;
    }

    public List<AccessoryDTO> getListDogClothes() {
        return listDogClothes;
    }

    public void setListDogClothes(List<AccessoryDTO> listDogClothes) {
        this.listDogClothes = listDogClothes;
    }

    public List<AccessoryDTO> getListDogToys() {
        return listDogToys;
    }

    public void setListDogToys(List<AccessoryDTO> listDogToys) {
        this.listDogToys = listDogToys;
    }

    public List<AccessoryDTO> getListDogComestic() {
        return listDogComestic;
    }

    public void setListDogComestic(List<AccessoryDTO> listDogComestic) {
        this.listDogComestic = listDogComestic;
    }

    public List<AccessoryDTO> getListCatFood() {
        return listCatFood;
    }

    public void setListCatFood(List<AccessoryDTO> listCatFood) {
        this.listCatFood = listCatFood;
    }

    public List<AccessoryDTO> getListCatClothes() {
        return listCatClothes;
    }

    public void setListCatClothes(List<AccessoryDTO> listCatClothes) {
        this.listCatClothes = listCatClothes;
    }

    public List<AccessoryDTO> getListCatToys() {
        return listCatToys;
    }

    public void setListCatToys(List<AccessoryDTO> listCatToys) {
        this.listCatToys = listCatToys;
    }

    public List<AccessoryDTO> getListCatComestic() {
        return listCatComestic;
    }

    public void setListCatComestic(List<AccessoryDTO> listCatComestic) {
        this.listCatComestic = listCatComestic;
    }

    public List<AccessoryDTO> getListHamsterFood() {
        return listHamsterFood;
    }

    public void setListHamsterFood(List<AccessoryDTO> listHamsterFood) {
        this.listHamsterFood = listHamsterFood;
    }

    public List<AccessoryDTO> getListHamsterClothes() {
        return listHamsterClothes;
    }

    public void setListHamsterClothes(List<AccessoryDTO> listHamsterClothes) {
        this.listHamsterClothes = listHamsterClothes;
    }

    public List<AccessoryDTO> getListHamsterToys() {
        return listHamsterToys;
    }

    public void setListHamsterToys(List<AccessoryDTO> listHamsterToys) {
        this.listHamsterToys = listHamsterToys;
    }

    public List<AccessoryDTO> getListHamsterComestic() {
        return listHamsterComestic;
    }

    public void setListHamsterComestic(List<AccessoryDTO> listHamsterComestic) {
        this.listHamsterComestic = listHamsterComestic;
    }

}
