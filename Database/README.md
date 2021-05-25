# find mysql client lib on linux
```
/sbin/ldconfig -p | grep mysql | cut -d\> -f2
```