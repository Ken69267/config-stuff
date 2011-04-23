# !/bin/bash
export XMODIFIER=@im=SCIM
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE=scim-bridge
export QT_IM_MODULE=scim-bridge
export QT4_IM_MODULE=scim-bridge

LANG='en_US.UTF-8' scim -d &
xmodmap ~/.Xmodmap
