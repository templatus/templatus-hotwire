# syntax=docker/dockerfile:1
# check=error=true

ARG SKIP_BOOTSNAP_PRECOMPILE=true

FROM ghcr.io/ledermann/rails-base-builder:4.0.0-alpine AS builder

# Remove some files not needed in resulting image.
# Because they are required for building the image, they can't be added to .dockerignore
RUN rm -r package.json vite.config.mts tsconfig.json

FROM ghcr.io/ledermann/rails-base-final:4.0.0-alpine
LABEL maintainer="georg@ledermann.dev"

USER app

# Enable YJIT
ENV RUBY_YJIT_ENABLE=1

# Entrypoint prepares the database.
ENTRYPOINT ["docker/startup.sh"]

# Start the server by default, this can be overwritten at runtime
CMD ["./bin/rails", "server"]
