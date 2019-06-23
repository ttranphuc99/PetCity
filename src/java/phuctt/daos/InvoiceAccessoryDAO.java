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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import phuctt.dbs.DBConnection;
import phuctt.dtos.AccessoryDTO;
import phuctt.dtos.InvoiceAccessoryDTO;

/**
 *
 * @author Thien Phuc
 */
public class InvoiceAccessoryDAO implements Serializable {

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

    public boolean insert(List<AccessoryDTO> list, String buyerUsername) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            String sql = "INSERT INTO Invoice_Accessory(createdTime, buyerUsername, status) VALUES(?,?,?)";
            ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            Timestamp createdTime = new Timestamp((new Date()).getTime());
            ps.setTimestamp(1, createdTime);
            ps.setString(2, buyerUsername);
            ps.setInt(3, 0);

            check = ps.executeUpdate() > 0;

            if (check) {
                rs = ps.getGeneratedKeys();

                long invoiceID;
                if (rs.next()) {
                    invoiceID = rs.getLong(1);

                    sql = "INSERT INTO Invoice_Accessory_Detail(accessoryID, invoiceID, quantity, subPrice) VALUES(?,?,?,?)";
                    ps = conn.prepareStatement(sql);

                    for (AccessoryDTO accessoryDTO : list) {
                        ps.setLong(1, accessoryDTO.getId());
                        ps.setLong(2, invoiceID);
                        ps.setInt(3, accessoryDTO.getQuantity());
                        ps.setFloat(4, accessoryDTO.getPrice());

                        check = ps.executeUpdate() > 0;

                        if (!check) {
                            break;
                        }
                    }

                    if (check) {
                        sql = "UPDATE Accessory SET quantity = quantity - ? WHERE accessoryID = ?";
                        ps = conn.prepareStatement(sql);

                        for (AccessoryDTO accessoryDTO : list) {
                            ps.setInt(1, accessoryDTO.getQuantity());
                            ps.setLong(2, accessoryDTO.getId());

                            check = ps.executeUpdate() > 0;

                            if (!check) {
                                break;
                            }
                        }

                        if (check) {
                            conn.commit();
                        }
                    }

                }
            }

        } finally {
            closeConnection();
        }
        return check;
    }

    public List<InvoiceAccessoryDTO> getAllMember(String username, int page) throws SQLException, ClassNotFoundException {
        List<InvoiceAccessoryDTO> result = null;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT I.invoiceID as id, createdTime, I.status as stt, sum(D.quantity * D.subPrice) as total\n"
                    + "FROM Invoice_Accessory I, Invoice_Accessory_Detail D\n"
                    + "WHERE I.buyerUsername = ? AND I.invoiceID = D.invoiceID\n"
                    + "GROUP BY I.invoiceID, createdTime, I.status\n"
                    + "ORDER BY I.invoiceID DESC OFFSET " + ((page - 1) * 5) + " ROWS FETCH NEXT 5 ROWS ONLY";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            
            rs = ps.executeQuery();
            
            result = new ArrayList<>();
            InvoiceAccessoryDTO dto;
            long id;
            Timestamp createdTime;
            int status;
            float total;
            
            while (rs.next()) {
                id = rs.getLong("id");
                createdTime = rs.getTimestamp("createdTime");
                status = rs.getInt("stt");
                total = rs.getFloat("total");
                
                dto = new InvoiceAccessoryDTO();
                dto.setId(id);
                dto.setCreatedTime(createdTime);
                dto.setStatus(status);
                dto.setTotal(total);
                
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getAllMember(String username) throws SQLException, ClassNotFoundException {
        int num = 0;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT count(invoiceID) as num FROM Invoice_Accessory WHERE buyerUsername = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, username);

            rs = ps.executeQuery();

            if (rs.next()) {
                num = rs.getInt("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }
}
