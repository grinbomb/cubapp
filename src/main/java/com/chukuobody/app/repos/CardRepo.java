package com.chukuobody.app.repos;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chukuobody.app.domain.ProductCard;

public interface CardRepo extends JpaRepository<ProductCard, Long> {
	Iterable<ProductCard> 	findByProductCategory(String productCategory);
	Optional<ProductCard>				findById(Long id);
}
