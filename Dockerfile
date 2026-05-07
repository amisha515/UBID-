FROM python:3.10-slim

WORKDIR /app

# Copy everything first — setuptools needs src/ present to build the package
COPY . .

# Install dependencies directly from pyproject.toml without building a wheel
# --no-build-isolation lets pip skip the wheel build and install deps directly
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
        pandas \
        numpy \
        streamlit \
        rapidfuzz \
        jellyfish \
        networkx \
        scikit-learn \
        sqlalchemy \
        psycopg2-binary \
        python-dotenv \
        fastapi \
        "uvicorn[standard]"

ENV PYTHONPATH=/app/src

CMD ["streamlit", "run", "apps/dashboard.py", "--server.address=0.0.0.0", "--server.port=$PORT"]
