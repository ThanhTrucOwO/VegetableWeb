/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import org.springframework.stereotype.Controller;
import Entities.Category;
import Entities.Vegetable;
import Repository.CartDetailRepository;
import Repository.CategoryRepository;
import Repository.VegetableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author kusod
 */
@Controller
public class VegetableController {
    @Autowired
    private VegetableRepository vegetableRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private CartDetailRepository cartDetailRepository;

    @GetMapping("/shop")
    public String getAll(Model m) {
        Iterable<Vegetable> listVetgetable = vegetableRepository.findAll();
        Iterable<Category> listCategory = categoryRepository.findAll();
        m.addAttribute("dataVegetable", listVetgetable);
        m.addAttribute("dataCategory", listCategory);
        return "shop";
    }
    
    @GetMapping("/shop/category")
    public String getVegetableByCategory(Model m, @RequestParam(required = false) String IdCategory) {
        Iterable<Vegetable> list = vegetableRepository.getVegetablesByCategory(IdCategory);
        Iterable<Category> listCate = categoryRepository.findAll();
        m.addAttribute("dataCategory", listCate);
        m.addAttribute("dataVegetable", list);
        return "shop";
    }
    
    @GetMapping("/shop/product")
    public String getVegetableByID(Model m, @RequestParam(required = false) String IdProduct) {
        Vegetable v = vegetableRepository.getVegetableByID(IdProduct);
        Iterable<Category> listCategory = categoryRepository.findAll();
        m.addAttribute("dataCategory", listCategory);
        m.addAttribute("dataVegetable", v);
        return "product";
    }
}
