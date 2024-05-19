# portfolio
■サービス概要
禁煙開始からどんなメリットがあるか可視化し、禁煙を続ける支えになるサービス

■ このサービスへの思い・作りたい理由
自分自身、何度も禁煙を挫折してきました。挫折した理由としてもちろんニコチンによる依存もありますが
頭の中でメリットはわかっているが、数値として記録に残るもを利用してこなかったことで
禁煙している日数、本来吸っている本数や、それに伴う消費金額、伸びるとされる寿命などが可視化することで
挫折しそうなときに支えてくれるのではないかと考えこのアイデアに至りました

■ ユーザー層について
タバコをやめたいと感じているすべての人々

■サービスの利用イメージ
禁煙している日数、本来吸っている本数や、それに伴う消費金額、伸びるとされる寿命などが可視化することで
挫折しそうなときに支えてくれる


■ 機能候補
・MVPリリース時
禁煙時間,禁煙できた本数,節約できた金額
・本リリース時
伸びる寿命
■ 機能の実装方針予定(ChatGPT参照)
ユーザーが禁煙を開始した日時を入力し、その日時からの経過時間を計算して表示します。
この計算は、サーバーサイドで現在時刻と禁煙開始時刻の差を取ることで実現します。
ユーザーが1日に吸っていたタバコの本数を記録し、それを基に禁煙開始から現在までの禁煙本数を計算します。
ユーザーが設定した1日あたりのタバコ消費量を基に、禁煙継続時間を日数に換算し、その日数に1日あたりの本数を掛け算します。
タバコ1箱の価格と1箱に含まれるタバコの本数をユーザーから入力してもらい、それを基に節約できた金額を計算します。
吸わなかった本数に1本あたりの価格を掛け算して節約金額を算出します。
