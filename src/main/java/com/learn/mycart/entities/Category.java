/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.entities;


import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author Neha
 */
@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String Title;
    private String categoryDescription;
    @OneToMany(mappedBy = "category")
    private List<Product> products =new ArrayList<>();
    
    
    public Category(int categoryId, String Title, String categoryDescription) {
        this.categoryId = categoryId;
        this.Title = Title;
        this.categoryDescription = categoryDescription;
    }

    public Category(String Title, String categoryDescription,List<Product> products) {
        this.Title = Title;
        this.categoryDescription = categoryDescription;
        this.products = products;
    }
    
    
    
    public Category() {
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
    
    

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", Title=" + Title + ", categoryDescription=" + categoryDescription + '}';
    }
    
}

