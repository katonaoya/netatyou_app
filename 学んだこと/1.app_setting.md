## 不要なファイルをgenerateで作成しない
application.rbに記述をする。
``` ruby
module XXX
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |g|  # ここから追記
      g.assets false          # CSS, JavaScriptファイル生成せず
      g.skip_routes false     # trueならroutes.rb変更せず、falseなら通常通り変更
      g.test_framework false  # testファイル生成せず
    end                       # ここまで
  end
end
```
上記のように、必要な設定を書き加えていく。

## テンプレートエンジン
　Webアプリケーションにおけるテンプレートエンジンとは、MVCフレームワークのビューにおいて、コントローラーで定義した変数を使用することができるようにする仕組みです。Railsでは、標準で採用されているテンプレートエンジンはERB（Embedded Ruby）です。テンプレートエンジンには複数あり、ERB以外のテンプレートエンジンを採用することもできます。  
　MVCフレームワークで採用されるテンプレートエンジンは、RailsにおけるERBに代表されるように、データベースなどから取得したデータとひな型として定義されたHTMLを合成して、出力結果として最終的なレスポンスとなるHTMLを生成する処理を担っています。テンプレートエンジンは、MVCフレームワークにおけるビューファイルの記述方法を提供するものともいえます。つまり、どんなテンプレートエンジンを採用するかによって、ビューファイルの記述方法は大きく変わります。