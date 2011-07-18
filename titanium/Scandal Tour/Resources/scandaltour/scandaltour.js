/**
 * st is scandaltour class. Main controller for app
 * This follows the pattern laid out in https://github.com/appcelerator-titans/tweetanium
 * @author dcloud
 * @version $Rev$
 */

if (typeof(Number.prototype.toRad) === "undefined") {
    Number.prototype.toRad = function() {
        return this * Math.PI / 180;
    };
}

/** Converts radians to numeric (signed) degrees */
if (typeof(Number.prototype.toDeg) === "undefined") {
    Number.prototype.toDeg = function() {
        return this * 180 / Math.PI;
    };
}

var st = {};

(function() {
    // Application state variables held here
    st.app = {};

    //Extend an object with the properties from another 
    //(thanks Dojo - http://docs.dojocampus.org/dojo/mixin)
    var empty = {};

    function mixin( /*Object*/ target, /*Object*/ source) {
        var name, s, i;
        for (name in source) {
            s = source[name];
            if (!(name in target) || (target[name] !== s && (!(name in empty) || empty[name] !== s))) {
                target[name] = s;
            }
        }
        return target; // Object
    }
    st.mixin = function( /*Object*/ obj, /*Object...*/ props) {
        if (!obj) {
            obj = {};
        }
        for (var i = 1, l = arguments.length; i < l; i++) {
            mixin(obj, arguments[i]);
        }
        return obj; // Object
    };
    //create a new object, combining the properties of the passed objects with the last arguments having
    //priority over the first ones
    st.combine = function( /*Object*/ obj, /*Object...*/ props) {
        var newObj = {};
        for (var i = 0, l = arguments.length; i < l; i++) {
            mixin(newObj, arguments[i]);
        }
        return newObj;
    };

    //OS, Locale, and Density specific branching helpers adapted from the Helium library
    //for Titanium: http://github.com/kwhinnery/Helium
    var locale = Ti.Platform.locale;
    var osname = Ti.Platform.osname;

/*
        Branching logic based on locale
    */
    st.locale = function( /*Object*/ map) {
        var def = map.def || null; //default function or value
        if (map[locale]) {
            if (typeof map[locale] == 'function') {
                return map[locale]();
            } else {
                return map[locale];
            }
        } else {
            if (typeof def == 'function') {
                return def();
            } else {
                return def;
            }
        }
    };

/*
        Branching logic based on OS
    */
    st.os = function( /*Object*/ map) {
        var def = map.def || null; //default function or value
        if (typeof map[osname] != 'undefined') {
            if (typeof map[osname] == 'function') {
                return map[osname]();
            } else {
                return map[osname];
            }
        } else {
            if (typeof def == 'function') {
                return def();
            } else {
                return def;
            }
        }
    };
})();

//Include additional Tweetanium namespaces
Ti.include('/scandaltour/ui/ui.js', '/scandaltour/model/model.js', '/scandaltour/config/config.js');
