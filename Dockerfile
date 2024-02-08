# Using python:3.10-bookworm as the base image
FROM python:3.10-bookworm

# Set the working directory inside the container to /prod
WORKDIR /prod

# Copy only the requirements.txt file to /tmp/ in the container
COPY requirements.txt /tmp/requirements.txt

# Install the Python dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copy the data directory and the fast_api application code into the container
COPY data data
COPY fast_api fast_api

# Set the PORT environment variable (default to 8000 if not provided)
ENV PORT=8000

# Expose the port the app runs on
EXPOSE $PORT

# Define the command to run the FastAPI application
CMD uvicorn fast_api.fast:app --host 0.0.0.0 --port $PORT
