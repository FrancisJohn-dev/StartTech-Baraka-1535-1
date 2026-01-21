FROM golang:1.21-alpine AS builder

ARG REDIS_URL
ARG MONGODB_URI
ARG PORT

ENV REDIS_URL=$REDIS_URL
ENV MONGODB_URI=$MONGODB_URI
ENV PORT=$PORT

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o main .

FROM alpine:latest

RUN apk --no-cache add ca-certificates
WORKDIR /root/

COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]