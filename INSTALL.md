# Fresh Installation

## Repositories

```bash
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/google.gpg >/dev/null
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

wget -q -O - https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
```

## System Settings

```bash
sudo grep DNSSEC /etc/systemd/resolved.conf
DNSSEC=no
```
This fixes the delay in kinit or ssh with:
```bash
debug3: Trying to reverse map address 188.184.91.57.
```

UPDATE: It doesn't seem the above fixes it, but the following krb5 does:
```bash
vim /etc/krb5.conf
[libdefaults]
	default_realm = CERN.CH

    # required due to the slow reverse dns in some networks
	dns_lookup_realm = false
	dns_lookup_kdc = false
...

[realms]
        CERN.CH = {
                default_domain = cern.ch
                kpasswd_server = cerndc.cern.ch
                admin_server = cerndc.cern.ch
                kdc = cerndc.cern.ch
                dns_lookup_kdc = false
                v4_name_convert = {
                  host = {
                    rcmd = host
                  }
                }
        }
...

```

## Apt Packages
```bash
apt-get update
apt-get upgrade
apt-get install abook autoconf autotools-dev blueman curl docker.io git golang-go google-chrome-stable hugo i3-wm i3status i3lock isync krb5-user lib-xcb-xtest0 libsasl2-dev libtool-bin links \
	maim meld msmtp mutt notmuch openafs-client openafs-krb5 pasystray picom python3 python3-pip spotify-client terminator vim xclip xserver-xorg-input-synaptics
```
```bash
pip install --user keystoneauth1[kerberos] python-heatclient python-magnumclient python-openstackclient pysocks
```

## dotfiles
```bash
mkdir -p ws/rochaporto
cd ws/rochaporto
git clone git@github.com:rochaporto/dotfiles.git
cd dotfiles
git submodule init
git submodule update
```
```bash
for f in .bash_aliases .bash_profile .bashrc .config/autorandr .config/terminator .gitconfig .gitignore .gitmodules .gnupg .i3 .i3status.conf .irssi .mailcap .mbsyncrc .msmtprc .mutt .muttrc .notmuch-config .vim .viminfo .vimrc .weechat; do ln -s /home/ricardo/ws/rochaporto/dotfiles/$f ~/$f; done
```

## SSH
```bash
mkdir ~/.ssh/controlmasters
cp .ssh/id_rsa.pub .ssh/config ~/.ssh
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

Reference: https://unix.stackexchange.com/questions/625637/configuring-mbsync-with-authmech-xoauth2

Authorize once per machine to get the refresh_token.
```bash
wget -O bin/mutt_oauth2.py https://gitlab.com/muttmua/mutt/-/raw/master/contrib/mutt_oauth2.py?inline=false
chmod 755 bin/mutt_oauth2.py

mutt_oauth2.py -a --authflow localhostauthcode ~/.mbsync.oauth2token
```
SASL XOAuth2 Plugin
```bash
git clone https://github.com/moriyoshi/cyrus-sasl-xoauth2.git
./autogen.sh
./configure

sed -i 's%pkglibdir = ${CYRUS_SASL_PREFIX}/lib/sasl2%pkglibdir = ${CYRUS_SASL_PREFIX}/lib/x86_64-linux-gnu/sasl2%' Makefile

make
make install
sudo make install
```

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

## Container Tools

### docker
```bash
sudo usermod -aG docker ricardo
```

### kubectl
```bash
wget "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -O ~/bin/kubectl
chmod 755 bin/kubectl
```

### helm
```bash
wget https://get.helm.sh/helm-v3.18.3-linux-amd64.tar.gz
tar zxvf helm-v3.18.3-linux-amd64.tar.gz
mv linux-amd64/helm ~/bin
rm -rf helm-v3.18.3* linux-amd64
chmod 755 bin/helm
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

## zoom
```bash
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg --install ./zoom_amd64.deb
```

## Screen Flicker Lenovo X1

Panel Self Refresh (PSR) disable:
https://ljvmiranda921.github.io/notebook/2021/09/01/linux-thinkpad-screen-flicker/

```bash
sudo vi /etc/default/grub (after)
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i915.enable_psr=0"

sudo update-grub

reboot
```

## Touchpad Click Touch and Sensitivity

```bash
apt install -y xinput xserver-xorg-input-synaptics
xinput list | grep -i touchpad
⎜   ↳ ELAN067B:00 04F3:31F8 Touchpad          	id=10	[slave  pointer  (2)]
xinput --watch-props 10 | grep Finger
	Synaptics Finger (348):	25, 30, 0
xinput --set-prop 10 "Synaptics Finger" 100 110 255
```
