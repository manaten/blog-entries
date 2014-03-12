<a href="http://manaten.net/wp-content/uploads/2014/03/sublime_highlighter_2.png"><img src="http://manaten.net/wp-content/uploads/2014/03/sublime_highlighter_2.png" alt="sublime_highlighter_2" width="425" height="324" class="aligncenter size-full wp-image-931" /></a>

パワーポイントにコードを貼り付けたいとき、シンタックスハイライトを有効にしたいと思うことは稀によく有ります。
SublimeTextを用いてそれを行なう場合、[SublimeHighlight](https://github.com/n1k0/SublimeHighlight)というプラグインが便利です。

<!-- more -->

# インストール

[リポジトリ](https://github.com/n1k0/SublimeHighlight)のREADMEに書いてあります。

[PackageControlle](https://sublime.wbond.net/)がインストールされているのは大前提。
Ctrl+Shift+Pでコマンドパレットを開き、Repositoryとでもタイプすれば、 ｢PackageControlle:Add Repository｣のが出てくると思うので、Enterし、```https://github.com/n1k0/SublimeHighlight/tree/python3``` を追加。あとは普通にPackageControlle:installでSublimeHighlightをインストールできます。インストール後に要再起動。

# 使い方

無事インストールができたら、SublimeTextで右クリック時のメニューに｢Copy as HTML｣と｢Copy as RTF｣が追加されているはずです。

<a href="http://manaten.net/wp-content/uploads/2014/03/sublime_highlighter_3.png"><img src="http://manaten.net/wp-content/uploads/2014/03/sublime_highlighter_3.png" alt="sublime_highlighter_3" width="544" height="326" class="aligncenter size-full wp-image-932" /></a>

僕の環境(Windows7 + PowerPoint2010)では、｢Copy as HTML｣を用いてコピーすることで、以下のようにハイライトを維持したコピーが出来ました(ただし、改行とスペースは潰れちゃったので整形しなおしています)。

<a href="http://manaten.net/wp-content/uploads/2014/03/sublime_highlighter_2.png"><img src="http://manaten.net/wp-content/uploads/2014/03/sublime_highlighter_2.png" alt="sublime_highlighter_2" width="850" height="648" class="aligncenter size-full wp-image-931" /></a>

うまくいかない時は、設定で```linenos```や```noclasses```の値をいじってやるとうまくいくかもしれません。

参考までに自分の設定を載せておきます。

```json
{
    "theme": "tango",
    "linenos": "inline",
    "noclasses": true,
    "fontface": "consolas"
}
```

以上です。