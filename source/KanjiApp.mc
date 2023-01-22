import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class KanjiApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new KanjiView() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as KanjiApp {
    return Application.getApp() as KanjiApp;
}