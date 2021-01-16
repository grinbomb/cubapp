package domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ProductCard {
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private Integer id;

private String name;
private String mealTime;
private String productCategory;
private Double caloriesPG;
private Double proteinsPG;
private Double fatsPG;
private Double carbohydratesPG;

public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getMealTime() {
	return mealTime;
}
public void setMealTime(String mealTime) {
	this.mealTime = mealTime;
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

}
