<!--
title: レスポンシブなCSSスプライト
date:  2015-12-xx 12:00
categories: [CSS,stylus,spritesmith]
-->


![レスポンシブなCSSスプライト](http://manaten.net/wp-content/uploads/2014/07/responsive_2.png)



<!-- more -->

# デモ

### 元画像

![レスポンシブなCSSスプライト](http://manaten.net/wp-content/uploads/2015/12/sprite.png)


### スプライト

<div>
<style>
.sprite-demo__button1 {
  margin-bottom: 10px;
  width: 70%;
  white-space: nowrap;
  text-indent: 100%;
  overflow: hidden;
  font-size: 0;
  background-image: url("http://manaten.net/wp-content/uploads/2015/12/sprite.png");
  background-size: 345% 375%;
  background-position: 0% 0%;
}
.sprite-demo__button1::after {
  content: '';
  display: block;
  padding-top: 40%;
}
.sprite-demo__button2 {
  margin-bottom: 10px;
  width: 50%;
  white-space: nowrap;
  text-indent: 100%;
  overflow: hidden;
  font-size: 0;
  background-image: url("http://manaten.net/wp-content/uploads/2015/12/sprite.png");
  background-size: 287.5% 300%;
  background-position: 44.44444444444444% 40%;
}
.sprite-demo__button2::after {
  content: '';
  display: block;
  padding-top: 41.66666666666667%;
}
.sprite-demo__button3 {
  margin-bottom: 10px;
  width: 100%;
  max-width: 500px;
  white-space: nowrap;
  text-indent: 100%;
  overflow: hidden;
  font-size: 0;
  background-image: url("http://manaten.net/wp-content/uploads/2015/12/sprite.png");
  background-size: 276% 250%;
  background-position: 100% 100%;
}
.sprite-demo__button3::after {
  content: '';
  display: block;
  padding-top: 48%;
}
</style>
<div class="sprite-demo__button1">ボタン1</div>
<div class="sprite-demo__button2">ボタン2</div>
<div class="sprite-demo__button3">ボタン3</div>
</div>

# コーディング



# spritesmith + stylusでの例

```stylus
sprite-responsive($sprite)
  $sprite_w = $sprite[6]
  $sprite_h = $sprite[7]
  $image_w = $sprite[4]
  $image_h = $sprite[5]
  $offset_x = $sprite[0]
  $offset_y = $sprite[1]

  white-space nowrap
  text-indent 100%
  overflow hidden
  background-image url($sprite[8])
  background-size ($sprite_w / $image_w * 100)% ($sprite_h / $image_h * 100)%
  background-position ($offset_x / ($sprite_w - $image_w) * 100)% ($offset_y / ($sprite_h - $image_h) * 100)%

  // 画像のアス比固定
  &::after
    content ''
    display block
    padding-top ($image_h / $image_w * 100)%
```

# 参考リンク

- [manaten/responsive-css-sprite-demo](https://github.com/manaten/responsive-css-sprite-demo)
    - 今回の内容のデモ用レポジトリ。gulpfileなど。
- [html - Responsively change div size keeping aspect ratio - Stack Overflow](http://stackoverflow.com/questions/12121090/responsively-change-div-size-keeping-aspect-ratio)
- [css - responsive sprites / percentages - Stack Overflow](http://stackoverflow.com/questions/21810262/responsive-sprites-percentages)
