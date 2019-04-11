Configuration Website {
    Param(
        [Parameter(Mandatory)]
        [hashtable[]]$Items
    )
    
    Import-DscResource -ModuleName xWebAdministration

    foreach ($item in $Items) {
        
        if (-not $item.ContainsKey('Ensure')) {
            $item.Ensure = 'Present'
        }

        $executionName = $item.Name
        (Get-DscSplattedResource -ResourceName xWebsite -ExecutionName $executionName -Properties $item -NoInvoke).Invoke($item)
    }
}
