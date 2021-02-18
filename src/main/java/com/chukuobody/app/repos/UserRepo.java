package com.chukuobody.app.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chukuobody.app.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByActivationCode(String code);
}
