package com.chukuobody.app.domain;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class SelectedCards {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne
	private User user;
	
	@ManyToOne
	private ProductCard card;
	
	private Integer gram;
	private String mealTime;
	private LocalDate localDate;
	
	public SelectedCards() {
		
	}
	
	public SelectedCards(User user, ProductCard card, Integer gram, String mealTime, LocalDate localDate) {
		this.user = user;
		this.card = card;
		this.gram = gram;
		this.mealTime = mealTime;
		this.localDate = localDate;
	}
	
	@Override
	public String toString() {
		return this.user+" "+this.card+" "+this.gram+" "+this.mealTime+" "+this.localDate;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public ProductCard getCard() {
		return card;
	}
	public void setCard(ProductCard card) {
		this.card = card;
	}
	public Integer getGram() {
		return gram;
	}
	public void setGram(Integer gram) {
		this.gram = gram;
	}
	public String getMealTime() {
		return mealTime;
	}
	public void setMealTime(String mealTime) {
		this.mealTime = mealTime;
	}
	public LocalDate getLocalDate() {
		return localDate;
	}
	public void setLocalDate(LocalDate localDate) {
		this.localDate = localDate;
	}
}
