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
public class MoonCakeInCartDTO {

    public MoonCakeDTO getCake() {
        return cake;
    }

    public void setCake(MoonCakeDTO cake) {
        this.cake = cake;
    }

    private MoonCakeDTO cake;
    private int quantity;

    public MoonCakeInCartDTO() {
    }

    public MoonCakeInCartDTO(MoonCakeDTO cake, int quantity) {
        this.cake = cake;
        this.quantity = quantity;
    }

    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
