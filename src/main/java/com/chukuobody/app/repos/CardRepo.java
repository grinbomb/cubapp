package com.chukuobody.app.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chukuobody.app.domain.ProductCard;

public interface CardRepo extends JpaRepository<ProductCard, Long> {
	Iterable<ProductCard> findByProductCategory(String productCategory);
}
