export GPGKEY=AFCFC7D8
export ETCD=$HOME/ws/etcd-v2.0.5-linux-amd64
export GOROOT=$HOME/ws/go
export GOPATH=$HOME/ws/gopath
export KUBROOT=$HOME/ws/kubernetes
export PATH=$KUBROOT/cluster:$GOPATH/bin:$GOROOT/bin:$ETCD:$PATH
export PROMPT_DIRTRIM=3
export PS1='\[\e[31m\]\u\[\e[90m\]@\[\e[34m\]\h \[\e[33m\]\w\[\e[37m\]$(__git_ps1 " (%s)")\[\e[90m\]\$ \[\e[39m\]'
