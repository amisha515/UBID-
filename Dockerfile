FROM python:3.10-slim

WORKDIR /app

# Copy dependency manifest first so Docker can cache the install layer
COPY pyproject.toml .

# Install the package and all dependencies declared in pyproject.toml
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir .

# Copy the rest of the source
COPY . .

ENV PYTHONPATH=/app/src

CMD ["streamlit", "run", "apps/dashboard.py", "--server.address=0.0.0.0", "--server.port=8601"]
