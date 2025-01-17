DROP DATABASE IF EXISTS exposition;
CREATE DATABASE exposition;
USE exposition;

CREATE TABLE auteurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL
);

CREATE TABLE oeuvres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    date_acquisition DATE NOT NULL,
    numero_catalogue VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE oeuvres_auteurs (
    oeuvre_id INT NOT NULL,
    auteur_id INT NOT NULL,
    PRIMARY KEY (oeuvre_id, auteur_id),
    FOREIGN KEY (oeuvre_id) REFERENCES oeuvres(id) ON DELETE CASCADE,
    FOREIGN KEY (auteur_id) REFERENCES auteurs(id) ON DELETE CASCADE
);

CREATE TABLE salles (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    nombre_oeuvres INT NOT NULL,
    type_eclairage VARCHAR(255) NOT NULL
);

CREATE TABLE expositions_temporaires (
    id INT AUTO_INCREMENT PRIMARY KEY,
    debut DATE NOT NULL,
    duree INT NOT NULL 
);

CREATE TABLE emplacement_oeuvres (
    oeuvre_id INT NOT NULL,
    salle_numero INT NULL,
    exposition_id INT NULL,
    PRIMARY KEY (oeuvre_id),
    FOREIGN KEY (oeuvre_id) REFERENCES oeuvres(id) ON DELETE CASCADE,
    FOREIGN KEY (salle_numero) REFERENCES salles(numero) ON DELETE SET NULL,
    FOREIGN KEY (exposition_id) REFERENCES expositions_temporaires(id) ON DELETE SET NULL
);

CREATE TABLE particuliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(10),
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    adresse TEXT NOT NULL
);


CREATE TABLE emprunts (
    oeuvre_id INT NOT NULL,
    particulier_id INT NOT NULL,
    date_debut DATE NOT NULL,
    duree INT NOT NULL, 
    PRIMARY KEY (oeuvre_id),
    FOREIGN KEY (oeuvre_id) REFERENCES oeuvres(id) ON DELETE CASCADE,
    FOREIGN KEY (particulier_id) REFERENCES particuliers(id) ON DELETE CASCADE
);

CREATE TABLE assurances (
    id INT AUTO_INCREMENT PRIMARY KEY,
    oeuvre_id INT NOT NULL,
    montant_prime DECIMAL(10,2) NOT NULL,
    valeur_assuree DECIMAL(10,2) NOT NULL,
    compagnie_nom VARCHAR(255) NOT NULL,
    compagnie_adresse TEXT NOT NULL,
    FOREIGN KEY (oeuvre_id) REFERENCES oeuvres(id) ON DELETE CASCADE
);


CREATE TABLE types_oeuvres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE particuliers_types_oeuvres (
    particulier_id INT NOT NULL,
    type_oeuvre_id INT NOT NULL,
    PRIMARY KEY (particulier_id, type_oeuvre_id),
    FOREIGN KEY (particulier_id) REFERENCES particuliers(id) ON DELETE CASCADE,
    FOREIGN KEY (type_oeuvre_id) REFERENCES types_oeuvres(id) ON DELETE CASCADE
);
