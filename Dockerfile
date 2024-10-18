FROM python:3.12
RUN mkdir /app
WORKDIR /app
RUN apt-get -y update && \
    apt-get install -y libsndfile1 libgl1-mesa-glx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip install -r requirements.txt

ENTRYPOINT ["python", "inference.py"]
