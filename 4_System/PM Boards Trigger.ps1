# SIT Test Trigger for Webhook
# Target URL: https://every-maps-doubt.loca.lt/webhook/asana-tasks

$url = "https://manhunt-reacquire-boaster.ngrok-free.dev/webhook/asana-tasks"
$payload = @{
    task_id = "123456789"
    task_name = "System Integration Test Task"
    due_date = "2026-07-20"
    status = "Testing"
} | ConvertTo-Json

Invoke-RestMethod -Uri $url -Method Post -Body $payload -ContentType "application/json"
Write-Host "Test payload sent to $url"
