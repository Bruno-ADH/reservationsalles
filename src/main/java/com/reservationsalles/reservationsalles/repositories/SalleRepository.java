package com.reservationsalles.reservationsalles.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.reservationsalles.reservationsalles.models.Salle;

public interface SalleRepository extends JpaRepository<Salle, Long> {
}
