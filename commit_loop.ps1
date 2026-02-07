# =========================
# НАСТРОЙКИ
# =========================
$RepoDir = "C:\Users\Vadim\Desktop\daily-activity10"
$File = "activity.txt"
$Branch = "main"
$DelaySeconds = 15

Set-Location $RepoDir

Write-Host "Commit loop started. Press Ctrl+C to stop." -ForegroundColor Green

# =========================
# БЕСКОНЕЧНЫЙ ЦИКЛ
# =========================
while ($true) {

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Реальное изменение файла
    Add-Content $File "Update at $timestamp"

    # Коммит
    git add $File
    git commit -m "activity update $timestamp"

    # Push
    git push origin $Branch

    Write-Host "Committed at $timestamp" -ForegroundColor Cyan

    Start-Sleep -Seconds $DelaySeconds
}
