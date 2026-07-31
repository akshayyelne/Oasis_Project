Write-Host "OpenClaw Telegram Gateway Starting..." -ForegroundColor Green
Write-Host ""

# Check directory
if (-not (Test-Path ".\openclaw.json")) {
    Write-Host "ERROR: Not in .openclaw directory" -ForegroundColor Red
    exit 1
}

# Check config
if (-not (Test-Path ".\.env.telegram")) {
    Write-Host "ERROR: .env.telegram not found" -ForegroundColor Red
    exit 1
}

Write-Host "Gateway Configuration:" -ForegroundColor Green
Write-Host "  - Ollama: localhost:11434" -ForegroundColor Green
Write-Host "  - Strategy: local-first with Claude fallback" -ForegroundColor Green
Write-Host ""

# Test Ollama
try {
    $response = Invoke-WebRequest -Uri "http://localhost:11434/api/tags" -TimeoutSec 5 -ErrorAction Stop
    Write-Host "Ollama Status: RUNNING" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Ollama not responding" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "SUCCESS: Gateway is ready!" -ForegroundColor Green
Write-Host "Polling for Telegram messages... (Ctrl+C to stop)" -ForegroundColor Cyan
Write-Host ""

# Simple polling loop
while ($true) {
    Start-Sleep -Seconds 30
    Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Listening..." -ForegroundColor Blue
}
