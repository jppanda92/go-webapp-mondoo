# Stage 1: Build the Go binary
FROM golang:1.21-alpine as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go source code from the repository
COPY . /app

# Download dependencies and build the Go binary
RUN go mod tidy && go build -o mondoo-webapp .

# Stage 2: Create the final image
FROM alpine:latest

# Set the working directory in the final container
WORKDIR /root/

# Copy the built Go binary from the builder stage
COPY --from=builder /app/mondoo-webapp .

# Expose the port on which the Go app will run
EXPOSE 8080

# Command to run the Go web application
CMD ["./mondoo-webapp"]
