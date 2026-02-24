# Commands to run in interactive sessions can go here
if status is-interactive
    # No greeting
    set fish_greeting

    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != linux
        starship init fish | source
        enable_transience
    end

    # Colors
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    alias pamcan pacman
    alias l 'eza -lh --icons=auto'
    alias ll 'eza -lha --icons=auto --sort=name --group-directories-first' # long list all
    alias ld 'eza -lhD --icons=auto' # long list dirs
    alias lt 'eza --icons=auto --tree' # list folder as tree
    alias c "printf '\033[2J\033[3J\033[1;1H'"
    alias q 'qs -c ii'
    if test "$TERM" != linux
        alias ls 'eza --icons'
    end
    if test "$TERM" = xterm-kitty
        alias ssh 'kitten ssh'
        # 别名定义
        alias vim nvim
        alias lg lazygit
        alias ff fastfetch
        alias rn perl-rename
        alias tar bsdtar
        alias pip 'uv pip'
        alias icat 'kitten icat'
        alias dotfiles '/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
        alias dotfiles_lg 'GIT_DIR="$HOME/.dotfiles" GIT_WORK_TREE="$HOME" lazygit'
        alias adbs 'adb shell'
        alias logcat 'logcat-color | rg'
        alias vrpid "adbs ps -e | rg 'service_vrassistant\$' | rg -o '^.*? .*?(\\d+?) ' -r '\$1' "

        # 环境变量
        set -x LK "like0@192.168.12.65"
        set -x LK_S "$LK:/C:/Users/like0/share"
        set -x XRZ "78089@192.168.11.43"
        set -x XRZ_S "$XRZ:/C:/Users/78089/share"
        set -x VRDIR "/data/user/0/com.autoai.vr.service_vrassistant/files"
        fish_add_path $HOME/script/
        fish_add_path $HOME/.ghcup/bin/
        fish_add_path $HOME/.local/bin/

        # 初始化工具
        atuin init fish --disable-up-arrow | source
        zoxide init fish | source
        # yazi函数
        function y
            set tmp (mktemp -t "yazi-cwd.XXXXXX")
            yazi $argv --cwd-file="$tmp"
            if set cwd (cat -- "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
                cd -- "$cwd"
            end

            rm -f -- "$tmp"
        end
        # llmdebug函数
        function llmdebug
            set cmd "adb shell am broadcast -a com.autoai.vr.debug --ei TYPE 18 "
            if test (count $argv) -ge 1
                set cmd "$cmd--ei PA1 $argv[1] "
                if test (count $argv) -ge 2
                    set cmd "$cmd--ei PA2 $argv[2]"
                end
            end
            echo $cmd
            eval $cmd
        end

        # videoDebug函数
        function videoDebug
            set cmd "adb shell am broadcast -a com.autoai.vr.debug --ei TYPE 18 "
            set cmd "$cmd--ei PA1 -1 "
            if test (count $argv) -ge 1
                set cmd "$cmd--es PA3 $argv[1] "
            end
            echo $cmd
            eval $cmd
        end

        function su
            /bin/su --shell=/usr/bin/fish $argv
        end
    end
    if test "$TERM" != linux
        alias ls 'eza --icons'
    end

    # 别名定义
    alias vim nvim
    alias lg lazygit
    alias ff fastfetch
    alias rn perl-rename
    alias tar bsdtar
    alias pip 'uv pip'
    alias icat 'kitten icat'
    alias dotfiles '/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
    alias dotfiles_lg 'GIT_DIR="$HOME/.dotfiles" GIT_WORK_TREE="$HOME" lazygit'
    alias adbs 'adb shell'
    alias logcat 'logcat-color | rg'
    alias vrpid "adbs ps -e | rg 'service_vrassistant\$' | rg -o '^.*? .*?(\\d+?) ' -r '\$1' "

    # 环境变量
    set -x LK "like0@192.168.12.65"
    set -x LK_S "$LK:/C:/Users/like0/share"
    set -x XRZ "78089@192.168.11.43"
    set -x XRZ_S "$XRZ:/C:/Users/78089/share"
    set -x VRDIR "/data/user/0/com.autoai.vr.service_vrassistant/files"
    fish_add_path $HOME/script/
    fish_add_path $HOME/.ghcup/bin/
    fish_add_path $HOME/.local/bin/

    # 初始化工具
    atuin init fish --disable-up-arrow | source
    zoxide init fish | source
    # yazi函数
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
            cd -- "$cwd"
        end

        rm -f -- "$tmp"
    end
    # llmdebug函数
    function llmdebug
        set cmd "adb shell am broadcast -a com.autoai.vr.debug --ei TYPE 18 "
        if test (count $argv) -ge 1
            set cmd "$cmd--ei PA1 $argv[1] "
            if test (count $argv) -ge 2
                set cmd "$cmd--ei PA2 $argv[2]"
            end
        end
        echo $cmd
        eval $cmd
    end

    # videoDebug函数
    function videoDebug
        set cmd "adb shell am broadcast -a com.autoai.vr.debug --ei TYPE 18 "
        set cmd "$cmd--ei PA1 -1 "
        if test (count $argv) -ge 1
            set cmd "$cmd--es PA3 $argv[1] "
        end
        echo $cmd
        eval $cmd
    end

    function su
        /bin/su --shell=/usr/bin/fish $argv
    end
end
