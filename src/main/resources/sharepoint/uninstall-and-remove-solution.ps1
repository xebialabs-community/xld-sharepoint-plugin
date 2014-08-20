Add-PSSnapin Microsoft.SharePoint.PowerShell

Write-Output "Uninstalling solution [$($deployed.name)] from [$($deployed.container.name)] at [$($deployed.container.host.address)]."
Uninstall-SPSolution -Confirm:$false -Identity $($deployed.name) -WebApplication http://$($deployed.container.host.address)

$JobName = "*solution-deployment*$($deployed.name)*"
$job = Get-SPTimerJob | ?{ $_.Name -like $JobName }
if ($job -eq $null) {
	Write-Host 'Timer job not found'
} else {
	$JobFullName = $job.Name
	while ((Get-SPTimerJob $JobFullName) -ne $null) {
		Write-Host "Waiting to finish job $JobFullName"
		Start-Sleep -Seconds 3
        }
        Write-Host  "Finished waiting for job.."
	Write-Output "Removing solution [$($deployed.name)] from [$($deployed.container.name)] at [$($deployed.container.host.address)]."
	Remove-SPSolution -Confirm:$false -Identity $($deployed.name)
}

Write-Output "Done!"

