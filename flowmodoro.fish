function format_time
    set total_seconds $argv[1]
    set hours (math "floor($total_seconds / 3600)")
    set minutes (math "floor(($total_seconds % 3600) / 60)")
    set seconds (math "$total_seconds % 60")
    
    set formatted ""
    if test $hours -gt 0
        set formatted "$formatted$hours hour"
        if test $hours -ne 1
            set formatted "$formatted"s
        end
        set formatted "$formatted "
    end
    if test $minutes -gt 0
        set formatted "$formatted$minutes minute"
        if test $minutes -ne 1
            set formatted "$formatted"s
        end
        set formatted "$formatted "
    end
    if test $seconds -gt 0 || test -z "$formatted"
        set formatted "$formatted$seconds second"
        if test $seconds -ne 1
            set formatted "$formatted"s
        end
    end
    echo $formatted
end

function flowmodoro
    set -g overall_work_time 0
    set -g total_sessions 0

    # Audio configuration
    set -g audio_map \
        startwork    ~/Music/startwork.wav \
        workstatus   ~/Music/workstatus.wav \
        startbreak   ~/Music/startbreak.wav \
        breakstatus  ~/Music/breakstatus.wav \
        focus        ~/Music/focus.wav \
        welltried    ~/Music/welltried.wav \
        didgreat     ~/Music/didgreat.wav

    function play_audio
        set -l sound_type $argv[1]
        set -l index (contains -i -- $sound_type $audio_map)
        if test -n "$index"
            set -l sound_path $audio_map[(math $index + 1)]
            if test -f "$sound_path"
                mpv --no-terminal --no-audio-display "$sound_path" >/dev/null 2>&1 &
                sleep 0.2
                return 0
            end
        end
        echo "Audio error: Missing '$sound_type'" >&2
        return 1
    end

    while true
        # Work session
        play_audio startwork
        read -P "Press ENTER to start working... " -l
        set work_start (date +%s)
        play_audio workstatus
        echo "▶ Work session started at "(date +%H:%M:%S)

        # End work session
        read -P "Press ENTER to finish working... " -l
        set work_end (date +%s)
        set work_duration (math "$work_end - $work_start")
        
        # Calculate break (FIXED)
    set break_duration 0
    set actual_break 0
    if test $work_duration -ge 60
        # CORRECTED: 12s minimum, 30m maximum
        set break_duration (math "floor(max(min($work_duration * 0.2, 1800), 12))")
    end

        # Break handling
        if test $break_duration -gt 0
            play_audio startbreak
            read -P "⏸ Break time. Press Enter."
            echo "Break Duration:" (format_time $break_duration)
            set break_start (date +%s)
            play_audio breakstatus
            if timer $break_duration
                set break_end (date +%s)
                set actual_break (math "$break_end - $break_start")
                play_audio focus
            else
                set break_end (date +%s)
                set actual_break (math "$break_end - $break_start")
                echo "Break interrupted after "(format_time $actual_break)
            end
        else
            echo "Session too short (<1m), no break needed"
        end

        # Update totals
        set overall_work_time (math "$overall_work_time + $work_duration")
        set total_sessions (math "$total_sessions + 1")

        # Session report
        printf "\nSession %s:\n" $total_sessions
        echo "├ Work:   "(format_time $work_duration)
        echo "├ Break:  "(if test $actual_break -gt 0
            format_time $actual_break
        else
            echo "0 seconds"
        end)
        echo "└ Total:  "(format_time $overall_work_time)

        # Continue prompt
        set -l continue true
        while true
            read -P "Continue? (Y/n) " -l choice
            switch (string lower "$choice")
                case y yes ""
                    break
                case n no
                    set continue false
                    break
            end
        end
        if not $continue
            break
        end
    end

    # Final report
    printf "\nFlowmodoro Summary:\n"
    echo "├ Total time:   "(format_time $overall_work_time)
    echo "├ Sessions:     $total_sessions"
    echo "└ Avg session:  "(format_time (math "$overall_work_time / $total_sessions"))

    # Final feedback
    if test $overall_work_time -ge 25200  # 7 hours
        play_audio didgreat
        echo "🚀 Phenomenal achievement!"
    else if test $overall_work_time -ge 14400  # 4 hours
        play_audio welltried
        echo "🎯 Great consistency!"
    else
        play_audio focus
        echo "💡 Every minute counts!"
    end
end

function flow
    flowmodoro $argv
end

