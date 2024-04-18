# Add these lines to ~/.bashrc if they don't already exist
#
#if [ -f ~/.bash_aliases ]; then
#   . ~/.bash_aliases
#fi

# Enhance common commands
if [[ "$OSTYPE" == "linux"* ]]; then
   alias ls='ls --color=auto'           # Colorize the output
fi
alias l='ls -CF'                        # List only regular files and directories
alias la='ls -CAF'                      # List almost all (indluding hidden but excluding implied ./ ../), classified by appending one of */=>@| indicator to entries)
alias lh='ls -ld .?*'                   # List only hidden files and directories
alias ll='ls -alF'                      # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format
alias lli='ls -AFli'                    # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, including inode
alias llh='ls -AFlh'                    # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, humane readable
alias llt='ls -AFlt' 				    # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, sorted by modification time desc
alias lltr='ls -AFltr' 			        # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, sorted by modification time asc
if [[ "$OSTYPE" == "linux"* ]]; then
   alias lls='ls -AFlh --size -1 -S'    # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, humane readable, sorted by size desc
   alias llsr='ls -AFlhr --size -1 -S'  # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, humane readable, sorted by size asc
   alias llx='ls -AFlX' 			    # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, sorted by file extension desc
   alias llxr='ls -AFlXr' 			    # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, sorted by file extension asc
elif [[ "$OSTYPE" == "darwin"* ]]; then
   alias lls='ls -alFS'                 # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, humane readable, sorted by size desc
   alias llsr='ls -alrFS'               # List almost all (indluding hidden but excluding implied ./ ../), classified (append one of */=>@| indicator to entries), in long format, humane readable, sorted by size asc
fi
alias cp='cp -iv'                       # Run 'cp' in interactive mode and explain what is being done
alias df='df -h'                        # Display disk usage on all volumes
alias mkdir='mkdir -p'                  # Override 'mkdir' to make parent directories as needed
alias mv='mv -iv'                       # Run 'mv' in interactive mode and explain what is being done
alias wget='wget -c'                    # Continue getting a partially-downloaded file (e.g., started by a previous instance of wget)

# Quick navigation
alias b='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'
alias .8='cd ../../../../../../../..'
alias .9='cd ../../../../../../../../..'
alias .10='cd ../../../../../../../../../..'

# Quick Search
alias qa='alias | grep'                 # Search alias
alias qf='find . -name'                 # Search file(s)/folder(s) matching name pattern
alias qg='grep --color=auto -rin . -e'  # Search files containing text (recursive, case insensitive, file names only)
alias qh='history | grep'               # Search command in history
alias qps='ps -ef | grep'               # Search process

# Shell shortcuts
alias c='clear'
alias e='exit'

# System & Diagnostics Info
if [[ "$OSTYPE" == "linux"* ]]; then
    alias archinfo='dpkg --print-architecture'                      # Display CPU Architecture
    alias cpuinfo='lscpu'                                           # Display CPU info
    alias deviceinfo='lspci'                                        # Display devices
    alias diskinfo='df -h /'                                        # Display disk usage
    alias distinfo='lsb_release -sd'                                # Display distribution info
    alias meminfo='free -m -l -t'                                   # Display memory usage
    alias osinfo='lsb_release -sd'                                  # Display OS info
    alias usbinfo='lsusb'                                           # Display USB devices
    alias activeports='netstat -tulanp'                             # List active ports
    alias myip='ip addr | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"; curl http://ipecho.net/plain; echo;'             # Display IPs
    alias networkapps='sudo lsof -P -i -n | cut -f 1 -d " " | uniq | tail -n +2 | sort'  # List which applications are connecting to the network
    alias openports='netstat -tulanp | grep -i listen'              # List open ports
    alias pscpu='ps auxf | sort -nr -k 3'                           # List top processes by CPU usage
    alias pscpu10='ps auxf | sort -nr -k 3 | head -10'              # List top 10 processes by CPU usage
    alias psmem='ps auxf | sort -nr -k 4'                           # List top processes by memory usage
    alias psmem10='ps auxf | sort -nr -k 4 | head -10'              # List top 10 processes by memory usage
    alias wifichannels='nmcli -f "CHAN,BARS,SIGNAL,SSID,SECURITY" d wifi | sort -n'      # List wifi channels of networks in range
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias archinfo='uname -a'
    alias cpuinfo='sysctl -n machdep.cpu.brand_string'              # Display CPU info
    alias deviceinfo='ioreg -p IOUSB'                               # Display devices
    alias diskinfo='df -h /'                                        # Display disk usage
    alias distinfo='uname -a'                                       # Display distribution info
    alias osinfo='uname -a'                                         # Display OS info
    alias usbinfo='ioreg -p IOUSB'                                  # Display USB devices
    alias activeports='netstat -tla'                                # List active ports
    alias myip='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"; curl http://ipecho.net/plain; echo'              # Display IPs
    alias networkapps='lsof -P -i -n | cut -f 1 -d " " | uniq | tail -n +2 | sort'  # List which applications are connecting to the network
    alias openports='netstat -tla | grep -i listen'                 # List open ports
    alias pscpu='ps aux | sort -nr -k 3'                            # List top processes by CPU usage
    alias pscpu10='ps aux | sort -nr -k 3 | head -10'               # List top 10 processes by CPU usage
    alias psmem='ps aux | sort -nr -k 4'                            # List top processes by memory usage
    alias psmem10='ps aux | sort -nr -k 4 | head -10'               # List top 10 processes by memory usage
