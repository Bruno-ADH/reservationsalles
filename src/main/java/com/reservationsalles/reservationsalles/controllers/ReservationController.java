package com.reservationsalles.reservationsalles.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reservationsalles.reservationsalles.models.Reservation;
import com.reservationsalles.reservationsalles.services.ReservationService;
import com.reservationsalles.reservationsalles.services.SalleService;
import com.reservationsalles.reservationsalles.services.UtilisateurService;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private UtilisateurService utilisateurService;

    @Autowired
    private SalleService salleService;

    @GetMapping("/liste")
    public String liste(ModelMap model) {
        model.addAttribute("reservations", reservationService.getAllReservations());
        return "reservations/liste";
    }

    @GetMapping("/nouveau")
    public String nouveau(ModelMap model) {
        model.addAttribute("reservation", new Reservation());
        model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
        model.addAttribute("salles", salleService.getAllSalles());
        return "reservations/formulaire";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Reservation reservation,
                       @RequestParam("utilisateurId") Long utilisateurId,
                       @RequestParam("salleId") Long salleId) {
        utilisateurService.getUtilisateurById(utilisateurId).ifPresent(reservation::setUtilisateur);
        salleService.getSalleById(salleId).ifPresent(reservation::setSalle);
        reservationService.saveReservation(reservation);
        return "redirect:/reservations/liste";
    }

    @GetMapping("/modifier/{id}")
    public String modifier(@PathVariable Long id, ModelMap model) {
        Optional<Reservation> reservation = reservationService.getReservationById(id);
        if (reservation.isPresent()) {
            model.addAttribute("reservation", reservation.get());
            model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
            model.addAttribute("salles", salleService.getAllSalles());
            return "reservations/formulaire";
        }
        return "redirect:/reservations/liste";
    }

    @GetMapping("/supprimer/{id}")
    public String supprimer(@PathVariable Long id) {
        reservationService.deleteReservation(id);
        return "redirect:/reservations/liste";
    }
}
