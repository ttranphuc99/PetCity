/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import phuctt.dbs.DBConnection;
import phuctt.dtos.InvoiceServiceDTO;
import phuctt.dtos.ServiceDTO;
import phuctt.dtos.StaffDTO;

/**
 *
 * @author Thien Phuc
 */
public class InvoiceServiceDAO implements Serializable {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public List<StaffDTO> listStaffAvailableForService(InvoiceServiceDTO dto) throws SQLException, ClassNotFoundException {
        List<StaffDTO> result = null;
        try {
            conn = DBConnection.getConnection();

            //1. Get all staff in serve this service
            String sql = "SELECT T.staffID as id\n"
                    + "FROM Service S, Staff T, Staff_Service_Detail D\n"
                    + "WHERE S.serviceID = D.serviceID AND D.staffID = T.staffID AND D.isDelete = ? "
                    + "AND T.isAvailable = ? AND S.isDelete = ? AND D.isDelete = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, false);
            ps.setBoolean(2, true);
            ps.setBoolean(3, false);
            ps.setBoolean(4, false);
            
            rs = ps.executeQuery();
            result = new ArrayList<>();
            StaffDAO staffDao = new StaffDAO();
            
            while (rs.next()) {
                result.add(staffDao.findByID(rs.getInt("id")));
            }
            closeConnection();
            
            //2. Get all invoice that a staff will do and check
            float timeEnd, timeStart;
            List<InvoiceServiceDTO> listInvoice;
            StaffDTO staffDTO;
            for (int i = 0; i < result.size(); i++) {
                staffDTO = result.get(i);
                listInvoice = this.getInvoiceByStaffAndDate(staffDTO.getId(), dto.getDoingDate());
                
                for (InvoiceServiceDTO invoiceServiceDTO : listInvoice) {
                    timeEnd = invoiceServiceDTO.getTimeStart() + invoiceServiceDTO.getService().getDuration();
                    timeStart = invoiceServiceDTO.getTimeStart();
                    
                    if (timeEnd > dto.getTimeStart() || timeStart < (dto.getTimeStart() + dto.getService().getDuration())) {
                        result.remove(i);
                    }
                }
            }
            
            //3. check waitting invoice and staff available
            conn = DBConnection.getConnection();
            sql = "SELECT count(invoiceID) as num FROM Invoice_Service WHERE status = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, 0);
            rs = ps.executeQuery();
            
            int numWaitting = 0;
            if (rs.next()) {
                numWaitting = rs.getInt("num");
            }
            
            if (numWaitting >= result.size()) {
                result.clear();
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<InvoiceServiceDTO> getInvoiceByStaffAndDate(int staffID, String dateDoing) throws SQLException, ClassNotFoundException {
        List<InvoiceServiceDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT invoiceID, timeStart, duration, S.serviceID as id "
                    + "FROM Invoice_Service I, Service S "
                    + "WHERE staffDoing = ? AND doingDate LIKE ? AND I.serviceID = S.serviceID";
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, staffID);
            ps.setString(2, "%" +dateDoing+ "%");
            
            rs = ps.executeQuery();
            
            result = new ArrayList<>();
            
            InvoiceServiceDTO invoice;
            ServiceDTO service;
            
            while (rs.next()) {
                invoice = new InvoiceServiceDTO();
                invoice.setId(rs.getLong("invoiceID"));
                invoice.setTimeStart(rs.getFloat("timeStart"));
                
                service = new ServiceDTO();
                service.setId(rs.getInt("id"));
                service.setDuration(rs.getFloat("duration"));
                
                invoice.setService(service);
                
                result.add(invoice);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
