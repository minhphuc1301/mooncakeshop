/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author 84909
 */
public class CartDTO {

    private Map<String, MoonCakeInCartDTO> cart;

    public Map<String, MoonCakeInCartDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, MoonCakeInCartDTO> cart) {
        this.cart = cart;
    }



    public boolean addToCart(MoonCakeInCartDTO dto) {
        boolean check = false;
        try {
            if (cart == null) {
                cart = new HashMap<>();
            }
            if (cart.containsKey(dto.getCake().getProductID())) {
                int quantity = cart.get(dto.getCake().getProductID()).getQuantity();
                dto.setQuantity(quantity + dto.getQuantity());
            }
            cart.put(dto.getCake().getProductID(), dto);
            check = true;
        } catch (Exception e) {
        }
        return check;

    }

    public boolean delete(String id) {
        boolean check = false;
        try {
            if (cart != null) {
                if (cart.containsKey(id)) {
                    cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {
        }

        return check;
    }

    public CartDTO(Map<String, MoonCakeInCartDTO> cart) {
        this.cart = cart;
    }

    public CartDTO() {
    }

    public boolean update(String id, MoonCakeInCartDTO dto) {
        boolean check = false;
        try {
            if (cart != null) {
                if (cart.containsKey(id)) {
                    cart.replace(id, dto);
                    check = true;
                }
            }
        } catch (Exception e) {
        }

        return check;
    }

}
