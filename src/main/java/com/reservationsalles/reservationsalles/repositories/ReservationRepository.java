package com.reservationsalles.reservationsalles.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.reservationsalles.reservationsalles.models.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
}
