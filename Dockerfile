# Utilisation de l'image Python de base
FROM python:3.9-slim

# Mise à jour des paquets et installation des dépendances pour MySQL
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .

EXPOSE 5000

ENTRYPOINT ["python3", "main.py"]
