# Entrypoint for deployment platforms (Render, Railway, Heroku, etc.)
# The platform detects this file and uses it to start the server.
#
# Start command:  uvicorn main:app --host 0.0.0.0 --port $PORT
# Or add to pyproject.toml scripts section (see below).

from apps.api import app  # re-export the FastAPI app

__all__ = ["app"]
