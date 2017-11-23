$rep = "toto"
$log =  "C:\result.log"

if(Test-Path -Path $log)
{
    $save = $log + ".bak"
    Copy-Item $log -Destination $save
}
else
{
    $rep | Out-File –FilePath $log 
}

