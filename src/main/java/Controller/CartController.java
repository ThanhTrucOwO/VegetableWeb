/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Entities.Cart;
import Entities.CartDetail;
import Entities.Vegetable;
import Repository.CartRepository;
import Repository.CartDetailRepository;
import Repository.VegetableRepository;
import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;
import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author kusod
 */
@Controller
public class CartController {

    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private CartDetailRepository cartDetailRepository;
    @Autowired
    private VegetableRepository vegetableRepository;

    @GetMapping("/checkout")
    public String ShowCheckOut(HttpSession session, Model m) {
        if (session.getAttribute("username") == null) {
            m.addAttribute("error", "Please login to continue shopping");
            return "login";
        }
        return "checkout";
    }

    @PostMapping("/checkout/add")
    public void addCart(HttpSession session, @RequestBody String payload) throws ParseException, NoSuchFieldException {
        int userId = (Integer) session.getAttribute("idUser");

        JSONObject jsonObject = new JSONObject(payload);

        Cart newCart = new Cart();
        newCart.setCustomerID(userId);
        newCart.setNote(jsonObject.get("note").toString());
        newCart.setTotal(Float.valueOf(jsonObject.get("total").toString()));
        newCart.setDate(new Date());
        cartRepository.save(newCart);

        JSONArray array = jsonObject.getJSONArray("carts");
        for(int i = 0;i < array.length();i++){
            JSONObject obj = array.getJSONObject(i);
            CartDetail detail = new CartDetail();
            detail.setOrderID(newCart.getOrderID());
            detail.setVegetableID(Integer.parseInt(obj.get("id").toString()));
            detail.setQuantity(Integer.parseInt(obj.get("quantity").toString()));
            detail.setPrice(Float.parseFloat(obj.get("price").toString()) * Float.parseFloat(obj.get("quantity").toString()));
            cartDetailRepository.save(detail);
        }
    }

    @GetMapping("/cart")
    public String ShowCart(HttpSession session, Model m) {
        Iterable<Vegetable> listVetgetable = vegetableRepository.findAll();
        m.addAttribute("dataVegetable", listVetgetable);
        return "cart";
    }
}
