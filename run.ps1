param(
  [int]$Port = 3000
)

Write-Host "== Running project =="

# 1) Check Node
$node = (Get-Command node -ErrorAction SilentlyContinue)
if (-not $node) {
  Write-Error "Node.js not found. Install Node.js 18+ then rerun."
  exit 1
}

Write-Host ("Node: " + (node -v))
Write-Host ("NPM : " + (npm -v))

# 2) Ensure .env exists
if (-not (Test-Path ".env")) {
  Write-Host "Missing .env. Creating from .env.example ..."
  Copy-Item ".env.example" ".env"
  Write-Warning "Please edit .env and fill DATABASE_URL (and JWT_SECRET) then rerun."
  exit 1
}

# 3) Install deps
if (-not (Test-Path "node_modules")) {
  Write-Host "Installing dependencies..."
  npm install
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

# 4) Prisma generate
Write-Host "Generating Prisma client..."
npx prisma generate
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

# 5) Start dev server
Write-Host ("Starting Next.js dev server on http://localhost:" + $Port)
$env:PORT = "$Port"
npm run dev
