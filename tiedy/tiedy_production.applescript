#!/usr/bin/osascript

tell application "iTerm"
    activate
    -- Create a new tab
    tell current window to set tb to create tab with default profile

    -- Split this tab vertically and horizontally 
    tell current session of current window 
        split vertically with same profile
    end tell

    -- Left tab (editing window 1)
    tell first session of current tab of current window
        write text "ssh -t -t td_jump sudo ssh tiedyprod"
    end tell

    -- Right tab (editing window 2)
    tell second session of current tab of current window
        write text "ssh -t -t td_jump sudo ssh tiedyprod tail -f /tmp/lua_error.log"
    end tell

end tell
