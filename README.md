# README

## 初期設定

### gemパッケージのインストール

```bash
bundle install
```

### jsパッケージのインストール

```bash
yarn install
```

### マイグレーション実行

```bash
rails db:migrate
```

### 初期データの投入

```bash
rails runner bin/initial_data.rb
```

### サーバー起動

```bash
rails s
```

### ホーム画面にアクセス

http://localhost:3000/home/index