#!/usr/bin/osascript
tell application "iTerm"
    activate
    -- Create a new tab
    tell current window to set tb to create tab with default profile

    -- Split this tab vertically and horizontally 
    tell current session of current window 
        split vertically with same profile
    end tell

    -- Split the other tab vertically
    tell second session of current tab of current window
        split vertically with same profile
    end tell

    tell first session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh staging1"
    end tell

    tell second session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh staging2"
    end tell

    tell third session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh demo"
    end tell
end tell
