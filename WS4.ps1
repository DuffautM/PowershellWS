$rep = "C:\Users\Public"
$log =  "C:\result.log"
$max_size = 50000

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
        if($file.Length -le $max_size)
        {
            $file.FullName   | Add-Content -Path $log 
        }
    }
    
  
}

