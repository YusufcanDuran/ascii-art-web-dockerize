# Go programı için Dockerfile

# Base image olarak Golang resmi imajını kullan
FROM golang:latest

LABEL maintainer="Sude Naz Demir"
LABEL maintainer="Yusufcan Duran"
LABEL version="1.0"
LABEL description="Bu Docker imajı, basit bir ascii sanatı yapan web sunucusu çalıştırır."
LABEL vendor="Uniworkhub"

# Uygulama dosyalarını Docker imajına ekle
COPY main.go /app/main.go
COPY standard.txt /app/standard.txt
COPY shadow.txt /app/shadow.txt
COPY thinkertoy.txt /app/thinkertoy.txt
COPY argument.go /app/argument/argument.go
COPY go.mod /app/go.mod
COPY templates/index.html /app/templates/index.html

# Çalışma dizinini belirle
WORKDIR /app

# Gerekli bağımlılıkları yükle
RUN go mod download

# Uygulamayı derle
RUN go build -o main

# Uygulamayı çalıştır
CMD ["./main"]
