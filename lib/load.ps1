$userName=$env:UserName

$roaming="C:\Users\$userName\AppData\Roaming"
$storeFolder="$roaming\DarkSoulsIII"

$desktop="C:\Users\$userName\Desktop"
$cacheFolder="$desktop\DarkSoulsIII"

$cacheFile="$cacheFolder.zip"

If(!(Test-Path $cacheFile)) {
    throw "Can not find Dark Souls III Cache Folder $cacheFile"
} Else {
    # unzip

    If(Test-Path $cacheFolder) {
        Remove-Item $cacheFolder -Recurse
    }

    Expand-Archive -LiteralPath $cacheFile -DestinationPath $cacheFolder

    if (!(Test-Path $storeFolder)) {
        throw "Can not find Dark Souls III Cache Folder $storeFolder"
    } else {
        Remove-Item $storeFolder -Recurse

        Set-Location $roaming
        mkdir DarkSoulsIII

        Set-Location $cacheFolder
        Move-Item ./DarkSoulsIII/* "$roaming/DarkSoulsIII" -Verbose

        Set-Location $desktop

        Remove-Item $cacheFolder -Recurse
        Remove-Item $cacheFile

        Write-Output "Success, will close in 1s"

        Start-Sleep -s 1
    }
}
