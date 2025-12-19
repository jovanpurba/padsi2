#!/usr/bin/env bash
set -e

PORT="${1:-3000}"

echo "== Running project =="
command -v node >/dev/null 2>&1 || { echo "Node.js not found. Install Node.js 18+"; exit 1; }

echo "Node: $(node -v)"
echo "NPM : $(npm -v)"

if [ ! -f ".env" ]; then
  echo "Missing .env. Creating from .env.example ..."
  cp .env.example .env
  echo "Please edit .env and fill DATABASE_URL (and JWT_SECRET), then rerun."
  exit 1
fi

if [ ! -d "node_modules" ]; then
  echo "Installing dependencies..."
  npm install
fi

echo "Generating Prisma client..."
npx prisma generate

echo "Starting Next.js dev server on http://localhost:${PORT}"
PORT="$PORT" npm run dev
