/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table; 

import lombok.Data;

/**
 *
 * @author kusod
 */

@Data
@Entity(name = "vegetable")
@Table(name = "vegetable")

public class Vegetable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer VegetableID;
    @Column
    private Integer CatagoryID;
    @Column
    private String Vegetable_Name;
    @Column
    private String Unit;
    @Column
    private Integer Amount;
    @Column
    private String Image;
    @Column
    private Float Price;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CatagoryID", nullable = true, insertable = false, updatable = false, foreignKey = @ForeignKey(name = "category_ibfk_1"))
    private Category CategoryObject;
    @Column
    private String Description; 

}
