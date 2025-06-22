# Config terminal for windows

## 1. Tải những thứ cần thiết:

[scoop](https://scoop.sh/)

Terminal ở microsoft store

[Powershell](https://github.com/PowerShell/PowerShell/releases)

## 2. Config powershell

Sau khi tải những thứ trên

Dùng scoop để tải oh-my-posh

```sh
scoop install oh-my-posh
```
Mở thử mục file tải oh-my-posh

Vd: C:\Users\lolme\scoop\apps\oh-my-posh

Tạo file theme.omp.json

Bạn lên trang chủ của [oh-my-posh](https://ohmyposh.dev/docs/themes) để chọn theme rồi copy vào file theme.omp.json đã tạo rồi lưu

Tạo file cài đặt cho powershell mở terminal lên
```sh
notepad $PROFILE
```
Đường dẫn cài file cài đặt powershell sau khi tạo

Vd: C:\Users\lolme\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

Mở lên copy bộ cài ở [Microsoft.PowerShell_profile.ps1](https://github.com/mihkhoi/dotfiles/blob/master/terminal/Microsoft.PowerShell_profile.ps1)

## 3. Tải các icon và lịch sử cho powershell
```sh
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
```
```sh
Import-Module Terminal-Icons
```
```sh
Install-Module -Name  PSReadline -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
```
```sh
Set-PSReadlineOption -PredictionViewStyle ListView
```
[Tham khảo](https://www.youtube.com/watch?v=fviSilPKIhs&list=WL&index=5&t=439s)
