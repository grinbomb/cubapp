package com.chukuobody.app.repos;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chukuobody.app.domain.SelectedCards;

public interface MenuRepo extends JpaRepository<SelectedCards, Long> {

	List<SelectedCards> findByUserIdAndDate(Long id, Timestamp date);

}
