/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product.manager;

import java.time.LocalDate;

/**
 *
 * @author Bartek
 */
public class Product {

    private int id;
    private String name;
    private LocalDate releaseDate;
    private String category;
    private String platform;
    private double price;
    private String publisher;
    private String description;
    private String image;

    public Product(int id, String name, LocalDate releaseDate, String category, String platform, double price, String publisher, String description, String image) {
        this.id = id;
        this.name = name;
        this.releaseDate = releaseDate;
        this.category = category;
        this.platform = platform;
        this.price = price;
        this.publisher = publisher;
        this.description = description;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(LocalDate releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
