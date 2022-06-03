#Gets current version of Office from installed programs list
$version = Get-WmiObject -Class win32_product | where{$_.Name -like "*Office*"} # for testing purposes only, delete this comment to use this pipe | foreach-object {write-output $_.Version}

#Checks version against the minimum version for Office 2019 and installs office if version is less than the minimum version
if ([version]$version[0].Version -lt [version] "16.0.10386.20017")
{
echo "Office 2019 needs to be installed"}
else{
echo "Office 2019 doesnt need to be installed"
exit
}

#Go to installer location and run the installer with configuration XML settings
cd C:\Temp
.\setup.exe /configure .\Office2019Configuration.xml
