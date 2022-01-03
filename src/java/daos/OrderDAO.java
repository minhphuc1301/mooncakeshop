/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.OrderDTO;
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
public class OrderDAO {

    public boolean insertOrder(OrderDTO dto) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Insert Into tblOrders(orderID,userID,total,status,orderDate,shipAddress) Values(?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getOrderID());
                stm.setString(2, dto.getUserID());
                stm.setFloat(3, dto.getTotal());
                stm.setString(4, dto.getStatus());
                long t = System.currentTimeMillis();
                java.sql.Date date = new java.sql.Date(t);
                stm.setDate(5, date);
                stm.setString(6, dto.getShipAddress());
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

    public List<OrderDTO> getListOrderBySearch(String orderID, String userID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDTO> list = new ArrayList();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select orderID,userID,total,status,orderDate,shipAddress From tblOrders Where orderID like ? and userID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + orderID + "%");
                stm.setString(2, userID);

                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderId = rs.getString("orderID");
                    String user = rs.getString("userID");

                    float total = rs.getFloat("total");
                    String status = rs.getString("status");
                    Date date = rs.getDate("orderDate");
                    String address = rs.getString("shipAddress");

                    list.add(new OrderDTO(orderId, user, status, total, date, address));
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

    public List<OrderDTO> getListOrder(String userID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDTO> list = new ArrayList();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select orderID,userID,total,status,orderDate,shipAddress From tblOrders Where userID=? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");

                    float total = rs.getFloat("total");
                    String status = rs.getString("status");
                    Date date = rs.getDate("orderDate");
                    String address = rs.getString("shipAddress");

                    list.add(new OrderDTO(orderID, userID, status, total, date, address));
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

    public List<OrderDTO> getListOrder() throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<OrderDTO> list = new ArrayList();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select orderID,userID,total,status,orderDate From tblOrders ";
                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String userID = rs.getString("userID");
                    float total = rs.getFloat("total");
                    String status = rs.getString("status");
                    Date date = rs.getDate("orderDate");

                    list.add(new OrderDTO(orderID, userID, status, total, date));
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

    public String generateOrderID() throws SQLException {
        String o = "OR";
        int num = 0;
        String orderID = o + num;

        for (int i = 0; i < getListOrder().size(); i++) {
            {
                if (orderID.equals(getListOrder().get(i).getOrderID())) {
                    num++;
                    orderID = o + num;
                } else if ((!orderID.equals(getListOrder().get(i).getOrderID()))) {
                    num++;
                    orderID = o + "R" + num;

                } else {
                    num++;
                    orderID = o + "RR" + num;
                }
            }

        }
        return orderID;
    }
}
