import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time.Gregorian;
import Toybox.ActivityMonitor;

class ViewUtil {
    function setCharstoText(strs as String, texts as Array<Text>) as Void {
        var chars = strs.toCharArray();
        var space = "" as String;
        for(var i = 0; i < texts.size(); i++ ) {
            texts[i].setText("");
        }
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
}