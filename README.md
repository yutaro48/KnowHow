# アプリ概要
情報資産共有アプリ「KnowHow」を作成しました。

![top-page.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/864210/a1c07d8d-a520-de76-31ec-305b69eba0e8.gif)


このアプリでできることは以下の３点です


**① ノウハウをアウトプットする**

誰でも簡単にアウトプットできます。Markdownにも対応しています。下書きとして一時保存することもできます。

![first.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/864210/18a4c3d8-2e9f-e167-cc5d-87924c651036.gif)

**② ノウハウを検索する**

自分が求めるノウハウを検索することができます。ブックマークをして他の人のノウハウを自分のものにできます。
閲覧履歴表示やカテゴリー表示も実装しています。

![third.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/864210/52f21209-10cb-d92d-b415-03b2a6f715df.gif)

**③ 気になる人をフォローする**

気になる人をフォローすることができます。フォローした人のノウハウはタイムラインに表示されます。

![second.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/864210/04a01935-d1bd-d313-a837-12a02b99d33c.gif)

# 作成背景

### 「新卒社員 × 在宅勤務」によって顕在化した課題を解決するために作成

僕は2020年4月に某総合電機メーカーに新卒入社しました。
しかし、コロナウイルスの大流行により入社直後から在宅勤務になり、緊急事態宣言明けも在宅勤務が基本となりました。（緊急事態宣言後も用事がある時以外は基本在宅勤務という形態）
このように「新卒入社 × 在宅勤務」という特殊な状況下で私や同期は以下の３つの課題に直面しました。

##### 課題１　会社ノウハウを学ぶ（社員の経験から学ぶ）機会の減少
会社独自のノウハウは属人的であり、先輩社員や同期との雑談などから学ぶことが多いが、リモート環境では雑談などから学ぶ機会がほとんどなくなってしまう。
そのため、学べることが限定的になってしまうという課題がある。

##### 課題２　自身の学びをアウトプットする機会やレビューしていただく機会の減少
リモート環境では、自身の学んだことや経験したことを言語化したり、
他の社員の方からレビューしていただく機会が少なくなってしまう。
そのため、PDCAを回しづらい状況になってしまうという課題がある。

##### 課題３　同期社員と情報共有する機会の減少
新卒社員の中では、同期が現在どのような仕事をしているか気になっている人が多い。通常であれば雑談や飲み会などの機会に情報共有をすることが多いと思う。
しかし、コロナ禍という状況下ではそのような機会が持てなくなってしまっているという課題がある。
<br>
これらの課題を解決したいと思い、情報資産共有アプリ「KnowHow」の作成に至りました。


# 機能一覧

上記の課題を解決するために実装した機能は以下の通りです。

##### 基本機能

|  | 機能 | Gem |
|:-:|:-:|:-:|
|  ① | ログイン機能  |  devise |
|  ② |  ゲストログイン機能 |   |
|  ③ | プロフィール機能  |   |

##### 課題１（会社ノウハウを学ぶ機会の減少）を解決するための機能

|  | 機能 | Gem |
|:-:|:-:|:-:|
|  ① | 検索機能  |  |
|  ② |  ブックマーク機能（Ajax） |   |
|  ③ | カテゴリー別表示機能  |   |
|  ④ | 閲覧履歴表示機能  |  |
|  ⑤ | ページネーション機能  | kaminari  |

検索機能を実装し、自分が知りたいノウハウを検索できるようにしました。
カテゴリー別表示機能、閲覧履歴表示機能やページネーション機能を実装し、検索しやすいようにしました。
またブックマークをすることで他者のノウハウを自分のものにできます。
これらにより、様々な社員の経験から多くを学ぶことができるようになります。

##### 課題２（自身の学びをアウトプットする機会やレビューしていただく機会の減少）を解決するための機能

|  | 機能 | Gem |
|:-:|:-:|:-:|
|  ① | ノウハウのアウトプット機能（CRUD）  |  |
|  ② | コメント機能（CRUD） |   |
|  ③ | 下書き保存機能  |   |
|  ④ | マークダウン投稿機能 |  |

