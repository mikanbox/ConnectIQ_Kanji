import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time.Gregorian;
import Toybox.ActivityMonitor;


class KanjiView extends WatchUi.WatchFace {
    public var _timetext_mm as Array<Text> = new[4] as Array<Text>;
    public var _timetext_hh as Array<Text> = new[4] as Array<Text>;

    public var _timetext_month as Array<Text> = new[3] as Array<Text>;
    public var _timetext_day as Array<Text> = new[4] as Array<Text>;

    public var _label_battery as Array<Text> = new[4] as Array<Text>;
    public var _label_walk as Array<Text> = new[7] as Array<Text>;

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));

        _timetext_hh[0] = View.findDrawableById("MainLabel_HHMM1") as Text;
        _timetext_hh[1] = View.findDrawableById("MainLabel_HHMM2") as Text;
        _timetext_hh[2] = View.findDrawableById("MainLabel_HHMM3") as Text;
        _timetext_hh[3] = View.findDrawableById("MainLabel_HHMM4") as Text;

        _timetext_mm[0] = View.findDrawableById("MainLabel_HHMM5") as Text;
        _timetext_mm[1] = View.findDrawableById("MainLabel_HHMM6") as Text;
        _timetext_mm[2] = View.findDrawableById("MainLabel_HHMM7") as Text;
        _timetext_mm[3] = View.findDrawableById("MainLabel_HHMM8") as Text;


        _timetext_month[0] = View.findDrawableById("LeftLabel_MD1") as Text;
        _timetext_month[1] = View.findDrawableById("LeftLabel_MD2") as Text;
        _timetext_month[2] = View.findDrawableById("LeftLabel_MD3") as Text;

        _timetext_day[0] = View.findDrawableById("LeftLabel_MD4") as Text;
        _timetext_day[1] = View.findDrawableById("LeftLabel_MD5") as Text;
        _timetext_day[2] = View.findDrawableById("LeftLabel_MD6") as Text;
        _timetext_day[3] = View.findDrawableById("LeftLabel_MD7") as Text;



        _label_walk[0] = View.findDrawableById("Label_Walk1") as Text;
        _label_walk[1] = View.findDrawableById("Label_Walk2") as Text;
        _label_walk[2] = View.findDrawableById("Label_Walk3") as Text;
        _label_walk[3] = View.findDrawableById("Label_Walk4") as Text;
        _label_walk[4] = View.findDrawableById("Label_Walk5") as Text;
        _label_walk[5] = View.findDrawableById("Label_Walk6") as Text;
        _label_walk[6] = View.findDrawableById("Label_Walk7") as Text;


        _label_battery[0] = View.findDrawableById("Label_Battery1") as Text;
        _label_battery[1] = View.findDrawableById("Label_Battery2") as Text;
        _label_battery[2] = View.findDrawableById("Label_Battery3") as Text;
        _label_battery[3] = View.findDrawableById("Label_Battery4") as Text;
    }

    function onShow() as Void {
    }



    // Update the view
    function onUpdate(dc as Dc) as Void {
        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);

        var minutes = NumbersToKanjiNumbers(today.min.toNumber()) + "分";
        setCharstoText(minutes, _timetext_mm);
        var hours = NumbersToKanjiNumbers(today.hour.toNumber()) + "時";
        setCharstoText(hours, _timetext_hh);
        System.println("Debug: hour   - " + hours);

        var days = NumbersToKanjiNumbers(today.day.toNumber()) + "日";
        setCharstoText(days, _timetext_day);

        var monthes = NumbersToKanjiNumbers(today.month.toNumber()) + "月";
        setCharstoText(monthes, _timetext_month);


        var myStats = System.getSystemStats();
        var batteries = "電" + NumbersToKanjiNumbers(myStats.battery.toNumber());
        setCharstoText(batteries, _label_battery);
        System.println("Debug: battery - " + batteries);

        var info = ActivityMonitor.getInfo();
        var steps = "歩" + NumbersToKanjiChars(info.steps.toNumber());
        setCharstoText(steps, _label_walk);
        System.println("Debug: steps   - " + steps);


        View.onUpdate(dc);
    }



    function setCharstoText(strs as String, texts as Array<Text>) as Void {
        var chars = strs.toCharArray();
        var space = "" as String;
        try {
            if (chars.size() > texts.size()) {
                throw new Lang.Exception();
            }
            for(var i = 0; i < chars.size(); i++ ) {
                var ch = chars[i].toString();
                texts[i].setText(ch);
            }
            if (texts.size() - chars.size() > 0) {
                for(var i = chars.size(); i < texts.size(); i++ ) {
                    texts[i].setText("" as String);
                }
            }
        }
        catch(e) {
            System.println("Object Size is less than Char size. This cause overflow");
        }
    }

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


    function onHide() as Void {
    }


}
