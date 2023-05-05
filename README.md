# KanjiView
## outline
This app is watch face app for Connect IQ devices.


## Debug
### Build Key
The Connect IQ compiler requires a developer key to sign apps.
```
openssl genrsa -out key.pem 4096
```

### Build command
```
java -Xms1g -Dfile.encoding=UTF-8 -Dapple.awt.UIElement=true -jar ~/Library/Application\ Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-4.0.10-2022-02-08-277ce4444/bin/monkeybrains.jar -o bin/Kanji.prg -f ~/_UserScript/ConnectIQ/Kanji/monkey.jungle -y ~/.ssh/developer_key -d fr55 -w --unit-test 
```

### Debug with VSCode
シミュレーターを使う場合、VS Code との連携が必要
- Run -> Start Debug
- 画面左下で Run App

### Commands
Merge font images
```
montage -geometry 30x30 -background "transparent" \
*.png merged.png
```
