FROM python:3.11-slim
WORKDIR /app
 
RUN apt-get update \
    && apt-get install -y nano 
 
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
 
EXPOSE 5000
HEALTHCHECK --interval=5s --timeout=3s --retries=5 CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:5000/health')"
CMD ["python", "app.py"]
