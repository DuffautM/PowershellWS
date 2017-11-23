$rep = "C:\Users\Public"
$log =  "C:\result.log"

if(Test-Path -Path $log)
{
    $save = $log + ".bak"
    Copy-Item $log -Destination $save
}
else
{
    Get-Date | Out-File –FilePath $log 

    $files = Get-ChildItem $rep -Recurse 

    foreach($file in $files)
    {

       $file.FullName   | Add-Content -Path $log 

    }
    
  
}

