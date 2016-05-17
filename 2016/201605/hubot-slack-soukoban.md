<!--
title: Slack上でインタラクティブに倉庫番ゲームを遊べるhubot-slack-soukobanを作った
date:  2016-05-xx 12:00
categories: [Slack,Hubot,CoffeeScript]
-->


![Slack上でインタラクティブに倉庫番ゲームを遊べるhubot-slack-soukobanを作った](http://manaten.net/wp-content/uploads/2016/05/soukoban.gif)


[Slack](https://slack.com/) 上でリアクションを操作ボタンとして利用して倉庫番を遊べる、 [hubot-slack-soukoban](https://www.npmjs.com/package/hubot-slack-soukoban) を作りました。

<!-- more -->

その昔、 [Hubot-slack で絵文字でアニメーションする8パズルゲームができるbotを作った](http://blog.manaten.net/entry/slack-puzzle-bot) という記事を書き、Slackの編集をbotに叩かせまくることでSlack上で動くパズルゲームを作ったことを紹介しましたが、このパズルゲームの弱点として謎のコマンド列をタイプしてbotとやり取りしなければ遊べないというものがありました。
そこで今回、Slackのリアクション機能で配置されるボタンを操作ボタンとして利用することで、よりプレイヤーが直感的に遊べるゲームをSlack上に実現しました。

`soukoban` という文字列に反応してbotがランダムに選ばれた倉庫番のマップと、操作するためのリアクションボタンを表示します。
操作法は上記画像のままです。リアクションのボタンがそれぞれ上下左右の移動ボタンになっており、押したボタンの方向にキャラクターが進み、倉庫番が遊べます。

倉庫番のマップはGoogle画像検索で見つかったものを拝借しましたが、もし問題があるようであれば教えていただければ幸いです。

# インストール

[hubot-slack-soukoban](https://www.npmjs.com/package/hubot-slack-soukoban) を `npm install` したのち、 `external-scripts.json` に
`hubot-slack-soukoban` を追加することでhubotにこの機能を追加できます。

あと、READMEに書き忘れましたが、 `:mu:` という名前の透明ピクセルのみの絵文字が必要です。


# 実装にまつわること

実はこの hubot-slack-soukoban、倉庫番のロジック部分が20行程度で実装されています。
Slackでインタラクティブゲームを作るというネタが本来の目的であり、
ゲーム本体部分の実装に労力を割きたくなかっためできるだけ短く実装した結果で、倉庫番の実装としてはかなりミニマムな方なのではないかと思っています。
具体的にはキー入力時の状態遷移を文字列置換で実装し、更に各方向への移動の実装をマップを反転させてサボることで実装量を減らしているのですが、
後日この事についてもエントリを書こうと思っています。

興味がある方は [こちら](https://github.com/manaten/hubot-slack-soukoban/blob/master/src/index.coffee#L27) を見ていただけると幸いです。

# 感想

この手法を使えばいろんなゲームをSlack上で実現できそうです。
ただ、応答性はそんなに良くないので、倉庫番のような速効性は求められないゲームに限られますね。
ローグライクなんかは実装できて相性もいいのではとか妄想したりします(作りませんが)。

# 参考リンク

- [Slack](https://slack.com/)
- [github/hubot](https://github.com/github/hubot)
- [slackhq/hubot-slack](https://github.com/slackhq/hubot-slack)
- [manaten/hubot-slack-soukoban](https://www.npmjs.com/package/hubot-slack-soukoban)
