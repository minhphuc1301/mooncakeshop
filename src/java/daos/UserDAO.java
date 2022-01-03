/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author 84909
 */
public class UserDAO {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public void closeConenction() throws Exception {

        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (con != null) {
            con.close();
        }
    }

    public UserDTO checkLogin(String username, String password) throws Exception {
        UserDTO dto = null;
        String sql = "Select username,password,fullName,roleID,phone,address,gender From tblUser Where username=? And password=?";
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String gender = rs.getString("gender");

                dto = new UserDTO(username, password, fullName, roleID, gender, address, phone);
            }
        } finally {
            closeConenction();

        }
        return dto;
    }

    public boolean insert(UserDTO dto) throws Exception {
        boolean check = false;
        String sql = "Insert Into tblUser(username,password,fullName,roleID,gender,phone,address) Values(?,?,?,?,?,?,?)";
        try {

            con = DBUtils.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, dto.getUserID());
            stm.setString(2, dto.getPassword());
            stm.setString(3, dto.getFullName());
            stm.setString(4, ("US"));
            stm.setString(5, dto.getGender());
            stm.setString(6, dto.getPhone());
            stm.setString(7, dto.getAddress());
            check = stm.executeUpdate() > 0 ? true : false;

        } finally {
            closeConenction();
        }
        return check;
    }
}
