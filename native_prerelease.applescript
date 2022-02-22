#!/usr/bin/osascript

tell application "iTerm"
    activate
    -- Create a new tab
    tell current window to set tb to create tab with default profile

    -- Split this tab vertically 
    tell current session of current window 
        split vertically with same profile
    end tell

    -- Top Left tab (editing window 1)
    tell first session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh -t -t demo ssh -t -t prereleasenative1"
    end tell

    -- Bottom Left tab (log 1)
    tell second session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh -t -t demo ssh -t -t prereleasenative1 tail -f /var/log/nginx/native.error.log"
        split horizontally with same profile
    end tell
    
    tell third session of current tab of current window 
        write text "ssh -t -t bot_jump sudo ssh -t -t demo ssh -t -t prereleasenative1 tail -f /var/log/nginx/php_error.log"
    end tell
end tell
