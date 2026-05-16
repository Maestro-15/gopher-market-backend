# gopher-market-backend

Gradle multi-module backend for Gopher Market.

## Requirements

- Java 21
- Git

Gradle is run through the included wrapper, so a separate Gradle install is not required.

## Build

```powershell
.\gradlew.bat build
```

## Run A Service

```powershell
.\gradlew.bat :auth-service:bootRun
```

Auth service runs on:

```text
http://localhost:8081
```

Health check:

```text
http://localhost:8081/health
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
