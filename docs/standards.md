# oxyta.net standards

1. Les données utiles des services (celles à sauvegarder…) vont dans des volumes bindés sur l’hôte, dans
   `$CHATONS_ROOT_DIR` (ou `/srv/chatons` à défaut). Cf. #54.
2. Les services sont disponibles sur le domaine `$CHATONS_DOMAIN` (ou `localhost` à défaut). Cf. #62.
3. Chaque service va dans un dossier à son nom sur ce dépôt git, qui est également la valeur par défaut de son
   sous-domaine et du nom du dossier pour les volumes dans `$CHATONS_ROOT_DIR`. le sous-domaine et le dossiers sont
   personnalisables avec la variable `$CHATONS_SERVICE`. Cf. #69.
4. Les services utilisent autant que possible des images légères (eg. basées sur alpine).
5. Les variables d’environnement qui ne sont pas sensées être modifiées vont dans la section `environment` du
   `docker-compose.yml`. Cf. #70.
6. Les autres variables d’environnement (surtout les mots de passes) vont dans un fichier `.env`, et sont données aux
   services qui en ont besoin via la section `env_file` du `docker-compose.yml`.
7. Les services de base de données sont autant que possible basées sur postgres, et se nomment `db`. Cf. #63.

Ces standards peuvent être rediscuttés, mais leur modification entraîne une incrémentation du numéro de version majeur.
