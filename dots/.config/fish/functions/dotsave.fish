function dotsave --description "Save local config back to the dots repo"
    # 强制修剪掉末尾的 /
    set -l target (string trim --right --chars=/ $argv[1])
    set -l target $argv[1]
    set -l source_base "$HOME/.config/"
    set -l dest_base "$HOME/.cache/dots-hyprland/dots/.config/"

    if test -z "$target"
        echo "用法: dotsave [文件或目录名]"
        return 1
    end

    if not test -e "$source_base$target"
        echo "❌ 错误: $source_base$target 不存在"
        return 1
    end

    # 执行同步
    # 注意：这里去掉了 -avP 中的 'a' 里的某些特性，改用更精确的参数
    rsync -rtvP --delete "$source_base$target" "$dest_base"

    if test $status -eq 0
        echo "💾 $target 已保存至仓库路径！"

        # 互动提示：是否直接进入目录准备 git commit
        echo "是否现在进入仓库目录？ [y/N]"
        read -l confirm
        if test "$confirm" = y -o "$confirm" = Y
            cd "$HOME/.cache/dots-hyprland/dots/"
        end
    else
        echo "❌ 同步失败。"
    end
end
