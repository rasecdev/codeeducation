FROM golang:1.17-alpine3.15 As builder

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

CMD [ "/app/main" ]




