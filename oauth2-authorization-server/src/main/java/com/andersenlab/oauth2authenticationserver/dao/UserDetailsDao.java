package com.andersenlab.oauth2authenticationserver.dao;

import com.andersenlab.oauth2authenticationserver.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserDetailsDao extends JpaRepository<User, Integer> {
}
