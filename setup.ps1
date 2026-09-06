# Lien ket moi skill trong thu muc nay vao ~/.claude/skills/ de agent tu nhan.
# Chay lai bao nhieu lan cung an toan. Skill nao ban da tu viet trung ten thi
# script bo qua va bao ro, khong ghi de.
#
# Dung Junction nen khong can quyen quan tri.

$ErrorActionPreference = 'Stop'

$goc = Split-Path -Parent $MyInvocation.MyCommand.Path
$dich = Join-Path $env:USERPROFILE '.claude\skills'

if (-not (Test-Path $dich)) {
  New-Item -ItemType Directory -Path $dich -Force | Out-Null
}

$daLink = 0

foreach ($thuMuc in Get-ChildItem -Path $goc -Directory) {
  $tep = Join-Path $thuMuc.FullName 'SKILL.md'
  if (-not (Test-Path $tep)) { continue }

  $ten = $thuMuc.Name
  $duong = Join-Path $dich $ten

  if (Test-Path $duong) {
    $muc = Get-Item $duong -Force
    if (-not $muc.LinkType) {
      Write-Host "bo qua $ten : $duong da ton tai va khong phai lien ket"
      continue
    }
    Remove-Item $duong -Force -Recurse -Confirm:$false
  }

  New-Item -ItemType Junction -Path $duong -Target $thuMuc.FullName | Out-Null
  Write-Host "da lien ket $ten"
  $daLink++
}

Write-Host ""
Write-Host "Xong, $daLink skill. Mo mot phien agent moi de no nhan skill."
Write-Host "Kiem tra: hoi agent 'toi sap nghien cuu mot thi truong, co luat nao phai theo khong'"
