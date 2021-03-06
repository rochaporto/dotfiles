# Fresh Installation

## Repositories
```bash
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
```

## Apt Packages
```bash
apt-get update
apt-get upgrade
apt-get install abook blueman docker.io git golang-go google-chrome-stable hugo i3m i3status i3lock isync krb5-user links \
	maim meld mutt notmuch openafs-client openafs-krb5 python3 python3-pip spotify-client terminator vim xclip
```
```bash
pip install --user keystoneauth1[kerberos] python-magnumclient python-openstackclient
```

## dotfiles
```bash
mkdir ws
cd ws 
git clone git@github.com:rochaporto/dotfiles.git
cd dotfiles
git submodule init
git submodule update
```
```bash
for f in .bash_aliases .bash_profile .bashrc .config/autorandr .config/terminator .gitconfig .gitignore .gitmodules .gnupg .i3 .i3status.conf .irssi .mailcap .mbsyncrc .msmtprc .mutt .muttrc .notmuch-config .vim .viminfo .vimrc .weechat; do ln -s /home/ricardo/ws/dotfiles/$f ~/$f; done
```

## SSH
```bash
mkdir ~/.ssh/controlmasters
scp -r lxplus.cern.ch:~/.ssh/id_dsa ~/.ssh
scp -r lxplus.cern.ch:~/.ssh/id_rsa ~/.ssh
scp lxplus.cern.ch:~/.mutt/isyncpass.gpg .mutt
```

## GPG
Public Key: http://keys.gnupg.net/pks/lookup?search=0x5453F6BE&fingerprint=on&op=index
```bash
scp -r lxplus.cern.ch:~/.gnupg/* ~/.gnupg
```
Helper commands:
```bash
gpg --list-keys
gpg --list-secret-keys
gpg --encrypt --armor sample.txt
```

## Mail
```bash
mkdir -p mail/cern
mbsync -a
```
```bash
./bin/ldap2abook
```
```bash
crontab -e
*/5 * * * * /home/ricardo/bin/mailsync
0 0 * * * /home/ricardo/bin/ldap2abook
```

## GSSAPI msmtp + MAXCMDLEN
```bash
sudo apt-get install autoconf automake libgnutls28-dev libtool gettext texinfo
git clone https://git.marlam.de/git/msmtp.git
```
```bash
vim src/smtp.c
...
#define SMTP_MAXCMDLEN 16384
...
```
```bash
autoreconf -i
./configure --prefix=/home/ricardo --with-libgsasl
make install
```

## Container Tools

### docker
```bash
sudo usermod -aG docker ricardo
```

### kubectl
```bash
wget "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -O ~/bin/kubectl
```

### helm
```bash
wget https://get.helm.sh/helm-v3.5.0-linux-amd64.tar.gz
tar zxvf helm-v3.5.0-linux-amd64.tar.gz
mv linux-amd64/helm ~/bin
rm -rf helm-v3.5.0* linux-amd64
```

### argocd
```bash
VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
curl -sSL -o ~/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
chmod 755 ~/bin/argocd
```

### gcloud
https://cloud.google.com/sdk/docs/install#deb
```bash
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install -y apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install -y google-cloud-sdk
```

### eksctl
```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl ~/bin
```

## Media & Chat

## skype
```bash
sudo snap install skype --classic
```

## zoom
```bash
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb
```
