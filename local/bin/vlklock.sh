#!/usr/bin/sh

IMAGE="/home/vlk/Pictures/Backgrounds/treeHD1080.png"
FONT="Impact"
FONT_COLOR="FFFFFFDC"
FONT_OUTLINE="000000"
FONT_SIZE="64"
FONT_MEME_SIZE="128"
FONT_OUTLINE_SIZE="1"
FONT_MEME_OUTLINE_SIZE="3"

LOCK_WIDTH="16.0"
LOCK_RADIUS="220"
LOCK_INSIDE="FFFFFF40"
LOCK_ACCENT="007bef"
LOCK_KEY_ACCENT="44a3fc"
LOCK_KEY_ACCENT_BORDER="014687"

VERIF_ACCENT="fcf11b"
VERIF_BG_ACCENT="fcf11b70"
WRONG_ACCENT="ff0000"
WRONG_BG_ACCENT="ff000070"

i3lock -nFfki $IMAGE \
--greeter-text="" \
--wrong-text="access denied" \
--verif-text="One moment" \
--noinput-text="Field Cleared" \
--time-str="%r" \
--date-str="%a, %m/%d/%y" \
--time-pos="ix:130" \
--date-pos="ix:1000" \
--pass-media-keys --pass-screen-keys --pass-power-keys --pass-volume-keys --ignore-empty-password \
--time-color=$FONT_COLOR \
--date-color=$FONT_COLOR \
--greeter-color=$FONT_COLOR \
--verif-color=$FONT_COLOR \
--wrong-color=$FONT_COLOR \
--modif-color=$FONT_COLOR \
--time-font=$FONT \
--date-font=$FONT \
--layout-font=$FONT \
--verif-font=$FONT \
--wrong-font=$FONT \
--greeter-font=$FONT \
--timeoutline-color=$FONT_OUTLINE \
--dateoutline-color=$FONT_OUTLINE \
--layoutoutline-color=$FONT_OUTLINE \
--verifoutline-color=$FONT_OUTLINE \
--wrongoutline-color=$FONT_OUTLINE \
--greeteroutline-color=$FONT_OUTLINE \
--timeoutline-width=$FONT_MEME_OUTLINE_SIZE \
--dateoutline-width=$FONT_MEME_OUTLINE_SIZE \
--layoutoutline-width=$FONT_OUTLINE_SIZE \
--verifoutline-width=$FONT_OUTLINE_SIZE \
--wrongoutline-width=$FONT_OUTLINE_SIZE \
--greeteroutline-width=$FONT_OUTLINE_SIZE \
--time-size=$FONT_MEME_SIZE \
--date-size=$FONT_MEME_SIZE \
--layout-size=$FONT_SIZE \
--verif-size=$FONT_SIZE \
--wrong-size=$FONT_SIZE \
--greeter-size=$FONT_SIZE \
--radius $LOCK_RADIUS \
--inside-color=$LOCK_INSIDE \
--ring-width=$LOCK_WIDTH \
--line-color="00000000" \
--keyhl-color=$LOCK_KEY_ACCENT \
--separator-color=$LOCK_KEY_ACCENT_BORDER \
--ring-color=$LOCK_ACCENT \
--ringver-color=$VERIF_ACCENT \
--insidever-color=$VERIF_BG_ACCENT \
--ringwrong-color=$WRONG_ACCENT \
--insidewrong-color=$WRONG_BG_ACCENT \


