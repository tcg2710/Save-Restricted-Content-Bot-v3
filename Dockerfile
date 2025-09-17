FROM python:3.10-slim

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt-get install -y git curl python3-pip ffmpeg wget bash neofetch software-properties-common

# Set working directory
WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip3 install wheel
RUN pip3 install --no-cache-dir -U -r requirements.txt

# Copy all project files
COPY . .

# Expose port for Flask
EXPOSE 5000

# Start both Flask and main.py properly
CMD ["sh", "-c", "flask run --host=0.0.0.0 --port=5000 & python3 main.py"]
