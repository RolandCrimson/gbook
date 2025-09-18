package com.adacho.gbook.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.adacho.gbook.entity.GuestBook;

public interface GuestBookRepository extends JpaRepository<GuestBook, Integer>{

}
