/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author 84909
 */
public class ErrorMoonCakeDTO {

    private String productIDError, productNameError, descriptionError, priceError, unitInStockError, fromDateError,toDateError,imgError;

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getUnitInStockError() {
        return unitInStockError;
    }

    public void setUnitInStockError(String unitInStockError) {
        this.unitInStockError = unitInStockError;
    }

    public String getFromDateError() {
        return fromDateError;
    }

    public void setFromDateError(String fromDateError) {
        this.fromDateError = fromDateError;
    }

    public String getToDateError() {
        return toDateError;
    }

    public void setToDateError(String toDateError) {
        this.toDateError = toDateError;
    }

    public String getImgError() {
        return imgError;
    }

    public void setImgError(String imgError) {
        this.imgError = imgError;
    }

    public ErrorMoonCakeDTO() {
    }

    public ErrorMoonCakeDTO(String productIDError, String productNameError, String descriptionError, String priceError, String unitInStockError, String fromDateError, String toDateError, String imgError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.descriptionError = descriptionError;
        this.priceError = priceError;
        this.unitInStockError = unitInStockError;
        this.fromDateError = fromDateError;
        this.toDateError = toDateError;
        this.imgError = imgError;
    }
    

}
