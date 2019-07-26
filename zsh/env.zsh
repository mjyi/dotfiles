# golang env
export GOROOT=/usr/local/opt/go/libexec
# GOPATH为上面创建的目录路径
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Enable the go modules feature
# export GO111MODULE=on
# Set the GOPROXY environment variable
export GOPROXY=https://goproxy.io


# MonkeyDev path
export MonkeyDevDeviceIP=
export PATH=/opt/MonkeyDev/bin:$PATH
export MonkeyDevPath=/opt/MonkeyDev

# theos
export THEOS=/opt/theos 
export PATH=/opt/theos/bin/:$PATH


# Flutter
export PATH="/Users/mervin/development/flutter/bin:$PATH"

# NVM
export NVM_DIR="/Users/mervin/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
export PATH=/Users/mervin/.nvm/versions/node/v10.14.1/bin/:$PATH
## 启动时通过更改node 版本号加载，减少启动时间


# Rust
export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
source $HOME/.cargo/env

# Cargo
alias cr='cargo run'
alias cf='cargo fmt'

# Rbenv
eval "$(rbenv init -)"

# Proxy
alias hproxy="export http_proxy=http://127.0.0.1:7777;export https_proxy=http://127.0.0.1:7777"
alias unhproxy="unset http_proxy;unset https_proxy"

alias cat='bat -p'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
