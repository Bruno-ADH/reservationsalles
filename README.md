# ReservaSalles

Plateforme web de reservation de salles de fete, realisee avec Spring Boot et PostgreSQL.

<!-- ## Membres du binome

- [Nom Prenom 1]
- [Nom Prenom 2] -->

## Fonctionnalites

- Gestion des salles (ajout, modification, suppression, consultation)
- Gestion des utilisateurs (ajout, modification, suppression, consultation)
- Gestion des reservations avec controle de chevauchement horaire
- Interface responsive (desktop + mobile)

## Prerequis

- Java 21
- PostgreSQL (via pgAdmin ou en ligne de commande)

## Installation et lancement

1. Creer la base de donnees `reservation_salles` dans pgAdmin :
   - Clic droit sur Databases > Create > Database
   - Nom : `reservation_salles`

2. Verifier les identifiants PostgreSQL dans `src/main/resources/application.properties` :
   ```
   spring.datasource.username=postgres
   spring.datasource.password=root
   ```
   Modifier si vos identifiants sont differents.

3. Lancer l'application :
   ```bash
   cd reservationsalles
   mvnw spring-boot:run
   ```

4. Ouvrir dans le navigateur : `http://localhost:8081`

Les tables sont creees automatiquement au premier demarrage.

## Technologies

- Spring Boot 4.0.2
- Spring Data JPA / Hibernate
- PostgreSQL
- JSP + JSTL
- Tailwind CSS
- Font Awesome
