DROP DATABASE IF EXISTS gcivil;
CREATE DATABASE gcivil;
USE gcivil;

CREATE TABLE produits (
    code INT AUTO_INCREMENT PRIMARY KEY,
    designation VARCHAR(255) NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL
);

CREATE TABLE fournisseurs (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    adresse TEXT NOT NULL
);

CREATE TABLE produits_fournisseurs (
    produit_code INT NOT NULL,
    fournisseur_numero INT NOT NULL,
    prix_achat DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (produit_code, fournisseur_numero),
    FOREIGN KEY (produit_code) REFERENCES produits(code) ON DELETE CASCADE,
    FOREIGN KEY (fournisseur_numero) REFERENCES fournisseurs(numero) ON DELETE CASCADE
);
