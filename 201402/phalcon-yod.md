<a href="http://manaten.net/wp-content/uploads/2014/02/phalcon-22.png"><img src="http://manaten.net/wp-content/uploads/2014/02/phalcon-22.png" alt="phalcon-22" width="300" height="344" class="aligncenter size-full wp-image-928" /></a>

[先日書いたように](http://blog.manaten.net/entry/open-hack-day-2)、Yahooの[OpenHackDay](http://yhacks.jp/ohd2/)に参加し、そこでPHPのフレームワークとして[Phalcon](http://phalconphp.com/ja/)を利用したので、忘れないうちに使用感などを書いておきます。

<!-- more -->

# Phalconとは

* サイト [Phalcon](http://phalconphp.com/ja/)
* PHPのモジュールとしてC言語で書かれたWebフレームワーク。そのため、フレームワーク部分は他のPHP製のPHP Webフレームワークよりも高速。という謳い。
  * それが事実かは、今回少ししか使ってないので判断しかねます。
* 一般的なWebフレームワークと同様にMVC形式をとっている。
* 専用のテンプレートエンジン｢Volt｣を内蔵している。
* コマンドラインからプロジェクト生成したりするための、[phalcon/devtools](https://github.com/phalcon/phalcon-devtools)というのがある。[FuelPHP](http://fuelphp.com/)で言うところのoilコマンド。デフォルトではインストールされず、[Composer](https://getcomposer.org/)でインストールが可能。