#!/bin/zsh
# 早見表はhelpでご覧ください。
PARENT_DIR_NAME=$(basename "$(dirname "$(pwd)")")
TMUX_SESSION="${PARENT_DIR_NAME}_tmux_session"

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <create|delete|help>"
  exit 1
fi

create_tmux_session() {
  tmux new-session -d -s $TMUX_SESSION
  tmux split-window -v
  tmux split-window -h -t $TMUX_SESSION:0.0

  # C-m はEnterキー　を押すこでcdコマンドを実行
  tmux send-keys -t $TMUX_SESSION:0.0 "cd $(pwd)" C-m
  tmux send-keys -t $TMUX_SESSION:0.1 "cd $(pwd)" C-m
  tmux send-keys -t $TMUX_SESSION:0.2 "cd $(pwd)" C-m

  tmux attach-session -t $TMUX_SESSION
}


delete_tmux_session() {
  tmux ls
  tmux kill-session -t $TMUX_SESSION
  tmux ls
}

help_tmux_commands() {
  cat << EOF
tmuxの基本的なコマンドリスト:
セッションの操作:
  新しいセッションを作成: tmux new -s <セッション名>
  セッションのリストを表示: tmux ls
  セッションにアタッチ: tmux attach -t <セッション名>
  セッションを切断: tmux detach
  セッションを削除: tmux kill-session -t <セッション名>

ウィンドウの操作:
  新しいウィンドウを作成: tmux new-window
  次のウィンドウに移動: tmux next-window
  前のウィンドウに移動: tmux previous-window
  ウィンドウを名前で選択: tmux select-window -t <ウィンドウ名>

ペインの操作:
  次のペーンに移動: C-a o
  次のペーンに移動: tmux lastp
  直前のペーンに移動: C-a ;
  現在のペーンを削除: C-a x
  ペインを垂直に分割: C-a "
  ペインを垂直に分割: C-a %
  ペインを閉じる: tmux kill-pane
EOF
  echo "現在のtmux設定（~/.tmux.conf）:"
  cat ~/.tmux.conf
}

case $1 in
  create)
    create_tmux_session
    ;;
  delete)
    delete_tmux_session
    ;;
  help)
    help_tmux_commands
    ;;
  *)
    echo "Invalid argument. Please use 'create', 'delete' or 'help'."
    exit 1
    ;;
esac
