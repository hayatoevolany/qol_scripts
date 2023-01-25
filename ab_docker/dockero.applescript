#!/usr/bin/osascript

-- For this to work, you need to install the JSONhelper app from the apple app store. (https://apps.apple.com/us/app/jsonhelper/id1536132004?mt=12)

-- Vars
set region to "ap-northeast-3"
set cluster to "abd-cluster-3"
set container to "anybot1"

tell application "iTerm"
    activate

    -- Get the list of ARNs, Interpret as json
    set task_ids to do shell script "aws ecs list-tasks --cluster " & cluster & " --region " & region & " | jq -r '.taskArns'"
    tell application "JSON Helper"
        set task_ids to read JSON from task_ids
    end tell

    # Iterate over the ARNs
    set currentWindow to current window
    repeat with i from 1 to count of task_ids
        -- Split the current tab
        tell current session of current window
            split vertically with default profile
        end tell

        -- Set curr session to last-opened session
        tell current tab of current window
            set _new_session to last item of sessions
        end tell

        -- Write the aws execute (ssh) command to the newly opened pane
        tell _new_session
            select
            set task_id to (item i of task_ids)
            write text "aws ecs execute-command --region " & region & " --cluster " & cluster & " --container " & container & " --command '/bin/sh' --interactive --task " & task_id
        end tell
    end repeat
end tell
