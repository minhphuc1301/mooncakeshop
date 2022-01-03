/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author 84909
 */
public class MoonCakeDTO implements Serializable {

    public MoonCakeDTO(String productID, int unitInStock) {
        this.productID = productID;
        this.unitInStock = unitInStock;
    }

    private String productID, productName, description, imageUrl, status, updateBy;
    private float price;
    private int unitInStock, CategoryID, quantity;
    private Date createDate, expirationDate, lastUpdate;

    public MoonCakeDTO(String productID, String productName, String imageUrl, float price, int unitInStock, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.price = price;
        this.unitInStock = unitInStock;
        this.quantity = quantity;
    }

    public MoonCakeDTO(String productID, String productName, String description, String imageUrl, String status, float price, int unitInStock, int CategoryID,  Date createDate, Date expirationDate, Date lastUpdate, String updateBy) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.imageUrl = imageUrl;
        this.status = status;

        this.price = price;
        this.unitInStock = unitInStock;
        this.CategoryID = CategoryID;
        
        this.createDate = createDate;
        this.expirationDate = expirationDate;
        this.lastUpdate = lastUpdate;
        this.updateBy = updateBy;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public MoonCakeDTO() {
    }

    public MoonCakeDTO(String productID) {
        this.productID = productID;
    }

    public MoonCakeDTO(String productID, String productName, String description, String imageUrl, String status, float price, int unitInStock, int CategoryID, Date createDate, Date expirationDate) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.imageUrl = imageUrl;
        this.status = status;
        this.price = price;
        this.unitInStock = unitInStock;
        this.CategoryID = CategoryID;
        this.createDate = createDate;
        this.expirationDate = expirationDate;
    }

    public MoonCakeDTO(String productID, String productName, float price, int unitInStock, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.unitInStock = unitInStock;
        this.quantity = quantity;
    }

    public MoonCakeDTO(String productID, String productName, String description, String imageUrl, float price, int unitInStock, int CategoryID, Date createDate, Date expirationDate) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.imageUrl = imageUrl;
        this.price = price;
        this.unitInStock = unitInStock;
        this.CategoryID = CategoryID;
        this.createDate = createDate;
        this.expirationDate = expirationDate;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getUnitInStock() {
        return unitInStock;
    }

    public void setUnitInStock(int unitInStock) {
        this.unitInStock = unitInStock;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

}
