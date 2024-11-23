# Base Image Setup
FROM python:3.11.1-slim@sha256:1591aa8c01b5b37ab31dbe5662c5bdcf40c2f1bce4ef1c1fd24802dae3d01052 as base

# Builder Stage for Dependency Installation
FROM base as builder

# Copy requirements.txt to leverage layer caching
COPY requirements.txt requirements.txt

# Install dependencies into /install directory
RUN pip install --prefix="/install" -r requirements.txt

# Final Runtime Image
FROM base

# Set the working directory for the app
WORKDIR /loadgen

# Copy the installed dependencies from the builder stage
COPY --from=builder /install /usr/local

# Add Locust test script
COPY locustfile.py .

# Enable gevent support for concurrency in Locust
ENV GEVENT_SUPPORT=True

# Expose Locust parameters to run in headless mode
# Default users is 10 if not set
ENTRYPOINT locust --host="http://${FRONTEND_ADDR}" --headless -u "${USERS:-10}" > /loadgen/locust.log 2>&1

