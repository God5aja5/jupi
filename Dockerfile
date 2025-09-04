FROM python:3.8-slim

WORKDIR /app

RUN pip install --no-cache-dir jupyterlab notebook

EXPOSE 8080

ENV JUPYTER_PASSWORD_HASH="sha1:3c9bbf2f0bbd:2d9ccfbcbfdbfbb64e4ea1b38f1a5a5953b91f15"

CMD jupyter lab --ip=0.0.0.0 --port=${PORT} --no-browser --allow-root --NotebookApp.password=${JUPYTER_PASSWORD_HASH} --NotebookApp.token=''
