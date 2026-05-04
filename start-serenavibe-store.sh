#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NETWORK_NAME="${SERENAVIBE_PROXY_NETWORK:-goldeplaca_proxy}"

if docker compose version >/dev/null 2>&1; then
  COMPOSE=(docker compose)
elif command -v docker-compose >/dev/null 2>&1; then
  COMPOSE=(docker-compose)
else
  echo "docker compose nao encontrado. Instale o plugin Docker Compose ou docker-compose." >&2
  exit 1
fi

if ! docker network inspect "$NETWORK_NAME" >/dev/null 2>&1; then
  echo "Rede Docker '$NETWORK_NAME' nao encontrada." >&2
  echo "Suba o compose principal primeiro para criar a rede: docker compose up -d nginx" >&2
  exit 1
fi

cd "$PROJECT_DIR"
"${COMPOSE[@]}" up -d wordpress
