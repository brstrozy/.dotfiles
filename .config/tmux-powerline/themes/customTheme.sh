# shellcheck shell=bash
# Default Theme
# If changes made here does not take effect, then try to re-create the tmux session to force reload.

#separator - choose one
arrow=false
diagonal=true

#segments
text_color="235"
fg_color="75"
bg_color="0"

#window segments
currwin_fg_color="color248"

# Arrow separators
if [ "$arrow" == true ]; then
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
fi

#diagonal separators
if [ "$diagonal" == true ]; then
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
fi

#backup for non patched font
#	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
#	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
#	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
#	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"

# See Color formatting section below for details on what colors can be used here.
TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-"$bg_color"}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-"$fg_color"}
# shellcheck disable=SC2034
TMUX_POWERLINE_SEG_AIR_COLOR=$(air_color)

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

# See `man tmux` for additional formatting options for the status line.
# The `format regular` and `format inverse` functions are provided as conveniences

if [ "$arrow" == true ]; then
    # shellcheck disable=SC2128
    if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_CURRENT" ]; then
    	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
            "#[fg=$bg_color,bg=$currwin_fg_color]"
            "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
    		"#[fg=$bg_color,bg=$currwin_fg_color]"
    		" #I:#W "
            "#[fg=$currwin_fg_color,bg=$bg_color]"
            "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
    	)
    fi
    
    # shellcheck disable=SC2128
    if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_STYLE" ]; then
    	TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
    		"$(format regular)"
    	)
    fi
    
    # shellcheck disable=SC2128
    if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_FORMAT" ]; then
    	TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
            "#[$(format inverse)]"
            "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
    		" #I:#W "
            "#[$(format regular)]"
            "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
    	)
    fi
fi


if [ "$diagonal" == true ]; then
    # shellcheck disable=SC2128
    if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_CURRENT" ]; then
    	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
            "#[fg=$currwin_fg_color,bg=$bg_color]"
            "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
    		"#[fg=$bg_color,bg=$currwin_fg_color]"
    		" #I:#W "
            "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
    	)
    fi
    
    # shellcheck disable=SC2128
    if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_STYLE" ]; then
    	TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
    		"$(format regular)"
    	)
    fi
    
    # shellcheck disable=SC2128
    if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_FORMAT" ]; then
    	TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
            "#[$(format regular)]"
            "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
    		"#[$(format inverse)]"
    		" #I:#W "
            "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
    	)
    fi
fi

# Format: segment_name [background_color|default_bg_color] [foreground_color|default_fg_color] [non_default_separator|default_separator] [separator_background_color|no_sep_bg_color]
#                      [separator_foreground_color|no_sep_fg_color] [spacing_disable|no_spacing_disable] [separator_disable|no_separator_disable]
#
# * background_color and foreground_color. Color formatting (see `man tmux` for complete list):
#   * Named colors, e.g. black, red, green, yellow, blue, magenta, cyan, white
#   * Hexadecimal RGB string e.g. #ffffff
#   * 'default_fg_color|default_bg_color' for the default theme bg and fg color
#   * 'default' for the default tmux color.
#   * 'terminal' for the terminal's default background/foreground color
#   * The numbers 0-255 for the 256-color palette. Run `tmux-powerline/color-palette.sh` to see the colors.
# * non_default_separator - specify an alternative character for this segment's separator
#   * 'default_separator' for the theme default separator
# * separator_background_color - specify a unique background color for the separator
#   * 'no_sep_bg_color' for using the default coloring for the separator
# * separator_foreground_color - specify a unique foreground color for the separator
#   * 'no_sep_fg_color' for using the default coloring for the separator
# * spacing_disable - remove space on left, right or both sides of the segment:
#   * "no_spacing_disable" - don't disable spacing (default)
#   * "left_disable" - disable space on the left
#   * "right_disable" - disable space on the right
#   * "both_disable" - disable spaces on both sides
#   * - any other character/string produces no change to default behavior (eg "none", "X", etc.)
#
# * separator_disable - disables drawing a separator on this segment, very useful for segments
#   with dynamic background colours (eg tmux_mem_cpu_load):
#   * "no_separator_disable" - don't disable the separator (default)
#   * "separator_disable" - disables the separator
#   * - any other character/string produces no change to default behavior
#
# Example segment with separator disabled and right space character disabled:
# "hostname 33 0 {TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} 0 0 right_disable separator_disable"
#
# Example segment with spacing characters disabled on both sides but not touching the default coloring:
# "hostname 33 0 {TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} no_sep_bg_color no_sep_fg_color both_disable"
#
# Example segment with changing the foreground color of the default separator:
# "hostname 33 0 default_separator no_sep_bg_color 120"
#
## Note that although redundant the non_default_separator, separator_background_color and
# separator_foreground_color options must still be specified so that appropriate index
# of options to support the spacing_disable and separator_disable features can be used
# The default_* and no_* can be used to keep the default behaviour.

if [ "$diagonal" == true ]; then
    # shellcheck disable=SC1143,SC2128
    if [ -z "$TMUX_POWERLINE_LEFT_STATUS_SEGMENTS" ]; then
    	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
            "tmux_session_info $fg_color $text_color ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} $fg_color $bg_color"
            "spacer_diagonal $bg_color $fg_color ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} no_sep_bg_color no_sep_fg_color both_disable separator_disable"
    		"hostname $fg_color $text_color ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} $fg_color $bg_color"
    	)
    fi
    
    # shellcheck disable=SC1143,SC2128
    if [ -z "$TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS" ]; then
    	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
            "lan_ip $fg_color $text_color ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}"
    	)
    fi
fi

if [ "$arrow" == true ]; then
	# shellcheck disable=SC1143,SC2128
	if [ -z "$TMUX_POWERLINE_LEFT_STATUS_SEGMENTS" ]; then
		TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
			"tmux_session_info $fg_color $text_color ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} $bg_color $fg_color"
			"spacer_arrow $fg_color $bg_color ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} no_sep_bg_color no_sep_fg_color both_disable separator_disable"
			"hostname $fg_color $text_color ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} $bg_color $fg_color"
		)
	fi

	# shellcheck disable=SC1143,SC2128
	if [ -z "$TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS" ]; then
		TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
			"lan_ip $fg_color $text_color"
		)
	fi
fi
