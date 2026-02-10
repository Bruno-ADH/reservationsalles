package com.reservationsalles.reservationsalles.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservationsalles.reservationsalles.models.Reservation;
import com.reservationsalles.reservationsalles.repositories.ReservationRepository;

@Service
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;

    public List<Reservation> getAllReservations() {
        return reservationRepository.findAll();
    }

    public Optional<Reservation> getReservationById(Long id) {
        return reservationRepository.findById(id);
    }

    public boolean existeChevauchement(Reservation reservation) {
        List<Reservation> conflits = reservationRepository.findChevauchements(
                reservation.getSalle().getId(),
                reservation.getDateReservation(),
                reservation.getHeureDebut(),
                reservation.getHeureFin());

        // En cas de modification, on exclut la reservation elle-meme
        if (reservation.getId() != null) {
            conflits.removeIf(r -> r.getId().equals(reservation.getId()));
        }

        return !conflits.isEmpty();
    }

    public Reservation saveReservation(Reservation reservation) {
        return reservationRepository.save(reservation);
    }

    public void deleteReservation(Long id) {
        reservationRepository.deleteById(id);
    }
}
