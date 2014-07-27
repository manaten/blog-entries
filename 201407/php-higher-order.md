---
title: PHPで利用できる配列操作系高階関数
date:  2014-07-28 12:00
categories: [PHP, プログラミング]
---

~[](http://manaten.net/wp-content/uploads/2014/07/higher-order_2.png)

PHP5.3からクロージャが利用可能であり、高階関数を積極的に利用して簡潔なコードを心がけたいのですが、一度調べておかないと意外な関数が利用可能であることに気づかなかったりするのでまとめ(個人的によく使う順)。

<!-- more -->

# array_map
- [PHP: array_map - Manual](http://php.net/manual/ja/function.array-map.php)

高階関数で最も代表的と思われるもの。配列の各要素を述語関数を用いたマッピングを行い、別の配列を作る。

```php
$prices = [100, 200, 300];
$taxInPrices = array_map(function($price) {
  return $price * 1.08;
}, $prices);
var_dump($taxInPrices);

// array(3) {
//   [0]=> float(108)
//   [1]=> float(216)
//   [2]=> float(324)
// }
```

また、PHPの```array_map```の面白いところは、引数配列を複数指定することが可能であり、その場合はScalaで言うところの```zipWith```関数の動きになるところ。これはつい最近まで知らなかった。

```scala
$lastNames = ['高坂', '南', '園田'];
$firstNames = ['穂乃果', 'ことり', '海未'];

$fullNames = array_map(function($lastName, $firstName) {
  return "$lastName $firstName";
}, $lastNames, $firstNames);
var_dump($fullNames);

// array(3) {
//   [0]=> string(16) "高坂 穂乃果"
//   [1]=> string(13) "南 ことり"
//   [2]=> string(13) "園田 海未"
// }
```


# array_reduce
- [PHP: array_reduce - Manual](http://php.net/manual/ja/function.array-reduce.php)

# usort / uasort/ uksort
- [PHP: usort - Manual](http://php.net/manual/ja/function.usort.php)
- [PHP: uasort - Manual](http://php.net/manual/ja/function.uasort.php)
- [PHP: uksort - Manual](http://php.net/manual/ja/function.uksort.php)

# array_filter
[PHP: array_filter - Manual](http://php.net/manual/ja/function.array-filter.php)




# array_diff_uassoc / array_diff_ukey
- [PHP: array_diff_uassoc - Manual](http://php.net/manual/ja/function.array-diff-uassoc.php)
- [PHP: array_diff_ukey - Manual](http://php.net/manual/ja/function.array-diff-ukey.php)

# array_udiff / array_udiff_assoc / array_udiff_uassoc
- [PHP: array_udiff - Manual](http://php.net/manual/ja/function.array-udiff.php)
- [PHP: array_udiff_assoc - Manual](http://php.net/manual/ja/function.array-udiff-assoc.php)
- [PHP: array_udiff_uassoc - Manual](http://php.net/manual/ja/function.array-udiff-uassoc.php)


# array_intersect_uassoc / array_intersect_ukey
- [PHP: array_intersect_uassoc - Manual](http://php.net/manual/ja/function.array-intersect-uassoc.php)
- [PHP: array_intersect_ukey - Manual](http://php.net/manual/ja/function.array-intersect-ukey.php)

# array_uintersect / array_uintersect_assoc / array_uintersect_uassoc
- [PHP: array_uintersect - Manual](http://php.net/manual/ja/function.array-uintersect.php)
- [PHP: array_uintersect_assoc - Manual](http://php.net/manual/ja/function.array-uintersect-assoc.php)
- [PHP: array_uintersect_uassoc - Manual](http://php.net/manual/ja/function.array-uintersect-uassoc.php)

# array_walk
- [PHP: array_walk - Manual](http://php.net/manual/ja/function.array-walk.php)

# array_walk_recursive
- [PHP: array_walk_recursive - Manual](http://php.net/manual/ja/function.array-walk-recursive.php)
