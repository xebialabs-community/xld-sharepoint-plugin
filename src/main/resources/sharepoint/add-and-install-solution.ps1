Add-PSSnapin Microsoft.SharePoint.PowerShell

Write-Output "Adding solution [$($deployed.name)] to [$($deployed.container.name)] at [$($deployed.container.host.address)]."
Add-SPSolution "$($deployed.file)"

Write-Output "Installing solution [$($deployed.name)] to [$($deployed.container.name)] at [$($deployed.container.host.address)]."
Install-SPSolution -Identity $($deployed.name) -WebApplication http://$($deployed.container.host.address) -GACDeployment

Write-Output "Done!"

