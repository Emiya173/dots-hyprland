function dotsync --description "Sync specific config from local dots repo to ~/.config"
    set -l target $argv[1]
    set -l source_base "$HOME/.cache/dots-hyprland/dots/.config/"
    set -l dest_base "$HOME/.config/"

    if test -z "$target"
        echo "用法: dotsync [文件或目录名]"
        return 1
    end

    rsync -avP --delete "$source_base$target" "$dest_base"

    if test $status -eq 0
        echo "✅ $target 同步完成！"
    else
        echo "❌ 同步过程中出错。"
    end
end