fi

# Utilities
alias b64encode='python -c "import sys, base64; print base64.b64encode(sys.argv[1])"'
alias b64decode='python -c "import sys, base64; print base64.b64decode(sys.argv[1]).decode(\"utf-8\")"'
alias countf='find . -maxdepth 1 -type f | wc -l'               # Count files in current dir
alias countfr='find . -type f | wc -l'                          # Count files in current dir and its subdirectories
alias dis='display -resize x1000'                               # Requires imagemagick
alias empty='cat /dev/null >'
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
alias now='date +"%d-%m-%Y %T"'
alias ts2local='python -c "import sys, time; print time.strftime(\"%Y-%m-%d %H:%M:%S\", time.localtime(float(sys.argv[1])/1000))"'
alias urlencode='python -c "import sys, urllib; print urllib.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib; print urllib.unquote_plus(sys.argv[1])"'
alias urldecode2='python -c "import sys, urllib; s=urllib.unquote_plus(sys.argv[1]); print urllib.unquote_plus(s)"'
alias vcmount='veracrypt -t --mount'
alias vcunmount='veracrypt -t --dismount'
if [[ "$OSTYPE" == "linux"* ]]; then
    alias pbcopy='xsel --clipboard --input'                         # Requires xsel
    alias pbpaste='xsel --clipboard --output'
fi

# Programming
alias jsonf='python -mjson.tool'
alias jsonfb='pbpaste | python -mjson.tool'
alias xmlf='xmllint --format -'                                 # Requires libxml2-utils
alias xmlfb='pbpaste | xmllint --format -'

# Audio/Video download.
# Requires: youtube-dl
# Note for Windows Subsystem for Linux: Don't install 'youtube-dl' with apt-get it doesn't work properly. Use following command sequence instead:
#       sudo curl -L https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl
#       sudo chmod a+rx /usr/local/bin/youtube-dl
# Checkout: https://askubuntu.com/questions/486297/how-to-select-video-quality-from-youtube-dl
alias audio-dl='function _audio-dl { if [ "$#" -eq 1 ]; then youtube-dl -x --audio-format mp3 --output "%(title)s.%(ext)s" $1; else echo "Usage: audio-dl <video-url>"; fi };_audio-dl'
alias video-dl='function _video-dl { if [ "$#" -eq 1 ]; then youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 $1; else echo "Usage: video-dl <video-url>"; fi };_video-dl'

