FROM keycloak/keycloak:latest

# Set working directory
WORKDIR /opt/keycloak

# Enable production mode and enable health checks
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_LOG_LEVEL=info
ENV KC_CACHE=local

# Use a production DB (PostgreSQL here)
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d0lei8ruibrs73a8dsf0-a.oregon-postgres.render.com:5432/auth_db_gtww
ENV KC_DB_USERNAME=root
ENV KC_DB_PASSWORD=cGqA4k2Rfu0WuYRqmPIcRRaiiTBttf96


# Admin credentials
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

EXPOSE 8080

# Start Keycloak in production mode
ENTRYPOINT ["bin/kc.sh", "start", "--http-enabled=true", "--hostname-strict=false", "--http-port=8080", "--http-host=0.0.0.0", "--cache=local"]

