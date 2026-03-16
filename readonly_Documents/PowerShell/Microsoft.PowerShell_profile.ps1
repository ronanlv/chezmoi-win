Invoke-Expression (&starship init powershell)
Clear-Host

$env:PATH += "  C:\Program Files\Emacs\emacs-30.2\bin;"
$env:PATH += [Environment]::GetEnvironmentVariable("Path", "User") + ";" + [Environment]::GetEnvironmentVariable("Path", "Machine")

function Get-FolderSize {
    param([string]$Path = ".")
    $size = (Get-ChildItem -Path $Path -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
    "{0:N2} GB" -f ($size / 1GB)
}
Set-Alias -Name du -Value Get-FolderSize
