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

    public List<InvoiceAccessoryDTO> getAllMember(String username, long page) throws SQLException, ClassNotFoundException {
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

    public long getAllMember(String username) throws SQLException, ClassNotFoundException {
        long num = 0;
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

    public boolean belongTo(String username, long id) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT createdTime FROM Invoice_Accessory WHERE buyerUsername = ? AND invoiceID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setLong(2, id);

            rs = ps.executeQuery();

            if (rs.next()) {
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean cancelInvoice(long id) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT status FROM Invoice_Accessory WHERE invoiceID = ?";

            ps = conn.prepareStatement(sql);
            ps.setLong(1, id);

            int curStt = -1;
            rs = ps.executeQuery();

            if (rs.next()) {
                curStt = rs.getInt("status");
            }

            if (curStt != -1) {
                conn.setAutoCommit(false);

                sql = "UPDATE Invoice_Accessory SET status = ? WHERE invoiceID = ?";

                ps = conn.prepareStatement(sql);
                ps.setInt(1, -1);
                ps.setLong(2, id);

                check = ps.executeUpdate() > 0;

                if (check) {
                    List<Long> listAccessoryID = new ArrayList<>();
                    sql = "SELECT accessoryID FROM Invoice_Accessory_Detail WHERE invoiceID = ?";

                    ps = conn.prepareStatement(sql);
                    ps.setLong(1, id);

                    rs = ps.executeQuery();

                    while (rs.next()) {
                        listAccessoryID.add(rs.getLong("accessoryID"));
                    }

                    sql = "UPDATE Accessory\n"
                            + "SET quantity = quantity + (\n"
                            + "	SELECT quantity\n"
                            + "	FROM Invoice_Accessory_Detail\n"
                            + "	WHERE invoiceID = ? AND accessoryID = ?\n"
                            + ")\n"
                            + "WHERE accessoryID = ?";

                    ps = conn.prepareStatement(sql);
                    ps.setLong(1, id);

                    for (Long accessoryID : listAccessoryID) {
                        ps.setLong(2, accessoryID);
                        ps.setLong(3, accessoryID);

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
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<AccessoryDTO> getDetailInvoice(long id) throws SQLException, ClassNotFoundException {
        List<AccessoryDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT A.name as name, A.image as image, I.subPrice as price, I.quantity as quantity\n"
                    + "FROM Accessory A, Invoice_Accessory_Detail I\n"
                    + "WHERE I.invoiceID = ? AND A.accessoryID = I.accessoryID";

            ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();

            AccessoryDTO dto;
            String name, image;
            int quantity;
            float price;
            result = new ArrayList<>();

            while (rs.next()) {
                name = rs.getString("name");
                image = rs.getString("image");
                price = rs.getFloat("price");
                quantity = rs.getInt("quantity");

                dto = new AccessoryDTO();
                dto.setName(name);
                dto.setImage(image);
                dto.setPrice(price);
                dto.setQuantity(quantity);

                result.add(dto);
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<InvoiceAccessoryDTO> adminGetListInvoice(long page) throws SQLException, ClassNotFoundException {
        List<InvoiceAccessoryDTO> result = null;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT I.invoiceID as id, createdTime, I.status as stt, sum(D.quantity * D.subPrice) as total, buyerUsername, adminConfirm\n"
                    + "FROM Invoice_Accessory I, Invoice_Accessory_Detail D\n"
                    + "WHERE I.invoiceID = D.invoiceID\n"
                    + "GROUP BY I.invoiceID, createdTime, I.status, buyerUsername, adminConfirm\n"
                    + "ORDER BY I.invoiceID DESC OFFSET " + ((page - 1) * 5) + " ROWS FETCH NEXT 5 ROWS ONLY";

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            long id;
            Timestamp createdTime;
            int status;
            float total;
            String buyerUsername, adminConfirm;

            InvoiceAccessoryDTO dto;
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getLong("id");
                createdTime = rs.getTimestamp("createdTime");
                status = rs.getInt("stt");
                total = rs.getFloat("total");
                buyerUsername = rs.getString("buyerUsername");
                adminConfirm = rs.getString("adminConfirm");

                dto = new InvoiceAccessoryDTO(createdTime, buyerUsername, adminConfirm, status);
                dto.setId(id);
                dto.setTotal(total);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public long adminGetListInvoice() throws SQLException, ClassNotFoundException {
        long num = 0;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT count(invoiceID) as num FROM Invoice_Accessory";

            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.next()) {
                num = rs.getLong("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }

    public boolean updateStatus(long id, int status, String username) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();

            if (status == -1) {
                check = this.cancelInvoice(id);
                if (!check) {
                    String sql = "UPDATE Invoice_Accessory SET adminConfirm = ? WHERE invoiceID = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, username);
                    ps.setLong(2, id);

                    check = ps.executeUpdate() > 0;
                }
            } else {
                conn.setAutoCommit(false);

                String sql = "SELECT status FROM Invoice_Accessory WHERE invoiceID = ?";
                ps = conn.prepareStatement(sql);
                ps.setLong(1, id);
                rs = ps.executeQuery();

                int curStatus = 0;
                if (rs.next()) {
                    curStatus = rs.getInt("status");
                }

                if (curStatus == -1) {
                    check = false;
                } else {
                    sql = "UPDATE Invoice_Accessory SET status = ? WHERE invoiceID = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, status);
                    ps.setLong(2, id);

                    check = ps.executeUpdate() > 0;

                    if (check) {
                        sql = "UPDATE Invoice_Accessory SET adminConfirm = ? WHERE invoiceID = ?";
                        ps = conn.prepareStatement(sql);
                        ps.setString(1, username);
                        ps.setLong(2, id);

                        check = ps.executeUpdate() > 0;
                        
                        if (check) conn.commit();
                    }
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public long getTotalInvoice() throws SQLException, ClassNotFoundException {
        long num = 0;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT count(invoiceID) as num FROM Invoice_Accessory";
            
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                num = rs.getLong("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }
    
    public long getTotalInvoice(int status) throws SQLException, ClassNotFoundException {
        long num = 0;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT count(invoiceID) as num FROM Invoice_Accessory WHERE status = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                num = rs.getLong("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }
}
