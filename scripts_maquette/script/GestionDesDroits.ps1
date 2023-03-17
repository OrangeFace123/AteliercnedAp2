###Script Power Shell


$UsersFilePath = "C:\Users\Administrator\Documents\AD\group2.csv"

import-csv -path $UsersFilePath | foreach {

$Name = ($_.name)
$Path = ($_.path)
$Member = ($_.member)

#Creer le groupe

New-ADGroup -GroupScope DomainLocal -Name $Name -GroupCategory Security -Path $Path


Write-Host "Group Created: $Name"


#Creer le dossiers partages

New-Item "d:\partage1" -ItemType Directory
New-SMBShare -Name partage1 -Path d:\partage1 -FullAccess DL_Partage1_CT -ChangeAccess DL_Partage1_LM -ReadAccess DL_Partage1_L

New-Item "d:\partage2" -ItemType Directory
New-SMBShare -Name partage2 -Path d:\partage2 -FullAccess DL_Partage2_CT -ChangeAccess DL_Partage2_LM -ReadAccess DL_Partage2_L

New-Item "d:\partage3" -ItemType Directory
New-SMBShare -Name partage3 -Path d:\partage3 -FullAccess DL_Partage3_CT -ChangeAccess DL_Partage3_LM -ReadAccess DL_Partage3_L

Add-LocalGroupMember -Group $Name -Member $Member
}