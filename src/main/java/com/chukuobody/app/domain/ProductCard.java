package com.chukuobody.app.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "product_card")
public class ProductCard {
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private Long id;

@NotBlank(message = "Please enter the name")
@Length(max = 255, message = "Name too long (more than 2kB)")
private String name;

@NotBlank(message = "Please enter the product category")
private String productCategory;

@NotNull(message = "Please enter the number of calories per gram")
@Digits(fraction = 3, integer = 3, message = "There must be no more than 3 decimal places and before the decimal point")
@PositiveOrZero(message = "The number must be positive")
private Float caloriesPG;

@NotNull(message = "Please enter the number of proteins per gram")
@Digits(fraction = 3, integer = 3, message = "There must be no more than 3 decimal places and before the decimal point")
@PositiveOrZero(message = "The number must be positive")
private Float proteinsPG;

@NotNull(message = "Please enter the number of fats per gram")
@Digits(fraction = 3, integer = 3, message = "There must be no more than 3 decimal places and before the decimal point")
@PositiveOrZero(message = "The number must be positive")
private Float fatsPG;

@NotNull(message = "Please enter the number of carbohydrates per gram")
@Digits(fraction = 3, integer = 3, message = "There must be no more than 3 decimal places and before the decimal point")
@PositiveOrZero(message = "The number must be positive")
private Float carbohydratesPG;

@NotBlank(message = "Please enter the link to picture")
private String fileName;

public ProductCard() {
	
}

public ProductCard(String name, String productCategory, Float caloriesPG, Float proteinsPG, Float fatsPG,
		Float carbohydratesPG, String fileName) {
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
public Float getCaloriesPG() {
	return caloriesPG;
}
public void setCaloriesPG(Float caloriesPG) {
	this.caloriesPG = caloriesPG;
}
public Float getProteinsPG() {
	return proteinsPG;
}
public void setProteinsPG(Float proteinsPG) {
	this.proteinsPG = proteinsPG;
}
public Float getFatsPG() {
	return fatsPG;
}
public void setFatsPG(Float fatsPG) {
	this.fatsPG = fatsPG;
}
public Float getCarbohydratesPG() {
	return carbohydratesPG;
}
public void setCarbohydratesPG(Float carbohydratesPG) {
	this.carbohydratesPG = carbohydratesPG;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}

}
