#!/usr/bin/osascript

tell application "iTerm"
    activate

    set counter to 0
    repeat while counter < 36
        -- Create a new tab
        tell current window to set tb to create tab with default profile

        -- Split this tab vertically and horizontally 
        tell current session of current window 
            split vertically with same profile
            split horizontally with same profile
        end tell

        -- Split the other tab vertically
        tell third session of current tab of current window
            split horizontally with same profile
        end tell

        -- Top Left tab (editing window 1)
        set counter to (counter + 1)
        tell first session of current tab of current window
            write text "ssh -t -t centos@52.194.115.183 -p32000 -i ~/.ssh/evolany_hayato sudo ssh anybotap" & counter & " tail -f /var/log/nginx/php_error.log"
        end tell

        -- Bottom Left tab (log 1)
        set counter to (counter + 1)
        tell second session of current tab of current window
            write text "ssh -t -t centos@52.194.115.183 -p32000 -i ~/.ssh/evolany_hayato sudo ssh anybotap" & counter & " tail -f /var/log/nginx/php_error.log"
        end tell

        -- Top Right tab (editing window 2)
        set counter to (counter + 1)
        tell third session of current tab of current window
            write text "ssh -t -t centos@52.194.115.183 -p32000 -i ~/.ssh/evolany_hayato sudo ssh anybotap" & counter & " tail -f /var/log/nginx/php_error.log"
        end tell

        -- Bottom Right tab (log 2)
        set counter to (counter + 1)
        tell fourth session of current tab of current window
            write text "ssh -t -t centos@52.194.115.183 -p32000 -i ~/.ssh/evolany_hayato sudo ssh anybotap" & counter & " tail -f /var/log/nginx/php_error.log"
        end tell
    end repeat
end tell



-- cp $HOME/.pm2/logs/http-out.log-20220610.gz $HOME/.pm2/logs/http-out_backup.log-20220610.gz

-- gunzip $HOME/.pm2/logs/http-out_backup.log-20220610.gz
-- grep '?????????????' $HOME/.pm2/logs/http-out_backup.log-20220610


-- grep '208042' $HOME/.pm2/logs/http-out_backup.log-20220610
