all: bspwm-desktops bspwm-windows sway-i3-workspaces

bspwm-desktops: LDLIBS+=-lxcb
bspwm-desktops: bspwm-desktops.c sbtheme.h bspc.o

bspwm-windows: LDFLAGS+=-lujson
bspwm-windows: LDLIBS+=-lxcb
bspwm-windows: bspwm-windows.c sbtheme.h bspc.o

sway-i3-workspaces: LDFLAGS+=-lujson
sway-i3-workspaces: sway-i3-workspaces.c sbtheme.h

clean:
	rm -f bspwm-windows bspwm-desktops sway-i3-workspaces *.o
