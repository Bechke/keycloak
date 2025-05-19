FROM keycloak/keycloak:latest

# Set working directory
WORKDIR /opt/keycloak

# Enable production mode and enable health checks
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_LOG_LEVEL=info

# Use a production DB (PostgreSQL here)
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d0lei8ruibrs73a8dsf0-a.oregon-postgres.render.com:5432/auth_db_gtww
ENV KC_DB_USERNAME=root
ENV KC_DB_PASSWORD=cGqA4k2Rfu0WuYRqmPIcRRaiiTBttf96

# Admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Start Keycloak in production mode
ENTRYPOINT ["bin/kc.sh", "start", "--http-enabled=true", "--hostname-strict=false"]

EXPOSE 8080
