/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author kusod
 */
@Controller
public class HomeController {
    @GetMapping("/home")
    public String homepage(){
        return "shop"; 
    }
    
    @GetMapping("/contact")
    public String ShowContactPage() {
        return "/contact";
    }
    
    @GetMapping("/blog")
    public String ShowBlogPage() {
        return "/blog";
    }
    
    
    
}
