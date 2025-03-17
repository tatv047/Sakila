# Base image
FROM python:3.9.1

# Update package lists and install wget (needed to download the CSV file) without retaining a cache
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/* 

# psycopg2 is a postgres db adapter for python: sqlalchemy needs it
RUN pip install --no-cache-dir pandas sqlalchemy psycopg2

# Set working directory inside the container
WORKDIR /app

# Copy the python script to the container
COPY ingest_data.py . 

# Run the python script
ENTRYPOINT [ "python", "ingest_data.py" ]