import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time.Gregorian;
import Toybox.ActivityMonitor;

module Num2Kanji {
    function NumbersToKanjiChars(num as Number) as String {
        var strings = "" as String;

        while(!(num < 10)) {
            var p = num;
            while (p >= 10){p /= 10;}
            strings += DigitToKanji(p).toString();
            num /= 10;
        }
        strings += DigitToKanji(num).toString();
        return strings as String;
    }

    function NumbersToKanjiNumbers(num as Number) as String {
        var strings = "" as String;
        var upper_digit = num / 10;
        var lower_digit = num % 10;
        if (num >= 10) {
            if (upper_digit > 1) {
                strings += DigitToKanji(upper_digit).toString();
            }
            strings += "十" as String;
        }
        if (lower_digit > 0 || upper_digit == 0) {
            strings += DigitToKanji(lower_digit).toString();
        }

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
}