# Ollama i Open WebUI amb Docker Compose

Aquest repositori conté una configuració de **Docker Compose** per desplegar dos serveis principals: 

1. **Ollama**: Un servidor que gestiona models d'IA per a inferència.
2. **Open WebUI**: Una interfície web que permet interactuar amb models d'IA.

El repositori inclou fitxers necessaris per personalitzar el servidor Ollama amb un `Dockerfile` i un script d'entrada (`entrypoint.sh`).

---

## Contingut del repositori

### Arxius principals

- **`docker-compose.yml`**: Defineix la configuració dels serveis amb Docker Compose.
- **`Dockerfile`**: Utilitza la imatge base `ollama/ollama:latest` i personalitza l'entrada del contenidor amb un script personalitzat perquè així es poden carregar models.
- **`entrypoint.sh`**: Script d'inicialització per al contenidor d'Ollama. S'utilitza per carregar els models que es necessitin.
- **`README.md`**: Documentació del projecte.


## Descripció dels serveis

### 1. **Ollama**
Aquest servei llança un servidor Ollama per gestionar models d'IA. Inclou personalitzacions per assegurar que el servidor estigui actiu abans d'iniciar altres tasques.

- **Configuració destacada:**
  - `Dockerfile`: Personalitza la imatge base afegint un script d'inicialització.
  - `entrypoint.sh`: Executa el servidor, espera que estigui actiu, i descarrega models predeterminats.
  - **Volum**: `ollama-models:/usr/share/ollama/.ollama/models`  Els volumns s'utilitzen perquè les dades siguin persistents.

- **Models descarregats automàticament:**
  - Per defecte, el model `tinyllama` es carrega automàticament. Altres models es poden afegir descomentant línies a l'script `entrypoint.sh`.

### 2. **Open WebUI**
Aquest servei utilitza la imatge `ghcr.io/open-webui/open-webui:main` per oferir una interfície gràfica d'usuari (GUI) que permet interactuar amb els models d'IA.

- **Configuració destacada:**
  - **Port**: `3000` (host) redirigit al port `8080` (contenidor).
  - **Volum**: `open-webui:/app/backend/data`


## Instruccions per a l'ús

### Requisits previs
- Docker i Docker Compose instal·lats al sistema.

### Passos d'execució
1. Clona aquest repositori:
   ```bash
   git clone <URL del repositori>
   cd <nom_del_repositori>

2. Aixecar els contenidors
   ```bash
   docker compose up -d

3. Accedir al navegador localhost:3000