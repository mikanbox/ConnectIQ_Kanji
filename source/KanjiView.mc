import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class KanjiView extends WatchUi.WatchFace {
    public var _timetext_mm as Array<Text>;
    public var _timetext_hh as Array<Text>;


    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));

        _timetext_hh = new[3] as Array<Text>;
        _timetext_mm = new[4] as Array<Text>;
        _timetext_hh[0] = View.findDrawableById("MainLabel_HHMM1") as Text;
        _timetext_hh[1] = View.findDrawableById("MainLabel_HHMM2") as Text;
        _timetext_hh[2] = View.findDrawableById("MainLabel_HHMM3") as Text;

        _timetext_mm[0] = View.findDrawableById("MainLabel_HHMM4") as Text;
        _timetext_mm[1] = View.findDrawableById("MainLabel_HHMM5") as Text;
        _timetext_mm[2] = View.findDrawableById("MainLabel_HHMM6") as Text;
        _timetext_mm[3] = View.findDrawableById("MainLabel_HHMM7") as Text;
        

    }

    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);


        var textview = View.findDrawableById("TimeLabel") as Text;

        var kanjiMIN = NumberToKanji(clockTime.min.format("%02d").toNumber());
        var kanjiMINchars = kanjiMIN.toCharArray();

        for( var i = 0; i < kanjiMINchars.size(); i++ ) {
            var ch = kanjiMINchars[i].toString();
            System.println( "Char : " + ch);
            _timetext_mm[i].setText(ch);
        }
        _timetext_mm[3].setText("分");


        var kanjiHOUR = NumberToKanji(clockTime.hour.format("%02d").toNumber());
        var kanjiHOURchars = kanjiHOUR.toCharArray();

        for( var i = 0; i < kanjiHOURchars.size(); i++ ) {
            var ch = kanjiHOURchars[i].toString();
            System.println( "Char : " + ch);
            _timetext_hh[i].setText(ch);
        }
        _timetext_hh[2].setText("時");




        View.onUpdate(dc);
        System.println( "kanjiHOUR : " + kanjiMIN);
    }

    function NumberToKanji(num as Number) as String {
        var strings = "" as String;
        var upper_digit = num / 10;
        var lower_digit = num % 10;
        if (num > 10) {
            if (upper_digit > 1) {
                strings += DigitToKanji(upper_digit).toString();
            }
            strings += "十" as String;
        }
        strings += DigitToKanji(lower_digit).toString();
        return strings as String;
    }

    function DigitToKanji(num as Number) as String {
        var character = "None";
        switch(num) {
            case 0: 
                character = "零";
                break;
            case 1:
                character = "一";
                break;
            case 2:
                character = "二";
                break;
            case 3:
                character = "三";
                break;
            case 4:
                character = "四";
                break;
            case 5:
                character = "五";
                break;
            case 6:
                character = "六";
                break;
            case 7:
                character = "七";
                break;
            case 8:
                character = "八";
                break;
            case 9:
                character = "九";
                break;
            default:
                break;
        }
        return character as String;
    }


    function onHide() as Void {
    }


}
