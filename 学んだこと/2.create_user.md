# migrationファイルのリセット
```ruby
rake db:migrate:reset

rake db:drop
```
resetはdropとmigrationを同時に行ってくれる。migrationファイルを最初から全て実行してくれるので、マイグレーションファイルの作成の流れがおかしくないかを調べることができる。  
ただし、中に入っているデータは全て消えてしまう。

