<#
HTMLファイルのoldファイルを作るスクリプト
#>

#Get-ChildItem

#今日の日付の文字列
$txtYmd = Get-Date -Format "yyMMdd"

#htmlファイルだけを取得
$html = Get-ChildItem *.html

foreach($f in $html) {
    
    #現在のファイル名（拡張子を除く）
    $currentFileName = $f.name.substring(0,$f.name.length -5 )
    
    #oldファイルを作成
    copy-item $f ($currentFileName + "_old" + $txtYmd + ".html")
}

