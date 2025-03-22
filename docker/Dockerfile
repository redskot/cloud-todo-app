# 1. Image de base
FROM python:3.10-slim

# 2. Répertoire de travail
WORKDIR /app

# 3. Copier le code source
COPY . .

# 4. Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# 5. Exposer le port Flask
EXPOSE 80

# 6. Commande pour lancer l'app
CMD ["python3", "todo_app.py"]
