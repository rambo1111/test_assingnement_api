# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y python3-fontforge libfontforge-dev libspiro-dev libuninameslist-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install fastapi numpy opencv-python pillow potrace uvicorn

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Command to run the FastAPI application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]