ノウハウのアウトプット機能を実装し、自身の学びや経験をアウトプットできるようにしました。また、MarkDown投稿機能や下書き機能を実装し、アウトプットの体験価値向上を狙っています。
また、コメントで他の社員からレビューしていただくことも可能です。
これらにより、自身の経験についてPDCAを回すことができるようになります。

##### 課題３（同期社員がどのようなことをしているのか情報共有する機会の減少）を解決するための機能

|  | 機能 | Gem |
|:-:|:-:|:-:|
|  ① | フォロー機能 |   |
|  ② | タイムライン表示機能 |   |

同期などが現在どのような仕事をしているかを確認するためにフォロー機能を実装しました。フォローした人のノウハウはタイムラインに表示されます。
これらにより、同期や気になる社員の動向を確認することができるようになります。

# 使用技術と選定理由

##### 使用技術

▼開発環境
 * macOS Catalina(10.15.6)
 * Visual Studio Code
 
▼フロントエンド
 * Haml/Sass/JavaScript(jQuery)
 * Semantic UI
 * Bootstrap

▼バックエンド
 * ruby 2.6.5p114
 * Rails 6.0.3.4

▼インフラ
 * PostgreSQL(13.0)
 * Heroku

##### 選定理由

バックエンドにRailsを採用した理由は２つあります。

１つ目は、Qiita、note、GitHubなどプログラミング学習の際の知識のインプットやアウトプットに使用したサービスにRailsが使用されていたからです。
今回作成した「KnowHow」は社内ノウハウのインプットやアウトプットをテーマにしたアプリであるため、開発前段階からこれらのアプリの特徴を取り入れようと考えていました。
そのため、バックエンドはRailsで作成することに決めました。

２つ目は、様々な情報にアクセスしやすいからです。
PHP,Pythonなど他のプログラミング言語も検討しましたが、日本国内のコミュニティや参考資料が多く学習しやすいRubyとフレームワークRailsを選択しました。
Rubyの学習によって得た知見を活かし、他の言語も学んでいきたいと思っております。

# データベース設計
draw.ioを使用して作成

![KnowHow.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/864210/b6cf3411-21ec-acf6-8a11-e5f94b855bd5.png)

# インフラ構成図

（AWSにデプロイでき次第掲載いたします）

# 工夫した点

（設計面）

* 実際に同期にヒアリングを行い課題設定を行なったこと
* ユーザーのストレスがないようにUI／UXをとにかくシンプルにしたこと
* 「誠実さ」を表現するためにベースカラーを青に設定したこと

（可読性向上）

* 部分テンプレート化
* デコレータを使用し、Modelの肥大化を回避
* 基本７アクションしか使わない（チームメンバーが理解しやすいように）

（保守性向上）

* 部分テンプレート化
* 「namespace」や「scope」を使用したルーティングの整備

（その他）

* 「チーム開発」を意識して、毎回ブランチを作りプルリクベースで開発
* commitを細かく行ったこと

# 苦労した点
##### 検索機能の実装（ActionTextを使用した場合）
検索機能はransack（gem）を使用すれば簡単に実装できますが、Rails6で導入されたActionTextを使用しているとransackによる検索が機能しなかったため、SQLを使用して自作で検索機能を作成しました。
とても苦労したと同時に「gemに頼らない機能実装」はとても良い経験だったので、別途記事にまとめました。
また、以前会社で学んだSQLの復習にもなりました！

# 今後やりたいこと
* AWSにデプロイ
* セキュリティの強化
* テストのサンプル数を増やす
* レスポンシブ対応
* Vue.jsの導入
* Docker / CircleCIの導入

# 感想
私は、前職在職時に自分自身や同期が本気で悩んでいた課題をどうにか解決できないかと思い、本アプリの開発を決めました。
しかし、自分で考えたWebアプリを形にするということは想像以上に大変でした。
「この処理はどこに書けばいいのか?」「この機能は本当に必要なのか?」「このUI/UXで使いやすいのか?」と常に自問自答を繰り返しながら開発していました。
ですが、開発を振り返ってみると大変だった記憶ではなく、楽しかった記憶や充実感ばかりが思い出されます。
なにより、エラーに直面しながらも自分自身のやりたいことを形にできた時の感動は一入でした。

このアプリ自体はこれで完成ではなく、インフラ面や機能面など課題がてんこ盛りなので、これからも改善を重ねていきたいと思っております！
