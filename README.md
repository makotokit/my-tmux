# インストール

```
git clone git@github.com:makotokit/my-tmux.git
cd my-tmux
```

# リリースの方法例

現在の~/.tmux.conf をバックアップしてから上書きリリースする。

```
cd my-tmux
cp ~/.tmux.conf ".tmux.conf-$(date +%Y%m%d-%H%M%S)" && \
  cp tmux.conf ~/.tmux.conf && \
  echo "現在の~/.tmux.confをバックアップしてから上書きしました。See the new backups as $(ls -la)"
```

# tmux_session の展開方法

各プロジェクトに配置すると、そのプロジェクトごとに tmux を設定して
必要な数のペーンを作成したりできるので、ご活用いただけます。
以下の例で、隠れファイルとしてドット付きの名前で保存しています。

```
cd my-tmux
cp tmux_session.sh `your-project`/.tmux_session.sh
```

使い方

```
./.tmux_session.sh create
```
