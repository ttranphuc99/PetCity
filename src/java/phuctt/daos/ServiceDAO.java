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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import phuctt.dbs.DBConnection;
import phuctt.dtos.ServiceDTO;
import phuctt.dtos.StaffDTO;
import phuctt.dtos.TypeDTO;

/**
 *
 * @author Thien Phuc
 */
public class ServiceDAO implements Serializable {

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

    public int add(ServiceDTO dto, List<StaffDTO> staff) throws SQLException, ClassNotFoundException {
        int id = -1;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            String sql = "INSERT INTO Service(name, forType, duration, price, description, isDelete) VALUES(?,?,?,?,?,?)";

            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, dto.getName());
            ps.setInt(2, dto.getType().getId());
            ps.setFloat(3, dto.getDuration());
            ps.setFloat(4, dto.getPrice());
            ps.setString(5, dto.getDescription());
            ps.setBoolean(6, false);

            boolean check = ps.executeUpdate() > 0;

            if (check) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    id = rs.getInt(1);
                }
            }

            sql = "INSERT INTO Staff_Service_Detail(staffID, serviceID, isDelete) VALUES(?,?,?)";

            for (StaffDTO staffDTO : staff) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, staffDTO.getId());
                ps.setInt(2, id);
                ps.setBoolean(3, false);

                check = ps.executeUpdate() > 0;
            }

            if (!check) {
                id = -1;
            } else {
                conn.commit();
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public boolean updateImage(int id, String image) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE Service SET image = ? WHERE serviceID = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, image);
            ps.setInt(2, id);

            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public int searchName(String search) throws SQLException, ClassNotFoundException {
        int num = 0;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT count(serviceID) as num FROM Service WHERE name LIKE ? AND isDelete = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setBoolean(2, false);

            rs = ps.executeQuery();

            if (rs.next()) {
                num = rs.getInt("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }

    public List<ServiceDTO> searchName(String search, int page) throws SQLException, ClassNotFoundException {
        List<ServiceDTO> result = null;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT serviceID, name, forType, duration, price, image FROM Service "
                    + "WHERE name LIKE ? AND isDelete = ? "
                    + "ORDER BY serviceID OFFSET " + ((page - 1) * 5) + " ROWS FETCH NEXT 5 ROWS ONLY";

            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setBoolean(2, false);

            rs = ps.executeQuery();

            int id;
            String name, image;
            float duration, price;
            TypeDTO type;
            ServiceDTO dto;

            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getInt("serviceID");
                name = rs.getString("name");
                type = (new TypeDAO()).findByID(rs.getInt("forType"));
                duration = rs.getFloat("duration");
                price = rs.getFloat("price");
                image = rs.getString("image");

                dto = new ServiceDTO(name, "", type, duration, price);
                dto.setId(id);
                dto.setImage(image);

                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean delete(int id) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);
            String sql = "UPDATE Service SET isDelete = ? WHERE serviceID = ?";
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setInt(2, id);

            check = ps.executeUpdate() > 0;

            if (check) {
                sql = "UPDATE Staff_Service_Detail SET isDelete = ? WHERE serviceID = ?";

                ps = conn.prepareStatement(sql);
                ps.setBoolean(1, true);
                ps.setInt(2, id);

                check = ps.executeUpdate() >= 0;
                
                if (check) {
                    conn.commit();
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(ServiceDTO dto, List<StaffDTO> staff) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);
            String sql = "UPDATE Service SET name = ?, forType = ?, duration = ?, price = ?, description = ? WHERE serviceID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getName());
            ps.setInt(2, dto.getType().getId());
            ps.setFloat(3, dto.getDuration());
            ps.setFloat(4, dto.getPrice());
            ps.setString(5, dto.getDescription());
            ps.setInt(6, dto.getId());

            check = ps.executeUpdate() > 0;

            if (check) {
                sql = "UPDATE Staff_Service_Detail SET isDelete = ? WHERE serviceID = ?";
                ps = conn.prepareStatement(sql);

                ps.setBoolean(1, true);
                ps.setInt(2, dto.getId());

                check = ps.executeUpdate() > 0;

                if (check) {
                    for (StaffDTO staffDTO : staff) {
                        try {
                            sql = "INSERT INTO Staff_Service_Detail(staffID, serviceID, isDelete) VALUES(?,?,?)";
                            ps = conn.prepareStatement(sql);

                            ps.setInt(1, staffDTO.getId());
                            ps.setInt(2, dto.getId());
                            ps.setBoolean(3, false);

                            check = ps.executeUpdate() > 0;
                        } catch (SQLException e) {
                            if (e.getMessage().contains("duplicate")) {
                                sql = "UPDATE Staff_Service_Detail SET isDelete = ? WHERE staffID = ? AND serviceID = ?";

                                ps = conn.prepareStatement(sql);
                                ps.setBoolean(1, false);
                                ps.setInt(2, staffDTO.getId());
                                ps.setInt(3, dto.getId());

                                check = ps.executeUpdate() > 0;
                            } else {
                                throw e;
                            }
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

    public ServiceDTO findByID(int id) throws SQLException, ClassNotFoundException {
        ServiceDTO dto = null;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT name, forType, duration, price, description, image FROM Service WHERE serviceID = ?";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                TypeDTO type = (new TypeDAO()).findByID(rs.getInt("forType"));
                float duration = rs.getFloat("duration");
                float price = rs.getFloat("price");
                String description = rs.getString("description");
                String image = rs.getString("image");

                dto = new ServiceDTO(name, description, type, duration, price);
                dto.setImage(image);
                dto.setId(id);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public List<ServiceDTO> loadServiceToPage(int typeID) throws SQLException, ClassNotFoundException {
        List<ServiceDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT serviceID, name, duration, price, image, description "
                    + "FROM Service "
                    + "WHERE forType = ? AND isDelete = ? ";
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, typeID);
            ps.setBoolean(2, false);
            
            rs = ps.executeQuery();
            
            int serviceID;
            String name, image, description;
            float duration, price;
            ServiceDTO dto;
            result = new ArrayList<>();
            
            while (rs.next()) {
                serviceID = rs.getInt("serviceID");
                name = rs.getString("name");
                duration = rs.getFloat("duration");
                price = rs.getFloat("price");
                image = rs.getString("image");
                description = rs.getString("description");
                
                dto = new ServiceDTO();
                dto.setId(serviceID);
                dto.setName(name);
                dto.setImage(image);
                dto.setDuration(duration);
                dto.setPrice(price);
                dto.setDescription(description);
                
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
