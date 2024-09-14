@ECHO off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET VID=%~1
SET LANG=%2
SET MODSIZE=%3
SET SPLITMAX=%4

IF "%VID%" EQU "" (
   ECHO usage: %~n0 input.mp4 language [model-size] [split-max]
   ECHO language is passed through to whisper: af,am,ar,as,az,ba,be,bg,bn,bo,br,bs,ca,cs,cy,da,de,el,en,es,et,eu,fa,fi,fo,fr,gl,gu,ha,haw,he,hi,hr,ht,hu,hy,id,is,it,ja,jw,ka,kk,km,kn,ko,la,lb,ln,lo,lt,lv,mg,mi,mk,ml,mn,mr,ms,mt,my,ne,nl,nn,no,oc,pa,pl,ps,pt,ro,ru,sa,sd,si,sk,sl,sn,so,sq,sr,su,sv,sw,ta,te,tg,th,tk,tl,tr,tt,uk,ur,uz,vi,yi,yo,yue,zh,Afrikaans,Albanian,Amharic,Arabic,Armenian,Assamese,Azerbaijani,Bashkir,Basque,Belarusian,Bengali,Bosnian,Breton,Bulgarian,Burmese,Cantonese,Castilian,Catalan,Chinese,Croatian,Czech,Danish,Dutch,English,Estonian,Faroese,Finnish,Flemish,French,Galician,Georgian,German,Greek,Gujarati,Haitian,Haitian Creole,Hausa,Hawaiian,Hebrew,Hindi,Hungarian,Icelandic,Indonesian,Italian,Japanese,Javanese,Kannada,Kazakh,Khmer,Korean,Lao,Latin,Latvian,Letzeburgesch,Lingala,Lithuanian,Luxembourgish,Macedonian,Malagasy,Malay,Malayalam,Maltese,Mandarin,Maori,Marathi,Moldavian,Moldovan,Mongolian,Myanmar,Nepali,Norwegian,Nynorsk,Occitan,Panjabi,Pashto,Persian,Polish,Portuguese,Punjabi,Pushto,Romanian,Russian,Sanskrit,Serbian,Shona,Sindhi,Sinhala,Sinhalese,Slovak,Slovenian,Somali,Spanish,Sundanese,Swahili,Swedish,Tagalog,Tajik,Tamil,Tatar,Telugu,Thai,Tibetan,Turkish,Turkmen,Ukrainian,Urdu,Uzbek,Valencian,Vietnamese,Welsh,Yiddish,Yoruba
   ECHO model-size: [tiny^|base^|small^|medium^|large] 
   exit /b 1
)

SET VIDNOEXT=%~n1
SET VIDDIR=%~dp1
SET VIDFQ=%VIDDIR%%~nx1

IF "%MODSIZE%" EQU "" SET MODSIZE=tiny

SET VCMD1=CALL speech2text.bat "%VIDFQ%" %MODSIZE%
@ECHO %~0: Executing %VCMD1%
%VCMD1%

SET SRTPREFIX=%VIDDIR%speech2text\%VIDNOEXT%\%MODSIZE%\%VIDNOEXT%

SET SRT=%SRTPREFIX%.srt
SET VCMD2=CALL ffsrt.bat "%VIDFQ%" "%SRT%"
@ECHO %~0: Executing %VCMD2%
%VCMD2%

SET TXT=%SRTPREFIX%.txt
SET VCMD3=CALL split4x.bat "%TXT%" %SPLITMAX%
@ECHO %~0: Executing %VCMD3%
%VCMD3%
