Invoke-Expression (&starship init powershell)
Clear-Host

function Get-FolderSize {
    param([string]$Path = ".")
    $size = (Get-ChildItem -Path $Path -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
    "{0:N2} GB" -f ($size / 1GB)
}
Set-Alias -Name du -Value Get-FolderSize

# # PS> "C:\Windows\System32".Parent
# # C:\Windows
Update-TypeData -TypeName System.String -MemberName Parent -MemberType ScriptProperty -Value {
    if (Test-Path $this) {
        Split-Path $this -Parent
    }
}
