# Elephant
A service providing various datasources which can be triggered to perform actions.

Run `elephant -h` to get an overview of the available commandline flags and actions.
## Elephant Configuration
`~/.config/elephant/elephant.toml`
#### ElephantConfig
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|auto_detect_launch_prefix|bool|true|automatically detects uwsm, app2unit or systemd-run|
|overload_local_env|bool|false|overloads the local env|
|ignored_providers|[]string|<empty>|providers to ignore|
|git_on_demand|bool|true|sets up git repositories on first query instead of on start|

## Provider Configuration
### Elephant Archlinux Packages

Find, install and delete packages. Including AUR.

#### Features

- find official packages
- find AUR packages
- install packages
- list all exclusively installed packages
- remove packages
- clear all done items

#### Requirements

- `yay` or `paru` for AUR

#### Usage

In order to only display installed packages, prefix your query with `i:` (default).


`~/.config/elephant/archlinuxpkgs.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|refresh_interval|int|60|refresh database every X minutes. 0 disables the automatic refresh and refreshing requires an elephant restart.|
|command_install|string|yay -S %VALUE%|default command for AUR packages to install. supports %VALUE%.|
|command_remove|string|sudo pacman -R %VALUE%|default command to remove packages. supports %VALUE%.|
|auto_wrap_with_terminal|bool|true|automatically wraps the command with terminal|

### Elephant Bluetooth

Simple bluetooth management. Connect/Disconnect. Pair/Remove. Trust/Untrust.

#### Requirements

- `bluetoothctl`


`~/.config/elephant/bluetooth.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|

### Elephant Calc

Perform calculation and unit-conversions.

#### Features

- save results
- copy results

#### Requirements

- `libqalculate`
- `wl-clipboard`

#### Usage

