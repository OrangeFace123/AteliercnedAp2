###Script Power Shell


$UsersFilePath = "C:\Users\Administrator\Documents\AD\group.csv"

import-csv -path $UsersFilePath | foreach {

$Name = ($_.name)
$Path = ($_.path)
$Scope = ($_.scope)

#Creer le groupe

New-ADGroup -GroupScope $Scope -Name $Name -GroupCategory Security -Path $Path


Write-Host "Group Created: $Name"
}