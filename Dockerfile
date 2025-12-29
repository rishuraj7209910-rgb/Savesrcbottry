FROM python:3.10-slim-bookworm

WORKDIR /app

# System dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git curl wget ffmpeg bash && \
    rm -rf /var/lib/apt/lists/*

# Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip wheel && \
    pip install --no-cache-dir -r requirements.txt

# App code
COPY . .

# Koyeb port
EXPOSE 5000

# Single main process (IMPORTANT)
CMD ["python", "-m", "devgagan"]
