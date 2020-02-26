# golang env
export GOROOT=/usr/local/opt/go/libexec
# GOPATH为上面创建的目录路径
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# Enable the go modules feature
# export GO111MODULE=on
export GOPROXY=https://goproxy.io

# MonkeyDev path
# export MonkeyDevDeviceIP=
# export PATH=/opt/MonkeyDev/bin:$PATH
# export MonkeyDevPath=/opt/MonkeyDev

# theos
export THEOS=/opt/theos 
export PATH=/opt/theos/bin/:$PATH

# mysql@5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Rust
source $HOME/.cargo/env

# Haskell
source $HOME/.ghcup/env

# GEM_HOME
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

