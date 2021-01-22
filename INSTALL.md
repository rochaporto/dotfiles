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
apt-get install blueman git golang-go google-chrome-stable hugo i3m i3status i3lock isync krb5-user \
	meld mutt notmuch openafs-client openafs-krb5 python3 python3-pip spotify-client terminator vim
```
```bash
pip install --user python-magnumclient python-openstackclient
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
scp -r rbritoda@lxplus-cloud.cern.ch:~/.ssh/id_dsa ~/.ssh
scp -r rbritoda@lxplus-cloud.cern.ch:~/.ssh/id_rsa ~/.ssh
scp rbritoda@lxplus-cloud.cern.ch:~/.mutt/isyncpass.gpg .mutt
```

## Mail
```bash
mkdir -p mail/cern
mbsync -a
```
```bash
crontab -e
*/5 * * * * /home/ricardo/bin/mailsync
```
### Workaround for CERN Exchange
```bash
vim /etc/ssl/openssl.cnf

# X.509v3 extensions in its main [= default] section.)
openssl_conf = default_conf
...
				# identifier (optional, default: sha1)
[default_conf]
ssl_conf = ssl_sect

[ssl_sect]
system_default = system_default_sect

[system_default_sect]
MinProtocol = TLSv1
CipherString = DEFAULT@SECLEVEL=1
```

## Container Tools

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
