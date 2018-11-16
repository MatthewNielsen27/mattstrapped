# Program logo :p
prog="[Strapped]"

ordered_stages=`yq r .framework.yml supported-stages`

for stage in $ordered_stages; do

    targets=`yq r strapped_config/basic.yml $stage`

    # If the user has specified the stage
    if [[ "$targets" != "null" ]]; then

        # Get the stage callback messages
        msg_before=`yq r .framework.yml $stage.message.before`
        msg_after=`yq r .framework.yml $stage.message.after`
        msg_before_each=`yq r .framework.yml $stage.message.before-each`
        msg_after_each=`yq r .framework.yml $stage.message.after-each`

        cmd=`yq r .framework.yml $stage.command`

        # If available, print the before callback
        if [[ "$msg_before" != "null" ]]; then
            echo "$prog $msg_before"
        fi

        # Apply command to each target
        for target in $targets; do
            # If available, print the before callback
            if [[ "$msg_before_each" != "null" ]]; then
                echo "$prog $msg_before_each"
            fi

            # Apply command to target
            $cmd $target

            # If available, print the before callback
            if [[ "$msg_after_each" != "null" ]]; then
                echo "$prog $msg_after_each"
            fi
        done

        # If available, print the stage.after callback
        if [[ "$msg_after" != "null" ]]; then
            echo "$prog $msg_after"
        fi
    fi
done
