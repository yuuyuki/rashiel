
## Using Rldev

Get Rldev from:
https://kaisernet.org/downloads/
https://forum.kazamatsuri.org/t/rldev-for-dummies/917

### Extracting script

```
kprl -d -r -S -e UTF8 -o mtl-scripts SEEN.txt
```

If encoding is not specified to be UTF8, it will produce ShiftJIS files with .sjs extension instead .utf extension. But anyway on patching, it will be converted to ShiftJIS anyway, so there can't be any characters that cannot be represented in ShiftJIS encoding. e.g. o with a horizontal line on top.

### Patching script back in
```
rlc -o SEEN0100 -v -e UTF-8 seen0100.ke
```

Run from bin folder that is parent to Rashiel folder that contains rlc.
i.e. Rldev > bin > Rashiel
```
rlc -v -e utf-8 -i GAMEEXE.INI rashiel\mtl-scripts\SEEN0001.ke
```

Make sure to set RLDEV to the absolute path of the rldev folder to run on scripts within a folder. For SEEN001.ke (and SEEN001.utf in the same folder), it will produce SEEN0001.TXT within that same folder. 

```
set RLDEV=C:\Users\UserX\Downloads\rldev

for %a in (rashiel\mtl-scripts\*.ke) do rlc -v -e utf-8 -i GAMEEXE.INI %a
```

