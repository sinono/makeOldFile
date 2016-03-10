#指定された拡張子のファイルのoldファイルを作る
function makeOldFile ($ext) {

    #今日の日付の文字列
    $txtYmd = Get-Date -Format "yyMMdd"

    #指定された拡張子のファイルだけを取得
    $match_ext = "*." + $ext
    $files = Get-ChildItem  $match_ext
    #$files = Get-ChildItem  "*.html"
    
    #指定のファイルが存在しない場合、処理は行わない
    if ($files -eq $null) {
      Write-Host "no file:" $match_ext
      Write-Host "end"
      exit
    }else {
        Write-Host "start copy file:" $match_ext
    }

    foreach($f in $files) {
          
        #現在のファイル名（拡張子を除く）
        $currentFileName = $f.name.substring(0,$f.name.length - ($ext.length + 1) )
        
        #oldファイルを作成
        copy-item $f ($currentFileName + "_old" + $txtYmd + "." + $ext)
    }

}

    Write-Host "Please type file filename extension :)"
    Write-Host "[KAKUCHO-SHI] ex. `"html`" `"css`" "-NoNewLine

    $extension = Read-Host

makeOldFile($extension)