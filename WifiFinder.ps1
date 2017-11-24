
<#netsh.exe wlan show networks mode=bssid | foreach {

    Write-Host $_

}#>

$BestSignal = 0
$BestBSSID

netsh.exe wlan show networks mode=bssid | foreach {

    if($_ -like 'SSID*')
    {
        $SSID = $_. Split(':', 2)[1].Trim()
        Write-Host "SSID found : " $SSID
    }

    elseif($_ -match 'BSSID')
    {
        $BSSID = $_.Split(':', 2)[1].Trim()

    }

    elseif($_ -match 'Signal')
    {
        $Signal = $_.Split(':', 2)[1].Trim()
        Write-Host "BSSID found :" $BSSID "/ Signal :" $Signal

        if($Signal -gt $BestSignal)
        {
            $BestSignal = $Signal
            $BestBSSID = $BSSID
            
        }

    }
        
}

Write-Host "Best :" $BestBSSID $BestSignal