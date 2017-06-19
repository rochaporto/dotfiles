export NO_AT_BRIDGE=1 # to prevent accessibility bus warnings
export GOPATH=~/gopath
export GPGKEY=AFCFC7D8
export ETCD=$HOME/ws/etcd-v2.0.5-linux-amd64
export KUBROOT=$HOME/ws/kubernetes
export PATH=$KUBROOT/cluster:$ETCD:$PATH
export PROMPT_DIRTRIM=3
export PS1='\[\e[31m\]\u\[\e[90m\]@\[\e[34m\]\h \[\e[33m\]\w\[\e[37m\]$(__git_ps1 " (%s)")\[\e[90m\]\$ \[\e[39m\]'
