#!/usr/bin/osascript

-- Checks logs for: 
-- anybotlua1
-- anybotlua2
-- anybotlua3
-- anybotlua4
-- anybotlua5
-- anybotlua6

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
        write text "ssh -t -t bot_jump sudo ssh anybotlua1 tail -f /tmp/lua_error.log"
    end tell

    -- Bottom Left tab
    tell second session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh anybotlua2 tail -f /tmp/lua_error.log"
    end tell

    -- Top middle tab
    tell third session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh anybotlua3 tail -f /tmp/lua_error.log"
    end tell

    -- Bottom middle tab
    tell fourth session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh anybotlua4 tail -f /tmp/lua_error.log"
    end tell

    -- top Right tab
    tell fifth session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh anybotlua5 tail -f /tmp/lua_error.log"
    end tell

    -- bottom Right tab
    tell sixth session of current tab of current window
        write text "ssh -t -t bot_jump sudo ssh anybotlua6 tail -f /tmp/lua_error.log"
    end tell

end tell
