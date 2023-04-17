#!/usr/bin/osascript

-- Checks logs for: 
-- prerelease1
-- prerelease2
-- prereleaselua1
-- prereleaselua2
-- prereleasebc1
-- prereleasebc2

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
        split vertically with same profile
        split horizontally with same profile
    end tell

    tell fifth session of current tab of current window 
        split horizontally with same profile
    end tell

    -- Top Left tab
    tell first session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prerelease1 tail -f /var/log/nginx/php_error.log"
        delay 1
        set name to "prerelease1"
    end tell

    -- Bottom Left tab
    tell second session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prerelease2 tail -f /var/log/nginx/php_error.log"
        delay 1
        set name to "prerelease2"
    end tell

    -- Top middle tab
    tell third session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prereleaselua1 tail -f /tmp/lua_error.log"
        delay 1
        set name to "prereleaselua1"
    end tell

    -- Bottom middle tab
    tell fourth session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prereleaselua2 tail -f /tmp/lua_error.log"
        delay 1
        set name to "prereleaselua2"
    end tell

    -- top Right tab
    tell fifth session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prereleasebc1 tail -f /tmp/lua_error.log"
        delay 1
        set name to "prereleasebc1"
    end tell

    -- bottom Right tab
    tell sixth session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh prereleasebc2 tail -f /tmp/lua_error.log"
        delay 1
        set name to "prereleasebc2"
    end tell

end tell
