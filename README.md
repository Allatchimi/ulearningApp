#  ulearning_app

ulearning app  project.

# 2. Texte en Gras et Italique
 
   **Ceci est en gras**
   *Ceci est en italique*
# 3. Listes
- Élément 1
- Élément 2
1. Élément 1
2. Élément 2

# 4. Liens : Pour insérer un lien, utilisez la syntaxe [texte](URL).
[GitHub](https://github.com)
# mages : Utilisez ![texte alternatif](URL_de_l'image) pour insérer une image.
![Logo](https://example.com/logo.png)

---
# Pour insérer du code, utilisez trois backticks ``` pour les blocs de code, ou des simples backticks ` pour du code en ligne.
## Installation
1. a.gitignore

   ```
      /assets/images/*.png
   ```
2. Commande git :si le dossier ou les fichiers ont déjà été suivis par Git, tu devras les supprimer de l'index Git sans les supprimer localement.

   ```bash

   git rm -r --cached assets/

    ```
   3. Puis, fais un commit pour appliquer les changements :

       ```
      git commit -m "Ignore assets folder"

      ```

   Si vous préférez réappliquer vos commits locaux sur les commits distants, vous pouvez configurer Git pour effectuer un rebase. 
   ```
   git config pull.rebase true

   ```
   Ou pour que ce soit valable pour tous les dépôts :
      ```
   git config --global pull.rebase true

   ```
   Et aprés:  
   ```
   git pull
   ```

3. Fast-forward seulement :

Si vous voulez uniquement récupérer les commits distants si votre branche locale peut être avancée sans conflits (c’est-à-dire un “fast-forward”), vous pouvez utiliser cette option.
•	Commandes pour configurer Git pour faire uniquement des “fast-forward” :

   ```
   git config pull.ff only
   ```
Après avoir configuré Git pour faire un fast-forward, vous pouvez essayer à nouveau :

   ```
   git pull
   ```

4. Pour résoudre le problème du gestionnaire de crédentiel :
   Si vous avez des problèmes avec le gestionnaire de crédentiel (git: 'credential-manager-core' is not a git command), vous pouvez essayer de configurer Git pour utiliser un autre gestionnaire de crédentiel, comme osxkeychain sur macOS :
   ```
git config --global credential.helper osxkeychain
   ```
5. 


# Titre principal


## Sous-titre

### Sous-sous-titre





