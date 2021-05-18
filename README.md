<div align="center">
  <img src="https://raw.githubusercontent.com/greta-code-pizza/hipsters/staging/.wiki/hispters-logo.png" width='200' alt='Logo Hipsters'>
</div>

<br/>
<div align="center">
  <a href='https://codeclimate.com/github/greta-code-pizza/hipsters/maintainability'>
    <img src="https://api.codeclimate.com/v1/badges/9d0328e288fcf5afb83e/maintainability" alt='Current version'>
  </a>
  <a href='https://app.circleci.com/pipelines/github/greta-code-pizza'>
    <img src="https://img.shields.io/circleci/build/github/greta-code-pizza/hipsters/staging" alt='Current version'>
  </a>
</div>


## Hipsters

Hipsters a pour objectif d'offrir aux stagiaires et aux équipes pédagogiques du pôle numérique du GRETA de Vannes un système de veille partagée. 

Ce projet est un fork du site [Lobsters](https://lobste.rs/) qui sera adapté aux problématiques du GRETA.

## Installation

Étapes à suivre :

1. Installer la version de ruby spécifié dans le fichier [.ruby-version](https://github.com/greta-code-pizza/hipsters/blob/staging/.ruby-version)

2. Cloner le dépôt github et se déplacer dans le dossier associé

```sh
$ git clone https://github.com/greta-code-pizza/hipsters.git
$ cd hipsters
```

3. Installer Nodejs en fonction de votre OS

```sh
Fedora: sudo yum install nodejs
Ubuntu: sudo apt-get install nodejs
OSX: brew install nodejs
```

4. Installer le projet et ses dépendances

```sh
$ bundle
```

5. Configurer les variables d'environnement

- Créer un fichier .env à la racine du projet
- Copier le contenu de .env.example dedans
- Éditer pour adapter à votre base de donnée mysql

6. Créer et charger votre base de donnée

```sh
$ rails db:create
$ rails db:schema:load
$ rails db:seed
```

7. (facultatif) vous pouvez charger un jeu de donnée de test avec la commande suivante

```sh
$ rails fake_data
```

8. Lancer le serveur d'application

```sh
$ rails server
```

Vous pouvez ouvrir l'application sur l'url `http://localhost:3000`

