# One-command: convert DOCX -> TXT, then git add/commit/push
function xanthus {
    param(
        [string]$Message = "Auto: update Xanthus.txt $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    )

    $repo = "C:\Users\bdaum\OneDrive\Desktop\Xanthus"

    # Convert docx -> txt
    python "C:\Users\bdaum\OneDrive\Desktop\codes\docx_to_txt.py" `
           "$repo\Xanthus.docx" `
           "$repo\Xanthus.txt"

    # Commit & push only if there are changes
    $status = git -C $repo status --porcelain
    if (-not [string]::IsNullOrWhiteSpace($status)) {
        git -C $repo add .
        git -C $repo commit -m $Message
        git -C $repo push
        Write-Host "Pushed to GitHub: $Message"
    } else {
        Write-Host "No changes to commit. TXT already up to date."
    }
}

# Optional wrapper so you can call: update-xanthus "your message"
function update-xanthus($msg) {
    xanthus $msg
}
