#!/usr/bin/env bash
set -eux
cd /

function main() {
    local dotfiles_dir="${HOME}/.dotfiles"

    # Await for content ready
    until test -e "/workspace/.gitpod/ready"; do {
        sleep 1;
    } done

    # Bootstrap
    rm -rf "${dotfiles_dir}";
    # Example: https://your_auth_user:your_auth_pass@example.com/you/repo.git
    git clone "${DOTFILES_BOOTSTRAP_LINK}" "${dotfiles_dir}";

    # Execute installation script if any and exit
    for s in install setup bootstrap; do {
        if p="${dotfiles_dir}/${s}" && test -x "${p}" || p="${p}.sh" && test -x "${p}"; then {
            set +m; "$p"; set -m;
            exit;
        } fi
    } done
    
    # Otherwise perform auto symlinking
    while read -r file; do {
        rf_path="${file#"${dotfiles_dir}"/}";
        target_file="${HOME}/${rf_path}";
        target_dir="${target_file%/*}";
        
        if test ! -d "$target_dir"; then mkdir -p "$target_dir"; fi;
        ln -sf "$file" "$target_file";
    } done < <(find "${dotfiles_dir}" -type f);

}

main "$@"