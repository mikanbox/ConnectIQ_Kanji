import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time.Gregorian;
import Toybox.ActivityMonitor;

class ViewController {
    function init() {
        var kanjiview = new KanjiView();
        return [kanjiview] as Array<Views or InputDelegates>;
    }
}

class TimeView extends ViewUtil {
    public var text_mm as Array<Text> = new[4] as Array<Text>;
    public var text_hh as Array<Text> = new[4] as Array<Text>;

    function initialize(view) {
        text_hh[0] = view.findDrawableById("MainLabel_HHMM1") as Text;
        text_hh[1] = view.findDrawableById("MainLabel_HHMM2") as Text;
        text_hh[2] = view.findDrawableById("MainLabel_HHMM3") as Text;
        text_hh[3] = view.findDrawableById("MainLabel_HHMM4") as Text;

        text_mm[0] = view.findDrawableById("MainLabel_HHMM5") as Text;
        text_mm[1] = view.findDrawableById("MainLabel_HHMM6") as Text;
        text_mm[2] = view.findDrawableById("MainLabel_HHMM7") as Text;
        text_mm[3] = view.findDrawableById("MainLabel_HHMM8") as Text;
    }

    function update() {
        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var minutes = Num2Kanji.NumbersToKanjiNumbers(today.min.toNumber()) + "分";
        setCharstoText(minutes, text_mm);
        var hours = Num2Kanji.NumbersToKanjiNumbers(today.hour.toNumber()) + "時";
        setCharstoText(hours, text_hh);
    }
}

class DateView extends ViewUtil {
    public var _timetext_month as Array<Text> = new[3] as Array<Text>;
    public var _timetext_day as Array<Text> = new[4] as Array<Text>;

    function initialize(view) {
        _timetext_month[0] = view.findDrawableById("LeftLabel_MD1") as Text;
        _timetext_month[1] = view.findDrawableById("LeftLabel_MD2") as Text;
        _timetext_month[2] = view.findDrawableById("LeftLabel_MD3") as Text;

        _timetext_day[0] = view.findDrawableById("LeftLabel_MD4") as Text;
        _timetext_day[1] = view.findDrawableById("LeftLabel_MD5") as Text;
        _timetext_day[2] = view.findDrawableById("LeftLabel_MD6") as Text;
        _timetext_day[3] = view.findDrawableById("LeftLabel_MD7") as Text;
    }

    function update() {
        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var days = Num2Kanji.NumbersToKanjiNumbers(today.day.toNumber()) + "日";
        setCharstoText(days, _timetext_day);

        var monthes = Num2Kanji.NumbersToKanjiNumbers(today.month.toNumber()) + "月";
        setCharstoText(monthes, _timetext_month);
    }
}

class BatteryView extends ViewUtil  {
        public var _label_battery as Array<Text> = new[4] as Array<Text>;
    function initialize(view) {
        _label_battery[0] = View.findDrawableById("Label_Battery1") as Text;
        _label_battery[1] = View.findDrawableById("Label_Battery2") as Text;
        _label_battery[2] = View.findDrawableById("Label_Battery3") as Text;
        _label_battery[3] = View.findDrawableById("Label_Battery4") as Text;
    }
    function update() {
        // var myStats = System.getSystemStats();
        // var batteries = "電" + NumbersToKanjiNumbers(myStats.battery.toNumber());
        // setCharstoText(batteries, _label_battery);
        // System.println("Debug: battery - " + batteries);
    }
}

class WalkView extends ViewUtil  {
    public var _label_walk as Array<Text> = new[7] as Array<Text>;
    function initialize(view) {
        _label_walk[0] = View.findDrawableById("Label_Walk1") as Text;
        _label_walk[1] = View.findDrawableById("Label_Walk2") as Text;
        _label_walk[2] = View.findDrawableById("Label_Walk3") as Text;
        _label_walk[3] = View.findDrawableById("Label_Walk4") as Text;
        _label_walk[4] = View.findDrawableById("Label_Walk5") as Text;
        _label_walk[5] = View.findDrawableById("Label_Walk6") as Text;
        _label_walk[6] = View.findDrawableById("Label_Walk7") as Text;
    }
    function update() {
        // var info = ActivityMonitor.getInfo();
        // var steps = "歩" + NumbersToKanjiChars(info.steps.toNumber());
        // setCharstoText(steps, _label_walk);
        // System.println("Debug: steps   - " + steps);
    }
}

class KanjiView extends WatchUi.WatchFace {

    private var timeview;
    private var dateview;
    private var walkview;
    private var batteryview;

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
        timeview = new TimeView(me as View);
        dateview = new DateView(me as View);
    }

    function onUpdate(dc as Dc) as Void {
        timeview.update();
        dateview.update();

        View.onUpdate(dc);
    }

    function onHide() as Void {
    }
    function onShow() as Void {
    }
}
