#!/usr/bin/osascript

tell application "iTerm"
    activate
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
    tell first session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prerelease1"
    end tell

    -- Bottom Left tab (log 1)
    tell second session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prerelease1 pm2 logs"
    end tell

    -- Top Right tab (editing window 2)
    tell third session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prerelease2"
    end tell

    -- Bottom Right tab (log 2)
    tell fourth session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prerelease2 pm2 logs"
    end tell
end tell
