/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.OrderDetailsDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author 84909
 */
public class OrderDetailsDAO {

    public boolean insert(OrderDetailsDTO dto) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Insert Into tblOrderDetails(orderID,productID,quantity,unitPrice) Values(?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getOrderID());
                stm.setString(2, dto.getProductID());
                stm.setInt(3, dto.getQuantity());
                stm.setFloat(4, dto.getUnitPrice());

                int check1 = stm.executeUpdate();
                if (check1 > 0) {
                    check = true;

                }

            }
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public List<OrderDetailsDTO> getListOrderDetails(String orderID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDetailsDTO> list = new ArrayList();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select orderID,productID,quantity,unitPrice From tblOrderDetails Where orderID=? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");

                    int quantity = rs.getInt("quantity");
                    float price = rs.getFloat("unitPrice");

                    list.add(new OrderDetailsDTO(orderID, productID, quantity, price));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
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
        return list;
    }
}
