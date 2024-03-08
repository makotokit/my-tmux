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
