FROM python:3.8-slim

WORKDIR /app

RUN pip install --no-cache-dir jupyterlab

# Render will map its own $PORT to this
EXPOSE 8080  

# Shell form to expand $PORT from Render
CMD jupyter lab --ip=0.0.0.0 --port=${PORT} --no-browser --allow-root