Refer to the official [libqalculate docs](https://github.com/Qalculate/libqalculate).


`~/.config/elephant/calc.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|max_items|int|100|max amount of calculation history items|
|placeholder|string|calculating...|placeholder to display for async update|
|require_number|bool|true|don't perform if query does not contain a number|
|min_chars|int|3|don't perform if query is shorter than min_chars|
|command|string|wl-copy -n %VALUE%|default command to be executed. supports %VALUE%.|
|async|bool|true|calculation will be send async|

### Elephant Clipboard

Store clipboard history.

#### Features

- saves images and text history
- filter to show images only
- edit saved content

#### Requirements

- `wl-clipboard`
- `imagemagick`


`~/.config/elephant/clipboard.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|max_items|int|100|max amount of clipboard history items|
|image_editor_cmd|string||editor to use for images. use '%FILE%' as placeholder for file path.|
|text_editor_cmd|string||editor to use for text, otherwise default for mimetype. use '%FILE%' as placeholder for file path.|
|command|string|wl-copy|default command to be executed|
|recopy|bool|true|recopy content to make it persistent after closing a window|
|ignore_symbols|bool|true|ignores symbols/unicode|
|auto_cleanup|int|0|will automatically cleanup entries entries older than X minutes|

### Elephant Desktop Applications

Run installed desktop applications.

#### Features

- history
- pin items
- alias items
- auto-detect `uwsm`/`app2unit`


`~/.config/elephant/desktopapplications.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|launch_prefix|string||overrides the default app2unit or uwsm prefix, if set.|
|locale|string||to override systems locale|
|action_min_score|int|20|min score for actions to be shown|
|show_actions|bool|false|include application actions, f.e. 'New Private Window' for Firefox|
|show_generic|bool|true|include generic info when show_actions is true|
|show_actions_without_query|bool|false|show application actions, if the search query is empty|
|history|bool|true|make use of history for sorting|
|history_when_empty|bool|false|consider history when query is empty|
|only_search_title|bool|false|ignore keywords, comments etc from desktop file when searching|
|icon_placeholder|string|applications-other|placeholder icon for apps without icon|
|aliases|map[string]string||setup aliases for applications. Matched aliases will always be placed on top of the list. Example: 'ffp' => '<identifier>'. Check elephant log output when activating an item to get its identifier.|
|blacklist|[]string|<empty>|blacklist desktop files from being parsed. Regexp.|
|window_integration|bool|false|will enable window integration, meaning focusing an open app instead of opening a new instance|
|window_integration_ignore_actions|bool|true|will ignore the window integration for actions|
|wm_integration|bool|false|Moves apps to the workspace where they were launched at automatically. Currently Niri only.|
|single_instance_apps|[]string|["discord"]|application IDs that don't ever spawn a new window. |

### Elephant Files

Find files/folders.

#### Features

- preview text/images/pdf
- open files, folders
- drag&drop files into other programs
- copy file/path

#### Example `ignored_dirs`

```toml
ignored_dirs = ["/home/andrej/Documents/", "/home/andrej/Videos"]
```

#### Requirements

- `fd`


`~/.config/elephant/files.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|launch_prefix|string||overrides the default app2unit or uwsm prefix, if set.|
|ignored_dirs|[]string||ignore these directories. regexp based.|
|ignore_previews|[]main.IgnoredPreview||paths will not have a preview|
|ignore_watching|[]string||paths will not be watched|
|search_dirs|[]string|$HOME|directories to search for files|
|fd_flags|string|--ignore-vcs --type file --type directory|flags for fd|
#### IgnoredPreview
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|path|string||path to ignore preview for|
|placeholder|string||text to display instead|


### Elephant Menus

Create custom menus.

#### Features

- seamless menus
- create submenus
- define multiple actions per entry
- dynamic menus with Lua

#### How to create a menu

Default location for menu definitions is `~/.config/elephant/menus/`. Simply place a file in there, see examples below.

#### Actions for submenus/dmenus

Submenus/Dmenus will automatically get an action `open`.

#### Examples

```toml
name = "other"
name_pretty = "Other"
icon = "applications-other"

[[entries]]
text = "Color Picker"
keywords = ["color", "picker", "hypr"]
actions = { "cp_use" = "wl-copy $(hyprpicker)" }
icon = "color-picker"

[[entries]]
icon = "zoom-in"
text = "Zoom Toggle"
actions = { "zoom_use" = "hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float) | if . > 1 then 1 else 1.5 end')" }

[[entries]]
text = "Volume"
async = "echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
icon = "audio-volume-high"

[entries.actions]
"volume_raise" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"
"volume_lower" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"
"volume_mute" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0"
"volume_unmute" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1"
"volume_set" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ %VALUE%"

[[entries]]
keywords = ["disk", "drive", "space"]
text = "Disk"
actions = { "disk_copy" = "wl-copy '%VALUE%'" }
async = """echo $(df -h / | tail -1 | awk '{print "Used: " $3 " - Available: " $4 " - Total: " $2}')"""
icon = "drive-harddisk"

[[entries]]
text = "Mic"
async = "echo $(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)"
icon = "audio-input-microphone"
actions = { "mic_set" = "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ %VALUE%" }

[[entries]]
text = "System"
async = """echo $(echo "Memory: $(free -h | awk '/^Mem:/ {printf "%s/%s", $3, $2}') | CPU: $(top -bn1 | grep 'Cpu(s)' | awk '{printf "%.1f%%", 100 - $8}')")"""
icon = "computer"

[[entries]]
text = "Today"
keywords = ["date", "today", "calendar"]
async = """echo $(date "+%H:%M - %d.%m. %A - KW %V")"""
icon = "clock"
actions = { "open_cal" = "xdg-open https://calendar.google.com" }

[[entries]]
text = "uuctl"
keywords = ["uuctl"]
icon = "applications-system"
submenu = "dmenu:uuctl"
```

```toml
name = "screenshots"
name_pretty = "Screenshots"
icon = "camera-photo"

[[entries]]
text = "View"
actions = { "view" = "vimiv ~/Pictures/" }

[[entries]]
text = "Annotate"
actions = { "annotate" = "wl-paste | satty -f -" }

[[entries]]
text = "Toggle Record"
actions = { "record" = "record" }

[[entries]]
text = "OCR"
keywords = ["ocr", "text recognition", "OCR"]
actions = { "ocr" = "wayfreeze --hide-cursor --after-freeze-cmd 'grim -g \"$(slurp)\" - | tesseract stdin stdout -l deu+eng | wl-copy; killall wayfreeze'" }

[[entries]]
text = "Screenshot Region"
actions = { "region" = "wayfreeze --hide-cursor --after-freeze-cmd 'IMG=~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png && grim -g \"$(slurp)\" $IMG && wl-copy < $IMG; killall wayfreeze'" }

[[entries]]
text = "Screenshot Window"
actions = { "window" = "wayfreeze --after-freeze-cmd 'IMG=~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png && grim $IMG && wl-copy < $IMG; killall wayfreeze'" }

[[entries]]
text = "other menu"
submenu = "other"
```

```toml
name = "bookmarks"
name_pretty = "Bookmarks"
icon = "bookmark"
action = "xdg-open %VALUE%"

[[entries]]
text = "Walker"
value = "https://github.com/abenz1267/walker"

[[entries]]
text = "Elephant"
value = "https://github.com/abenz1267/elephant"

[[entries]]
text = "Drive"
value = "https://drive.google.com"

[[entries]]
text = "Prime"
value = "https://www.amazon.de/gp/video/storefront/"
```

#### Lua Example

By default, the Lua script will be called on every empty query. If you don't want this behaviour, but instead want to cache the query once, you can set `Cache=true` in the menu's config.

You can retrieve the last value of a menu by calling in `GetEntries`:

```lua
local value = lastMenuValue(<MENUNAME>)
```

```lua
Name = "luatest"
NamePretty = "Lua Test"
Icon = "applications-other"
Cache = true
Action = "notify-send %VALUE%"
HideFromProviderlist = false
Description = "lua test menu"
SearchName = true

function GetEntries()
    local entries = {}
    local wallpaper_dir = "/home/andrej/Documents/ArchInstall/wallpapers"

    local handle = io.popen("find '" ..
        wallpaper_dir ..
        "' -maxdepth 1 -type f -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.gif' -o -name '*.bmp' -o -name '*.webp' 2>/dev/null")
    if handle then
        for line in handle:lines() do
            local filename = line:match("([^/]+)$")
            if filename then
                table.insert(entries, {
                    Text = filename,
                    Subtext = "wallpaper",
                    Value = line,
                    Actions = {
                        up = "notify-send up",
                        down = "notify-send down",
                    },
                    -- Preview = line,
                    -- PreviewType = "file",
                    -- Icon = line
                })
            end
        end
        handle:close()
    end

    return entries
end
```

You can call Lua functions as actions as well:

```Lua
Actions = {
    test = "lua:Test",
}

function Test(value, args)
    os.execute("notify-send '" .. value .. "'")
    os.execute("notify-send '" .. args .. "'")
end
```


`~/.config/elephant/menus.toml`
#### MenuConfig
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|paths|[]string||additional paths to check for menu definitions.|

`~/.config/elephant/menus.toml`
#### Menu
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|name|string||name of the menu|
|name_pretty|string||prettier name you usually want to display to the user.|
|description|string||used as a subtext|
|icon|string||default icon|
|action|string||default menu action to use|
|actions|map[string]string||global actions|
|async_actions|[]string||set which actions should update the item on the client asynchronously|
|search_name|bool|false|wether to search for the menu name as well when searching globally|
|cache|bool||will cache the results of the lua script on startup|
|entries|[]common.Entry||menu items|
|terminal|bool||execute action in terminal or not|
|keywords|[]string||searchable keywords|
|fixed_order|bool||don't sort entries alphabetically|
|history|bool||make use of history for sorting|
|history_when_empty|bool||consider history when query is empty|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|parent|string||defines the parent menu|
|submenu|string||defines submenu to trigger on activation|
||string|||
#### Entry
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|text|string||text for entry|
|async|string||if the text should be updated asynchronously based on the action|
|subtext|string||sub text for entry|
|value|string||value to be used for the action.|
|actions|map[string]string||actions items can use|
|terminal|bool||runs action in terminal if true|
|icon|string||icon for entry|
|submenu|string||submenu to open, if has prefix 'dmenu:' it'll launch that dmenu|
|preview|string||filepath for the preview|
|preview_type|string||type of the preview: text, file [default], command|
|keywords|[]string||searchable keywords|
|state|[]string||state of an item, can be used to f.e. mark it as current|


### Elephant Providerlist

Lists all installed providers and configured menus.


`~/.config/elephant/providerlist.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|hidden|[]string|<empty>|hidden providers|

### Elephant Runner

Execute everything installed in your $PATH.

#### Features

- finds all executables items in $PATH
- ... or define an explicit list yourself


`~/.config/elephant/runner.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|history|bool|true|make use of history for sorting|
|history_when_empty|bool|false|consider history when query is empty|
|generic_text|string|run: |text prefix for generic run-anything entry|
|explicits|[]main.ExplicitItem||use this explicit list, instead of searching $PATH|
#### ExplicitItem
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|exec|string||executable/command to run|
|alias|string||alias|


### Elephant Symbols

Search for emojis and symbols

#### Requirements

- `wl-clipboard`


#### Possible locales
af,ak,am,ar,ar_SA,as,ast,az,be,bew,bg,bgn,blo,bn,br,bs,ca,ca_ES,ca_ES_VALENCIA,ccp,ceb,chr,ckb,cs,cv,cy,da,de,de_CH,doi,dsb,el,en,en_001,en_AU,en_CA,en_GB,en_IN,es,es_419,es_MX,es_US,et,eu,fa,ff,ff_Adlm,fi,fil,fo,fr,fr_CA,frr,ga,gd,gl,gu,ha,ha_NE,he,hi,hi_Latn,hr,hsb,hu,hy,ia,id,ig,is,it,ja,jv,ka,kab,kk,kk_Arab,kl,km,kn,ko,kok,ku,ky,lb,lij,lo,lt,lv,mai,mi,mk,ml,mn,mni,mr,ms,mt,my,ne,nl,nn,no,nso,oc,om,or,pa,pa_Arab,pap,pcm,pl,ps,pt,pt_PT,qu,quc,rhg,rm,ro,root,ru,rw,sa,sat,sc,sd,si,sk,sl,so,sq,sr,sr_Cyrl,sr_Cyrl_BA,sr_Latn,sr_Latn_BA,su,sv,sw,sw_KE,ta,te,tg,th,ti,tk,tn,to,tr,tt,ug,uk,ur,uz,vec,vi,wo,xh,yo,yo_BJ,yue,yue_Hans,zh,zh_Hant,zh_Hant_HK,zu,

`~/.config/elephant/symbols.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|locale|string|en|locale to use for symbols|
|history|bool|true|make use of history for sorting|
|history_when_empty|bool|false|consider history when query is empty|
|command|string|wl-copy|default command to be executed. supports %VALUE%.|

### Elephant Todo

Basic Todolist

#### Features

- basic time tracking
- create new scheduled items
- notifications for scheduled items
- mark items as: done, active
- urgent items
- clear all done items
- git integration (requires ssh access)

#### Requirements

- `notify-send` for notifications

#### Git Integration

You can set

```toml
location = "https://github.com/abenz1267/elephanttodo"
```

This will automatically try to clone/pull the repo. It will also automatically comimt and push on changes.

#### Usage

##### Creating a new item

By default, you can create a new item whenever no items matches the configured `min_score` threshold. If you want to, you can also configure `create_prefix`, f.e. `add`. In that case you can do `add:new item`.

If you want to create a scheduled task, you can prefix your item with f.e.:

```
+5d my task
in 10m my task
in 5d at 15:00 my task
jan 1 at 13:00 my task
january 1 at 13:00 my task
1 jan at 13:00 my task
```

Adding a `!` suffix will mark an item as urgent.


`~/.config/elephant/todo.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|urgent_time_frame|int|10|items that have a due time within this period will be marked as urgent|
|duck_player_volumes|bool|true|lowers volume of players when notifying, slowly raises volumes again|
|categories|[]main.Category||categories|
|location|string|elephant cache dir|location of the CSV file|
|time_format|string|02-Jan 15:04|format of the time. Look at https://go.dev/src/time/format.go for the layout.|
|title|string|Task Due|title of the notification|
|body|string|%TASK%|body of the notification|
#### Category
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|name|string||name for category|
|prefix|string||prefix to store item in category|


### Elephant Unicode

Search for unicode symbols

#### Requirements

- `wl-clipboard`


`~/.config/elephant/unicode.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|locale|string|en|locale to use for symbols|
|history|bool|true|make use of history for sorting|
|history_when_empty|bool|false|consider history when query is empty|
|command|string|wl-copy|default command to be executed. supports %VALUE%.|

### Elephant Websearch

Search the web with custom defined search engines.

#### Example entry

```toml
[[entries]]
default = true
name = "Google"
url = "https://www.google.com/search?q=%TERM%"
```


`~/.config/elephant/websearch.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|hide_from_providerlist|bool|false|hides a provider from the providerlist provider. provider provider.|
|entries|[]main.Engine|google|entries|
|history|bool|true|make use of history for sorting|
|history_when_empty|bool|false|consider history when query is empty|
|engines_as_actions|bool|true|run engines as actions|
|text_prefix|string|Search: |prefix for the entry text|
|command|string|xdg-open|default command to be executed. supports %VALUE%.|
#### Engine
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|name|string||name of the entry|
|default|bool||entry to display when querying multiple providers|
|prefix|string||prefix to actively trigger this entry|
|url|string||url, example: 'https://www.google.com/search?q=%TERM%'|
|icon|string||icon to display, fallsback to global|


