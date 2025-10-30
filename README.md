# Apprentissage COBOL

Ce répertoire contient mes fichiers COBOL provenant de mon apprentissage de ce language. Je décrit aussi le processus d'apprentissage avec les logiciels que j'utilise et les ressources que je consulte.

## Logiciels utilisés
L'installation des logiciels suivants a été effectuée sur Windows 10 (PC de bureau) ainsi que sur Ubuntu/Pop!_OS (Laptop d'école). Les processus d'installation sont donc adaptés pour chaque système d'exploitation.

### Visual Studio Code
Un logiciel versatile et simple d'utilisation, savoir qu'une compatibilité avec COBOL était disponible a grandement simplifié le processus.
#### Extensions utilisées:
- IBM Z® Open Editor
    - Extension officielle d'IBM
    - Permet une connexion directe avec un mainframe d'IBM
    - Fourni un éditeur de code COBOL complet
- Zowe Explorer
    -Permet de répliquer le système d'organisation des fichiers d'un mainframe IBM
- COBOL Themes
    - Thème *Throwback (ISPF Inspired)* utilisé
 
#### Installation
Windows et Linux: Instructions fournies à <https://code.visualstudio.com/>

### GnuCOBOL
Manque d'accès à un vrai mainframe IBM, ce logiciel permet de compiler en C et d'exécuter du code COBOL sans utilisation de JCL. Une fois installé, il peut être utilisé directement du terminal Linux ou du terminal Visual Studio Code.

#### Installation
Windows: Un fichier exécutable .msi est fourni par le développeur à <https://gnucobol.sourceforge.io/>.

Linux: `sudo apt install gnucobol3 && cobc -v`

## Compilation et exécution des fichiers
Deux techniques différentes s'offraient à moi pour la compilation & exécution des fichiers COBOL:

### Configuration d'une *build task*
Cette technique prend utilisation d'un fichier **tasks.json** dans le répertoire du projet pour automatiquement compiler et exécuter le fichier COBOL dans lequel l'éditeur VS Code est actif. Toutefois, j'ai eu de la difficulté à la configurer selon mes préférences.

### Directement dans le terminal
Dans le terminal Linux ou VS Code, la commande `cobc -x <path_du_fichier_COBOL> -o <path_du_fichier_executable_a_creer>` permet d'uniquement compiler le programme. Ceci est très pratique si nous ne voulons que vérifier qu'aucun *compile-time error* n'est survenue sans forcément démarrer une exécution. Ceci me permet de facilement choisir les chemins d'accès des fichiers sources et exécutables, ce que je n'ai pas encore réussi à faire avec la première technique.

#### Voici un exemple:
Soit le répertoire courant **COBOL-Learning**, à l'écriture de cette section:
```bash
├── COBOL
│   ├── INTERET.cbl
│   ├── TAXES.cbl
├── EXECUTABLE
├── README.md
└── .gitignore
```

Pour compiler le fichier **INTERET.cbl** à partir du répertoire courant **COBOL-Learning**, il me suffit d'exécuter cette commande:
`cobc -x ./COBOL/INTERET.cbl -o ./EXECUTABLE/INTERET-EXEC.exe`

Ceci créera un fichier exécutable **INTERET-EXEC.exe**. Le répertoire devrait maintenant ressembler à ceci:
```bash
├── COBOL
│   ├── INTERET.cbl
│   ├── TAXES.cbl
├── EXECUTABLE
│   ├── INTERET-EXEC.exe
├── README.md
└── .gitignore
```

Ensuite, le fichier nouvellement construit peut être exécuté directement dans le terminal comme ceci:
`./EXECUTABLE/INTERET-EXEC.exe`

#### Démonstration
Une démonstration de ce processus est disponible sur ma chaine YouTube: <https://youtu.be/ZQyL5lcUBXI?si=IHf-fkAaVUp_eu7o>

## Ressources principales utilisées

### Murach’s Mainframe COBOL (Mike Murach)
*Ajouter description*

### COBOL Software Modernization (Franck Barbier)
*Ajouter description*

### Mainframe: The Complete COBOL Course From Beginner to Expert
*Ajouter description*
