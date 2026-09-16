# Use a slim Python image as the base
FROM python:3.11-slim

# Install the required runtime dependency for ONNX
RUN apt-get update && \
    apt-get install -y --no-install-recommends libgomp1 && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user for security
RUN groupadd -r magika && useradd -r -g magika magika

# Set the working directory and change its ownership
WORKDIR /workspace
RUN chown magika:magika /workspace

# Switch to the non-root user
USER magika

# Install the Magika CLI from PyPI
RUN pip install --no-cache-dir magika

# Set the entrypoint to the Magika command-line tool
ENTRYPOINT ["magika"]
