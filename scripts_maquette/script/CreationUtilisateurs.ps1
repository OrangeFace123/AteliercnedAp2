###script creation de compte


$UsersFilePath = "C:\Users\Administrator\Documents\AD\users.csv"
$WCEmailFile = "C:\Users\Administrator\Documents\AD\WCEmail.txt"

import-csv -path $UsersFilePath | foreach {

$Name = ($_.GivenName + " " + $_.LastName)
$UserPrincipalName = ($_.SamAccountName + ”@tierlieux86.fr”)
$UserPassword = Get-Random -maximum 20000 -Minimum 100
$UserPassword = "@" + "user" + $UserPassword.ToString()

#add user

new-aduser -name $Name -enabled $true -GivenName $_.GivenName –surname $_.lastName -accountpassword (convertto-securestring $UserPassword -asplaintext -force) -changepasswordatlogon $true -samaccountname $_.SamAccountName –userprincipalname $UserPrincipalName -EmailAddress $_.EmailAddress -DisplayName $_.Displayname -Department $_.Departement -Path 'OU=Utilisateurs,OU=ValorElec,OU=Clients Entreprises,OU=ETP Chasseneuil,DC=Tierslieux86,DC=fr' -ErrorAction Stop

"$UserPrincipalName,$UserPassword" | out-file -filepath "C:\Users\Administrator\Documents\AD\$Name.txt"


Write-Host "User Created: $Name"
}