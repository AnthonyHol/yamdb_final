FROM python:3.7-slim

WORKDIR /web

COPY requirements.txt .
RUN pip3 install -r ./requirements.txt --no-cache-dir

COPY . .

EXPOSE 8000

CMD ["sh", "start.sh"]
