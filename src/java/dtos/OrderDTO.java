/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.sql.Date;

/**
 *
 * @author 84909
 */
public class OrderDTO {

    private String orderID, userID, status, shipAddress;
    private float total;
    private Date orderDate;

    public OrderDTO(String orderID, String userID, String status, float total, Date orderDate, String shipAddress) {
        this.orderID = orderID;
        this.userID = userID;
        this.status = status;
     
        this.total = total;
        this.orderDate = orderDate;
        this.shipAddress = shipAddress;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public OrderDTO(String orderID, String userID, String status, String shipAddress, float total) {
        this.orderID = orderID;
        this.userID = userID;
        this.status = status;
        this.shipAddress = shipAddress;
        this.total = total;
    }

    public OrderDTO(String orderID, String userID, String status, float total) {
        this.orderID = orderID;
        this.userID = userID;
        this.status = status;
        this.total = total;
    }

    public OrderDTO() {
    }

    public OrderDTO(String orderID, String userID, String status, float total, Date orderDate) {
        this.orderID = orderID;
        this.userID = userID;
        this.status = status;
        this.total = total;
        this.orderDate = orderDate;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

}
