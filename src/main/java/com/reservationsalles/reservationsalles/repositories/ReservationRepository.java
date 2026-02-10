package com.reservationsalles.reservationsalles.repositories;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.reservationsalles.reservationsalles.models.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    @Query("SELECT r FROM Reservation r WHERE r.salle.id = :salleId AND r.dateReservation = :date AND r.heureDebut < :heureFin AND r.heureFin > :heureDebut")
    List<Reservation> findChevauchements(@Param("salleId") Long salleId,
                                         @Param("date") LocalDate date,
                                         @Param("heureDebut") LocalTime heureDebut,
                                         @Param("heureFin") LocalTime heureFin);
}