# Format conversion
alias vid2mp3='function _2mp3() { if [ "$#" -eq 2 ]; then ffmpeg -i "$1" -acodec libmp3lame -ab "$2" "$1.mp3"; else echo "Usage: 2mp3 <audio-file> <bitrate, 64k/128k/256k etc.>"; fi };_2mp3'   # Requires ffmpeg
alias 2ico='function _2ico() { if [ "$#" -eq 1 ]; then convert "$1" -define icon:auto-resize=128,64,48,32,16 "$1".ico; else echo "Usage: 2ico <image file>"; fi };_2ico' # Requires ImageMagick
alias 2jpg='function _2jpg() { if [ "$#" -eq 1 ]; then convert -density 300 "$1" -quality 100 "$1".jpg; else echo "Usage: 2jpg <image/document file>"; fi };_2jpg' # Requires ImageMagick
alias 2pdf='function _2pdf() { if [ "$#" -eq 1 ]; then convert -density 300 "$1" -quality 100 "$1".pdf; else echo "Usage: 2pdf <image file>"; fi };_2pdf' # Requires ImageMagick
alias 2png='function _2png() { if [ "$#" -eq 1 ]; then convert -density 300 "$1" -quality 100 -alpha off "$1".png; else echo "Usage: 2png <image/document file>"; fi };_2png' # Requires ImageMagick
alias remove_audio='function _remove_audio() { if [ "$#" -eq 1 ]; then ffmpeg -i "$1" -map 0:0 -acodec copy -vcodec copy "$1".mp4; else echo "Usage: remove_audio <mp4 file>"; fi };_remove_audio' # Requires Ffmpeg (https://unix.stackexchange.com/questions/6402/how-to-remove-an-audio-track-from-an-mp4-video-file)
alias md2html='function _md2html() { if [ "$#" -eq 1 ]; then pandoc "$1" -f markdown -t html -s -o "$1".html; else echo "Usage: md2html <markdown file>"; fi };_md2html' # Requires pandoc 
alias md2pdf='function _md2pdf() { if [ "$#" -eq 1 ]; then pandoc "$1" -s -o "$1".pdf; else echo "Usage: md2pdf <markdown file>"; fi };_md2pdf' # Requires pandoc 
alias md2docx='function _md2docx() { if [ "$#" -eq 1 ]; then pandoc -s "$1" -o "$1".docx; else echo "Usage: md2docx <markdown file>"; fi };_md2docx' # Requires pandoc 

# Photo Management
alias display_all='find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" \) -exec display "{}" \;'
alias display_all_fit='find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" \) -exec display -resize 1024x1024 "{}" \;'
alias display_fit='display -resize 1024x1024'
alias photoframe='function _photoframe(){ if [ "$#" -eq 1 ]; then photocopy.sh $1 _frame -y; else echo "Usage: photoframe <output dir>"; fi };_photoframe'
alias photoprint='function _photoprint(){ if [ "$#" -eq 1 ]; then photocopy.sh $1 _print -n; else echo "Usage: photoprint <output dir>"; fi };_photoprint'
alias random_image='function _random_image(){ if [ "$#" -eq 2 ]; then convert -size "$1" plasma:fractal $2; else echo "Usage: random_image <size, e.g., 1024x768> <image file>"; fi };_random_image'

# Encryption/Decryption
alias aescrypt='function _aescrypt() { if [ "$#" -eq 1 ]; then gpg -c --cipher-algo AES256 --compress-algo zip -o "$1".enc "$1"; else echo "Usage: aescrypt <file>"; fi };_aescrypt' # Requires GnuPG
alias aesdecrypt='function _aesdecrypt() { if [ "$#" -eq 1 ]; then gpg -o "${1%.*}" -d "$1"; else echo "Usage: aesdecrypt <file>"; fi };_aesdecrypt' # Requires GnuPG
alias gpgcrypt='function _gpgcrypt() { if [ "$#" -eq 2 ]; then gpg -o "$1".gpg -e -r $2 "$1"; else echo "Usage: gpgcrypt <file> <key>"; fi };_gpgcrypt' # Requires GnuPG
alias gpgdecrypt='function _gpgdecrypt() { if [ "$#" -eq 1 ]; then gpg -o "${1%.*}" -d "$1"; else echo "Usage: gpgdecrypt <file>"; fi };_gpgdecrypt' # Requires GnuPG

# tmux
alias tms='tmux new -s'
alias tml='tmux ls'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'

# Miscelleneous
alias delete_conflicted='find . -name "*conflicted*" -delete'
if [[ "$OSTYPE" == "linux"* ]]; then
    alias diff='colordiff' 				# Requires colordiff
    alias top='htop' 					# Requires htop
    alias f='nautilus ./'               # Opens current directory in file manager
    alias refresh_menu='touch $HOME/.local/share/applications/a && rm $HOME/.local/share/applications/a'

    # Logs
    alias squidlog='tail -f /var/log/squid/access.log'
    alias apachelog='tail -f /var/log/apache2/access.log'

    # Refresh Media Server
    alias reload_media='sudo minidlnad -R && sudo service minidlna restart'

    # Distribution update and cleanup
    # Get rid of packages that are no longer required, cleanup APT cache, remove thumbnails
    alias purge_unused='sudo apt-get autoremove --purge && sudo apt-get clean'
    alias update_all='sudo apt-get update && sudo apt-get upgrade'
    alias upgrade_dist='sudo apt-get update && sudo apt-get dist-upgrade'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias f='open -a Finder ./'  # Opens current directory in MacOS Finder - Mac
fi
