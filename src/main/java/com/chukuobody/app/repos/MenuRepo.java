package com.chukuobody.app.repos;

import java.time.LocalDate;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chukuobody.app.domain.SelectedCards;

public interface MenuRepo extends JpaRepository<SelectedCards, Long> {

	Iterable<SelectedCards> findByUserIdAndLocalDate(Long id, LocalDate localDate);

}
