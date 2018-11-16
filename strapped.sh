brewup=`brew update; brew upgrade; brew prune; brew cleanup; brew doctor`

for stage in $(yq r vars/vars.yml "stages"); do
    
    cmd=`yq r vars/vars.yml $stage.command`

    targets=`yq r vars/vars.yml $stage.targets`

    for target in $targets; do
        $cmd $target
    done
done
