# oh-my-posh
oh-my-posh init pwsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/amro.omp.json | Invoke-Expression

# eza (replacing ls)
function ListDirectory()
{
    eza -x --icons
}
set-alias -name ls -value ListDirectory

# lazygit
set-alias -name lg -value lazygit

# zoxide (terminal jumper)
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })