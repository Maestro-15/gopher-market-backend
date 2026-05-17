# gopher-market-backend

Gradle multi-module backend for Gopher Market.

## Prerequisites

- Java 21 (Temurin)
- Git
- Docker Desktop

Gradle is run through the included wrapper, so a separate Gradle install is not required.

## Getting Started

### 1. Start Infrastructure

```bash
docker compose up -d
```

This starts:

| Service    | URL / Port                              | Credentials          |
|------------|-----------------------------------------|----------------------|
| PostgreSQL | `localhost:5432` (DB: `gophermarket`)   | gopher / market123   |
| Redis      | `localhost:6379`                        | —                    |
| RabbitMQ   | `localhost:5672` (AMQP)                 | guest / guest        |
| RabbitMQ   | `http://localhost:15672` (Management)   | guest / guest        |
| MinIO      | `http://localhost:9000` (API)           | minioadmin / minioadmin |
| MinIO      | `http://localhost:9001` (Console)       | minioadmin / minioadmin |

### 2. Verify Infrastructure

```bash
# Postgres — should list all schemas
docker exec gm-postgres psql -U gopher -d gophermarket -c "\dn"

# Redis — should return PONG
docker exec gm-redis redis-cli ping

# RabbitMQ — should return running
docker exec gm-rabbitmq rabbitmq-diagnostics -q ping
```

### 3. Build

```bash
./gradlew build
```

### 4. Run a Service

```bash
./gradlew :auth-service:bootRun
```

Auth service runs on `http://localhost:8081`.

### 5. Run All Services

```bash
./gradlew bootRun --parallel
```

Verify the gateway:

```bash
curl http://localhost:8080/actuator/health
```

### Stopping Infrastructure

```bash
docker compose down        # Stop containers (data persists)
docker compose down -v     # Stop containers and delete volumes
```

## Modules

- `common`
- `api-gateway`
- `auth-service`
- `user-service`
- `product-service`
- `housing-service`
- `cart-service`
- `wishlist-service`
- `messaging-service`
- `request-service`
- `notification-service`
- `image-service`
