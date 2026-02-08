package com.reservationsalles.reservationsalles.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.reservationsalles.reservationsalles.models.Utilisateur;

public interface UtilisateurRepository extends JpaRepository<Utilisateur, Long> {
}
