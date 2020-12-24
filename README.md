# RickRollAP

RickRollAP creates a bait "Free Wi-Fi" access point that rickrolls users with its captive portal.

## Requirements
- A machine with some kind of Linux installed (Raspberry Pi recommended)
- A Wi-Fi adapter with monitor mode capability and proper drivers installed
- hostapd, dnsmasq, nginx

## Installation
1. Clone this repository and cd into it
```bash
git clone https://github.com/gombossb/rickrollAP.git
cd rickrollAP
```
2. Install required tools
```bash
# on Debian-based systems
sudo apt update
sudo apt install hostapd dnsmasq nginx
```
3. Copy captive portal to /var/www, site configuration to nginx sites and symlink it to get enabled
```bash
sudo cp -r rickportal/ /var/www/
sudo cp nginx-site /etc/nginx/sites-available/rickrollap
sudo ln -s /etc/nginx/sites-available/rickrollap /etc/nginx/sites-enabled/
```
4. Use this sed code to change your Wi-Fi interface if it's not wlan1
```bash
sed -i -- 's/wlan1/wlan123/g' $(find . -maxdepth 1 -type f)
```

## Usage
Put your wifi interface into monitor mode
```bash
sudo airmon-ng start wlan1
```
Launch script
```bash
sudo bash start.sh
```
Stop the script
```bash
sudo bash stop.sh
```

### PS
Kudos to hash3liZer for his article on [shellvoide.com](https://www.shellvoide.com/wifi/how-to-setup-captive-portal-login-with-rogue-ap-nginx/), it's helped me a lot with this project.
