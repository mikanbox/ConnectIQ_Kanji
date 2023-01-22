import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class KanjiView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);

        var kanjiHOUR = NumberToKanji(clockTime.min);
        // var rawMINUTES = ;

        var view = View.findDrawableById("TimeLabel") as Text;
        view.setText(timeString);
        View.findDrawableById("TimeLabel").setText(kanjiHOUR);
        View.onUpdate(dc);

    }

    function NumberToKanji(num as Number) as Number {
        var strings = "";
        var upper_digit = num / 10;
        var lower_digit = num % 10;
        if (num > 10) {
            if (upper_digit > 1) {
                strings += DigitToKanji(upper_digit);
            }
            strings += "十";
        }
        strings += DigitToKanji(lower_digit);
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
