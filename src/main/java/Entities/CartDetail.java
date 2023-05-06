/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

/**
 *
 * @author kusod
 */
@Data
@Entity(name = "orderdetail")
@Table(name = "orderdetail")
public class CartDetail {
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Integer OrderID;
    @Column
    private Integer VegetableID;
    @Column
    private Integer Quantity;
    @Column
    private Float Price;

}
