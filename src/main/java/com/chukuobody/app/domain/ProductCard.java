package com.chukuobody.app.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ProductCard {
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private Long id;

private String name;
private String productCategory;
private Double caloriesPG;
private Double proteinsPG;
private Double fatsPG;
private Double carbohydratesPG;
private String fileName;

public ProductCard() {
	
}

public ProductCard(String name, String productCategory, Double caloriesPG, Double proteinsPG, Double fatsPG,
		Double carbohydratesPG, String fileName) {
	this.name = name;
	this.productCategory = productCategory;
	this.caloriesPG = caloriesPG;
	this.proteinsPG = proteinsPG;
	this.fatsPG = fatsPG;
	this.carbohydratesPG = carbohydratesPG;
	this.fileName = fileName;
}

public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getProductCategory() {
	return productCategory;
}
public void setProductCategory(String productCategory) {
	this.productCategory = productCategory;
}
public Double getCaloriesPG() {
	return caloriesPG;
}
public void setCaloriesPG(Double caloriesPG) {
	this.caloriesPG = caloriesPG;
}
public Double getProteinsPG() {
	return proteinsPG;
}
public void setProteinsPG(Double proteinsPG) {
	this.proteinsPG = proteinsPG;
}
public Double getFatsPG() {
	return fatsPG;
}
public void setFatsPG(Double fatsPG) {
	this.fatsPG = fatsPG;
}
public Double getCarbohydratesPG() {
	return carbohydratesPG;
}
public void setCarbohydratesPG(Double carbohydratesPG) {
	this.carbohydratesPG = carbohydratesPG;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}

}
