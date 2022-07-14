#ifndef SBTHEME_H
#define SBTHEME_H

#include "colors.h"

#define PROPERTY(k, v) {#k,#v},

struct Property {
    char *key;
    char *str;
} properties [] = {
    PROPERTY(bgypad, 0)
    PROPERTY(margin, 6)
    PROPERTY(borderwidth, 1)
    PROPERTY(bordercolor, "#030d17")
    PROPERTY(bgrad, 2)
#if defined BSPWM_DESKTOPS || defined SWAY_WORKSPACES
    PROPERTY(bgwidth, 27)
#endif
};

#endif /* SBTHEME_H */
