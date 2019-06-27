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

            String sql = "SELECT invoiceID, timeStart, duration, serviceID as id "
                    + "FROM Invoice_Service "
                    + "WHERE staffDoing = ? AND doingDate LIKE ?";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, staffID);
            ps.setString(2, "%" + dateDoing + "%");

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

    public boolean isPetFree(InvoiceServiceDTO dto) throws SQLException, ClassNotFoundException {
        boolean check = true;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT timeStart as start, duration\n"
                    + "FROM Invoice_Service\n"
                    + "WHERE doingDate LIKE ? AND petID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +dto.getDoingDate()+ "%");
            ps.setLong(2, dto.getPet().getId());
            
            rs = ps.executeQuery();
            
            float timeStart, timeEnd;
            while (rs.next()) {
                timeStart = rs.getFloat("start");
                timeEnd = timeStart + rs.getFloat("duration");
                
                if (timeEnd > dto.getTimeStart() || timeStart < (dto.getTimeStart() + dto.getService().getDuration())) {
                    check = false;
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean insert(InvoiceServiceDTO dto) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO Invoice_Service(createTime, price, status, doingDate, petID, timeStart, serviceID, duration) VALUES(?,?,?,?,?,?,?,?)";
            
            ps = conn.prepareStatement(sql);
            ps.setTimestamp(1, dto.getCreateTime());
            ps.setFloat(2, dto.getPrice());
            ps.setInt(3, 0);
            ps.setString(4, dto.getDoingDate());
            ps.setLong(5, dto.getPet().getId());
            ps.setFloat(6, dto.getTimeStart());
            ps.setInt(7, dto.getService().getId());
            ps.setFloat(8, dto.getDuration());
            
            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
