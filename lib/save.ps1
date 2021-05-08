$userName=$env:UserName

$storeFolder="C:\Users\$userName\AppData\Roaming\DarkSoulsIII"
$cacheFolder="C:\Users\$userName\Desktop\DarkSoulsIII"

If(!(Test-Path $storeFolder)) {
    throw "Can not find Dark Souls III Store Folder $storeFolder"
    Pause
} Else {
    # Zip

    Compress-Archive $storeFolder -DestinationPath $cacheFolder

    Write-Output "Success, will close in 1s"

    Start-Sleep -s 1
}
