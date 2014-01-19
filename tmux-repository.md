tmuxのタブ名を今いるディレクトリのリポジトリ名にする
=====
<a href="http://manaten.net/wp-content/uploads/2014/01/tmux_repository.png"><img src="http://manaten.net/wp-content/uploads/2014/01/tmux_repository.png" alt="tmux_repository" width="574" height="108" class="aligncenter size-full wp-image-888" /></a>

知ってる人には今更でしょうけど、タブに今いるリポジトリ名が出るようにしてみた。

<!-- more -->

別の処理([ディレクトリ名のリポジトリ部分に下線を引くやつ](http://blog.manaten.net/entry/808))が混ざっていますが、precmdでリポジトリ名を```tmux rename-window```に渡すだけです。
```sh
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' formats '%s:%b ' '%r' '%R'

precmd () {
  LANG=en_US.UTF-8 vcs_info
  psvar=()
  [[ -n ${vcs_info_msg_0_} ]] && psvar[1]="$vcs_info_msg_0_"

  if [[ -z ${vcs_info_msg_1_} ]] || [[ -z ${vcs_info_msg_2_} ]]; then
    psvar[2]=$PWD
  else
    psvar[2]=`echo $vcs_info_msg_2_|sed -e "s#$vcs_info_msg_1_\\$##g"`
    psvar[3]="$vcs_info_msg_1_"
    psvar[4]=`echo $PWD|sed -e "s#^$vcs_info_msg_2_##g"`
    
    which tmux > /dev/null && tmux rename-window $vcs_info_msg_1_
  fi
}
```
[github](https://github.com/manaten/dotfiles/blob/master/.zshrc)
