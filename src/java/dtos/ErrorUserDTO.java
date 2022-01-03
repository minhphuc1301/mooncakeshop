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
public class ErrorUserDTO {

    private String userIDError, fullNameError, phoneError, passwordError, confirmError, adressError;

    public String getAdressError() {
        return adressError;
    }

    public void setAdressError(String adressError) {
        this.adressError = adressError;
    }

    public ErrorUserDTO(String userIDError, String fullNameError, String phoneError, String passwordError, String confirmError, String adressError) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.phoneError = phoneError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.adressError = adressError;
    }

    public ErrorUserDTO(String userIDError, String fullNameError, String phoneError, String passwordError, String confirmError) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.phoneError = phoneError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
    }

    public ErrorUserDTO() {
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

}
