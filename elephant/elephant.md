# Elephant
A service providing various datasources which can be triggered to perform actions.

Run `elephant -h` to get an overview of the available commandline flags and actions.
## Provider Configuration
### Arch Linux Packages
Arch Linux Packages: find packages and install them.

`~/.config/elephant/archlinuxpkgs.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|refresh_interval|int|10|refresh database every X minutes|
|installed_prefix|string|i:|prefix to use to show only explicitly installed packages|

### Calculator/Unit-Conversion
Calculator/Unit-Conversion with history.

### Clipboard
Provides access to your clipboard history.

`~/.config/elephant/clipboard.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|max_items|int|100|max amount of clipboard history items|

### Desktop Applications
Provides access to all your installed desktop applications.

`~/.config/elephant/desktopapplications.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|launch_prefix|string||overrides the default app2unit or uwsm prefix, if set. 'CLEAR' to not prefix.|
|locale|string||to override systems locale|
|show_actions|bool|false|include application actions, f.e. 'New Private Window' for Firefox|
|show_generic|bool|false|include generic info when show_actions is true|
|show_actions_without_query|bool|false|show application actions, if the search query is empty|
|history|bool|true|make use of history for sorting|
|history_when_empty|bool|false|consider history when query is empty|
|icon_placeholder|string|applications-other|placeholder icon for apps without icon|
|aliases|map[string]string||setup aliases for applications. Matched aliases will always be placed on top of the list. Example: 'ffp' => '<identifier>'. Check elephant log output when activating an item to get its identifier.|

### Files
Search files and folders.

`~/.config/elephant/files.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|launch_prefix|string||overrides the default app2unit or uwsm prefix, if set. 'CLEAR' to not prefix.|

### Menus
Custom menus.
Default location for menu definitions is `~/.config/elephant/menus/`.
`~/.config/elephant/menus.toml`
#### MenuConfig
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|paths|[]string||additional paths to check for menu definitions.|

#### Example Menus

```toml
name = "other"
name_pretty = "Other"
icon = "applications-other"
global_search = true

[[entries]]
text = "Volume"
async = "echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
icon = "audio-volume-high"
action = "wpctl set-volume @DEFAULT_AUDIO_SINK@ %RESULT%"

[[entries]]
text = "System"
async = """echo $(echo "Memory: $(free -h | awk '/^Mem:/ {printf "%s/%s", $3, $2}') | CPU: $(top -bn1 | grep 'Cpu(s)' | awk '{printf "%.1f%%", 100 - $8}')")"""
icon = "computer"
action = ""

[[entries]]
text = "Today"
async = """echo $(date "+%H:%M - %d.%m. %A - KW %V")"""
icon = "clock"
action = ""

```
```toml
name = "screenshots"
name_pretty = "Screenshots"
icon = "camera-photo"
global_search = true

[[entries]]
text = "View"
action = "vimiv ~/Pictures/"

[[entries]]
text = "Annotate"
action = "wl-paste | satty -f -"

[[entries]]
text = "Toggle Record"
action = "record"

[[entries]]
text = "Screenshot Region"
action = "wayfreeze --after-freeze-cmd 'IMG=~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png && grim -g \"$(slurp)\" $IMG && wl-copy < $IMG; killall wayfreeze'"

[[entries]]
text = "Screenshot Window"
action = "wayfreeze --after-freeze-cmd 'IMG=~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png && grim $IMG && wl-copy < $IMG; killall wayfreeze'"

[[entries]]
text = "other menu"
submenu = "other"

```
### Providerlist
List installed providers

### Runner
Run everything in your $PATH!

`~/.config/elephant/runner.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|history|bool|true|make use of history for sorting|
|history_when_empty|bool|false|consider history when query is empty|
|explicits|[]main.ExplicitItem||use this explicit list, instead of searching $PATH|
#### ExplicitItem
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|exec|string||executable/command to run|
|alias|string||alias|


### Symbols/Emojis
Find symbols and emojis.

Possible locales:
af,ak,am,ar,ar_SA,as,ast,az,be,bew,bg,bgn,blo,bn,br,bs,ca,ca_ES,ca_ES_VALENCIA,ccp,ceb,chr,ckb,cs,cv,cy,da,de,de_CH,doi,dsb,el,en,en_001,en_AU,en_CA,en_GB,en_IN,es,es_419,es_MX,es_US,et,eu,fa,ff,ff_Adlm,fi,fil,fo,fr,fr_CA,frr,ga,gd,gl,gu,ha,ha_NE,he,hi,hi_Latn,hr,hsb,hu,hy,ia,id,ig,is,it,ja,jv,ka,kab,kk,kk_Arab,kl,km,kn,ko,kok,ku,ky,lb,lij,lo,lt,lv,mai,mi,mk,ml,mn,mni,mr,ms,mt,my,ne,nl,nn,no,nso,oc,om,or,pa,pa_Arab,pap,pcm,pl,ps,pt,pt_PT,qu,quc,rhg,rm,ro,root,ru,rw,sa,sat,sc,sd,si,sk,sl,so,sq,sr,sr_Cyrl,sr_Cyrl_BA,sr_Latn,sr_Latn_BA,su,sv,sw,sw_KE,ta,te,tg,th,ti,tk,tn,to,tr,tt,ug,uk,ur,uz,vec,vi,wo,xh,yo,yo_BJ,yue,yue_Hans,zh,zh_Hant,zh_Hant_HK,zu,

`~/.config/elephant/symbols.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|locale|string|en|locale to use for symbols|
|history|bool|true|make use of history for sorting|
|history_when_empty|bool|false|consider history when query is empty|

### Websearch
Websearch: search the web with custom defined searches

`~/.config/elephant/websearch.toml`
#### Config
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|icon|string|depends on provider|icon for provider|
|min_score|int32|depends on provider|minimum score for items to be displayed|
|entries|[]main.Entry||entries|
|max_global_items_to_display|int|1|will only show the global websearch entry if there are at most X results.|
#### Entry
| Field | Type | Default | Description |
| --- | ---- | ---- | --- |
|name|string||name of the entry|
|default|bool||entry to display when querying multiple providers|
|prefix|string||prefix to actively trigger this entry|
|url|string||url, example: 'https://www.google.com/search?q=%TERM%'|
|icon|string||icon to display, fallsback to global|


