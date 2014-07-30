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

高階関数で最も代表的と思われるもの。map-reduceのmap。配列の各要素をクロージャを用いたマッピングを行い、別の配列を作ります。

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
他には、DB取得結果など、エンティティの配列みたいな形になっている時に、名前だけの配列がほしい場合などにも使います。

```php
$entities = [
  ['id' => 25, 'name' => 'ピカチュウ'],
  ['id' => 26, 'name' => 'ライチュウ'],
  ['id' => 27, 'name' => 'サンド']
];
$names = array_map(function($entity) {
  return $entity['name'];
}, $entities);
var_dump($names);

// array(3) {
//   [0]=> string(15) "ピカチュウ"
//   [1]=> string(15) "ライチュウ"
//   [2]=> string(9) "サンド"
// }
```


また、PHPの```array_map```の面白いところは、引数配列を複数指定することが可能であり、その場合はScalaで言うところの```zipWith```関数の動きになるところ。これはつい最近まで知りませんでした。

複数の配列の同じインデックスの要素それぞれを引数に取り、それらの要素を用いて値を返すクロージャを使うことで、複数配列を一つにまとめられます。

```php
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

これもよく使うやつ。map-reduceのreduce。配列の各要素を順番にクロージャに適用し、適用結果を返します。
Scalaでいうところの畳み込み(```fold```)。

```php
$nums = [1, 2, 3, 4, 5];
$prod = array_reduce($, function($c, $v) {
  return $c * $v;
}, 100);
var_dump($prod);
// int(12000)
```

応用例として、多重配列の平坦化の実装。
```php
function array_flatten(array $a) {
  return array_reduce($a, function($c, $v) {
    return array_merge($c, $v);
  }, []);
}
var_dump(array_flatten([ [1,2,3], [4,5,6], [1,2] ]));
// array(8) {
//   [0]=> int(1)
//   [1]=> int(2)
//   [2]=> int(3)
//   [3]=> int(4)
//   [4]=> int(5)
//   [5]=> int(6)
//   [6]=> int(1)
//   [7]=> int(2)
// }
```

reduceの引数になっているクロージャは実質何もしていないので、次のようにも書けます(文字列をcallableとして渡すのに是非があるけども。)。
```php
function array_flatten(array $a) {
  return array_reduce($a, 'array_merge', []);
}
```

### 第三引数の省略に関して注意

[マニュアル](http://php.net/manual/ja/function.array-reduce.php) を読むと第三引数を省略することでScalaの```reduce```の動きになりそうなことが書いてあるが(JavaScriptの[reduce](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)では引数の有無でそうなる)、実際は最初の値として```null```が渡ってくるだけのようであるので注意。基本的に第三引数の省略は行わないほうがいいと思います。

```php
$nums = [1, 2, 3, 4, 5];
$prod = array_reduce($nums, function($c, $v) {
  var_dump($c);
  return $c * $v;
});
// NULL
// int(0)
// int(0)
// int(0)
// int(0)

var_dump($prod);
// int(0)
```

JavaScriptでは、省略時はScalaでいう```reduce```の動きになります。
```javascript
[1,2,3].reduce(function(a, b){ return a * b; })
>> 6
[1,2,3].reduce(function(a, b){ return a * b; }, 100)
>> 600
```

このことにこのエントリを書くことで気づけたのでよかったです。

# usort 系
- [PHP: usort - Manual](http://php.net/manual/ja/function.usort.php)
- [PHP: uasort - Manual](http://php.net/manual/ja/function.uasort.php)
- [PHP: uksort - Manual](http://php.net/manual/ja/function.uksort.php)

配列ソート時の比較方法をクロージャとして指定できるものです。
連想配列の場合にキーを保持するuasort、キーを用いてソートするuksortという亜種があります。

オリジナルの構造をソートしたい場合がよく使うシチュエーションかと思います。

```php
$entities = [
  ['id' => 26, 'name' => 'ライチュウ'],
  ['id' => 27, 'name' => 'サンド'],
  ['id' => 25, 'name' => 'ピカチュウ'],
];
usort($entities, function($a, $b) {
  return $a['id'] - $b['id'];
});
var_dump($entities);

// array(3) {
//   [0]=> array(2) {
//     ["id"]=> int(25)
//     ["name"]=> string(15) "ピカチュウ"
//   }
//   [1]=> array(2) {
//     ["id"]=> int(26)
//     ["name"]=> string(15) "ライチュウ"
//   }
//   [2]=> array(2) {
//     ["id"]=> int(27)
//     ["name"]=> string(9) "サンド"
//   }
// }
```


ユニークな応用例として、[東方キャラソート](http://mainyan.sakura.ne.jp/thsort.html)のようなユーザー選択によるキャラクターソートを、クロージャをユーザー入力にすることで実装できます。

```php
$charList = [
  '秋 静葉',
  '秋 穣子',
  '鍵山 雛',
  '河城 にとり',
  '犬走 椛',
  '東風谷 早苗',
  '八坂 神奈子',
  '洩矢 諏訪子'
];
usort($charList, function($a, $b) {
  echo "どちらが好き？ (a/b)\na. $a\nb. $b\n";
  while (!in_array($input = trim(fgets(STDIN)), ['a', 'b']));
  return $input === 'a' ? -1 : 1;
});
var_dump($charList);

// ...
// どちらが好き？ (a/b)
// a. 八坂 神奈子
// b. 秋 静葉
// b
// array(8) {
//   [0]=> string(10) "鍵山 雛"
//   [1]=> string(10) "秋 穣子"
//   [2]=> string(10) "犬走 椛"
//   [3]=> string(16) "河城 にとり"
//   [4]=> string(16) "洩矢 諏訪子"
//   [5]=> string(10) "秋 静葉"
//   [6]=> string(16) "八坂 神奈子"
//   [7]=> string(16) "東風谷 早苗"
// }
```

ソートがどう動いているのか体感できるので、意外と面白いです。

# array_filter
[PHP: array_filter - Manual](http://php.net/manual/ja/function.array-filter.php)




# array_diff 系
- [PHP: array_udiff - Manual](http://php.net/manual/ja/function.array-udiff.php)
- [PHP: array_udiff_assoc - Manual](http://php.net/manual/ja/function.array-udiff-assoc.php)
- [PHP: array_udiff_uassoc - Manual](http://php.net/manual/ja/function.array-udiff-uassoc.php)
- [PHP: array_diff_uassoc - Manual](http://php.net/manual/ja/function.array-diff-uassoc.php)
- [PHP: array_diff_ukey - Manual](http://php.net/manual/ja/function.array-diff-ukey.php)



# array_intersect 系
- [PHP: array_uintersect - Manual](http://php.net/manual/ja/function.array-uintersect.php)
- [PHP: array_uintersect_assoc - Manual](http://php.net/manual/ja/function.array-uintersect-assoc.php)
- [PHP: array_uintersect_uassoc - Manual](http://php.net/manual/ja/function.array-uintersect-uassoc.php)
- [PHP: array_intersect_uassoc - Manual](http://php.net/manual/ja/function.array-intersect-uassoc.php)
- [PHP: array_intersect_ukey - Manual](http://php.net/manual/ja/function.array-intersect-ukey.php)


# array_walk, array_walk_recursive
- [PHP: array_walk - Manual](http://php.net/manual/ja/function.array-walk.php)
- [PHP: array_walk_recursive - Manual](http://php.net/manual/ja/function.array-walk-recursive.php)
