#!/usr/bin/env bash

#colors
#bold="(tput bold)"
magenta="\033[1;35m"
green="\033[1;32m"
white="\033[1;37m"
blue="\033[1;34m"
red="\033[1;31m"
black="\033[1;40;30m"
yellow="\033[1;33m"
cyan="\033[1;36m"
reset="\033[0m"
bgyellow="\033[1;43;33m"
bgwhite="\033[1;47;37m"
c0=${reset}
c1=${magenta}
c2=${green}
c3=${white}
c4=${blue}
c5=${red}
c6=${yellow}
c7=${cyan}
c8=${black}
c9=${bgyellow}
c10=${bgwhite}

# Get the init
get_init() {
    os=$(uname -o)
    if [ "$os" = "Android" ]; then
        echo 'init.rc'
    elif pidof -q systemd; then
        echo 'systemd'
    elif [ -f '/sbin/openrc' ]; then
        echo 'openrc'
    else
        cut -d ' ' -f 1 /proc/1/comm
    fi
}

# Get count of packages installed
get_pkg_count() {
    package_managers=('xbps-install' 'apk' 'apt' 'pacman' 'nix' 'dnf' 'rpm' 'emerge')
    for package_manager in "${package_managers[@]}"; do
        if command -v "$package_manager" 2>/dev/null >&2; then
            case "$package_manager" in
            xbps-install) xbps-query -l | wc -l ;;
            apk) apk search | wc -l ;;
            apt) echo $(($(apt list --installed 2>/dev/null | wc -l) - 1)) ;;
            pacman) pacman -Q | wc -l ;;
            nix) nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq | wc -l ;;
            dnf) dnf list installed | wc -l ;;
            rpm) rpm -qa | wc -l ;;
            emerge) qlist -I | wc -l ;;
            esac

            # if a package manager is found return from the function
            return
        fi
    done
    echo 0
}

# Get package information formatted
get_package_info() {
    pkg_count=$(get_pkg_count)

    if [ "$pkg_count" -ne 0 ]; then
        echo -n "$pkg_count"
    else
        echo "Unknown"
    fi
}

# Get distro name
get_distro_name() {
    os=$(uname -o)
    if [ "$os" = "Android" ]; then
        echo 'Android'
    else
        awk -F '"' '/PRETTY_NAME/ { print $2 }' /etc/os-release
    fi
}

# Get root partition space used
get_storage_info() {
    if [ "$os" = Android ]; then
        _MOUNTED_ON="/data"
        _GREP_ONE_ROW="$(df -h | grep ${_MOUNTED_ON})"
        _SIZE="$(echo "${_GREP_ONE_ROW}" | awk '{print $2}')"
        _USED="$(echo "${_GREP_ONE_ROW}" | awk '{print $3}')"
        echo "$(head -n1 <<<"${_USED}")B / $(head -n1 <<<"${_SIZE}")B"
    else
        df -h --output=used,size / | awk 'NR == 2 { print $1" / "$2 }'
    fi
}

# Get Memory usage
get_mem() {
    free --mega | awk 'NR == 2 { print $3" / "$2" MB" }'
}

# Get uptime
get_uptime() {
    uptime | grep -Eo ' [0-9]?[0-9]:[0-9][0-9]' | sed -n '2p'
}

# Get DE/WM
# Reference: https://github.com/unixporn/robbb/blob/master/fetcher.sh
get_de_wm() {
    wm="${XDG_CURRENT_DESKTOP#*:}"
    [ "$wm" ] || wm="$DESKTOP_SESSION"

    # for most WMs
    [ ! "$wm" ] && [ "$DISPLAY" ] && command -v xprop >/dev/null && {
        id=$(xprop -root -notype _NET_SUPPORTING_WM_CHECK 2>/dev/null)
        id=${id##* }
        wm=$(xprop -id "$id" -notype -len 100 -f _NET_WM_NAME 8t 2>/dev/null | grep '^_NET_WM_NAME' | cut -d\" -f 2)
    }

    # for non-EWMH WMs
    [ ! "$wm" ] || [ "$wm" = "LG3D" ] &&
        wm=$(pgrep -m 1 -o \
            -e "sway" \
            -e "kiwmi" \
            -e "wayfire" \
            -e "sowm" \
            -e "catwm" \
            -e "fvwm" \
            -e "dwm" \
            -e "2bwm" \
            -e "monsterwm" \
            -e "tinywm" \
            -e "xmonad")

    echo "${wm:-unknown}"
}

echo "               "

if [ "$os" = Android ]; then
    echo -e "               ${c5}phone${c0}  $(getprop ro.product.brand) $(getprop ro.product.model)"
fi

echo -e "               ${c1}os${c0}     $(get_distro_name) $(uname -m)"
echo -e "               ${c2}ker${c0}    $(uname -r)"
echo -e "     ${c3}•${c8}_${c3}•${c0}       ${c7}pkgs${c0}   $(get_package_info)"
echo -e "     ${c8}${c0}${c9}  ${c0}${c8}|${c0}       ${c4}sh${c0}     ${SHELL##*/}"
echo -e "    ${c8}/${c0}${c10} ${c0}${c8}'\'${c0}      ${c6}ram${c0}    $(get_mem)"
echo -e "   ${c9} ${c0}${c8}\_;/${c0}${c9} ${c0}      ${c1}init${c0}   $(get_init)"

if [ -n "$DISPLAY" ]; then
    echo -e "               ${c2}de/wm${c0}  $(get_de_wm)"
fi

echo -e "               ${c7}up${c0}    $(get_uptime)"
echo -e "               ${c6}disk${c0}   $(get_storage_info)"
echo -e "               "

if [ "$os" != Android ]; then
    echo -e "        ${c6}󰮯  ${c6}${c2}󰊠  ${c2}${c4}󰊠  ${c4}${c5}󰊠  ${c5}${c7}󰊠  ${c7}"
fi

echo -e "               \033[0m"
