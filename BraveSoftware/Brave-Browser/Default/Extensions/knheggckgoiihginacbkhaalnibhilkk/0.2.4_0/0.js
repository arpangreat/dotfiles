(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[0],{

/***/ "./src/client/components/UseTheAppReminder.tsx":
/*!*****************************************************!*\
  !*** ./src/client/components/UseTheAppReminder.tsx ***!
  \*****************************************************/
/*! exports provided: UseTheAppReminder */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "UseTheAppReminder", function() { return UseTheAppReminder; });
/* harmony import */ var core_js_modules_es6_regexp_split__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! core-js/modules/es6.regexp.split */ "./node_modules/core-js/modules/es6.regexp.split.js");
/* harmony import */ var core_js_modules_es6_regexp_split__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(core_js_modules_es6_regexp_split__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var core_js_modules_web_dom_iterable__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! core-js/modules/web.dom.iterable */ "./node_modules/core-js/modules/web.dom.iterable.js");
/* harmony import */ var core_js_modules_web_dom_iterable__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(core_js_modules_web_dom_iterable__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! react */ "./node_modules/react/index.js");
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var _hooks_useEnvironment__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../hooks/useEnvironment */ "./src/client/hooks/useEnvironment.ts");
/* harmony import */ var _config__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../config */ "./src/client/config.ts");
/* harmony import */ var _stores_AppStore__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ../stores/AppStore */ "./src/client/stores/AppStore.ts");
/* harmony import */ var _hooks_useStore__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ../hooks/useStore */ "./src/client/hooks/useStore.ts");
/* harmony import */ var _hooks_useStyles__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ../hooks/useStyles */ "./src/client/hooks/useStyles.ts");
/* harmony import */ var _shared_utils__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ../../shared/utils */ "./src/shared/utils.ts");



/* =============================================================================

    UseTheAppReminder.

============================================================================= */






 // Copied from https://groups.google.com/a/makenotion.com/g/ops/members

const emailsThatShouldPreferTheDesktopApp = new Set("\nabhay@makenotion.com\nalicia@makenotion.com\narty@makenotion.com\naustin@makenotion.com\nchet@makenotion.com\nchristine@makenotion.com\ncorrin@makenotion.com\nblackmad@makenotion.com\ndavidhe@makenotion.com\nerina@makenotion.com\ngarrett@makenotion.com\ngreg@makenotion.com\njake@makenotion.com\nkarn@makenotion.com\nlauren@makenotion.com\nmatt@makenotion.com\nmbg@makenotion.com\nmlm@makenotion.com\nparthiv@makenotion.com\nrbscott@makenotion.com\nryan@makenotion.com\nsebastian@makenotion.com\nslim@makenotion.com\nvarun@makenotion.com\nvicky@makenotion.com\nzeno@makenotion.com\n".split(/\s+/g).filter(Boolean));
const hands = "🙏";
const text = hands + " Please use the desktop app " + hands;
const rainbow = "#ef3550\n\t#f48fb1\n\t#7e57c2\n\t#2196f3\n\t#26c6da\n\t#43a047\n\t#eeff41\n\t#f9a825\n\t#ff5722".split(/\s+/g).filter(Boolean);
function UseTheAppReminder(props) {
  const environment = Object(_hooks_useEnvironment__WEBPACK_IMPORTED_MODULE_3__["useEnvironment"])();
  const shouldUseTheApp = Object(_hooks_useStore__WEBPACK_IMPORTED_MODULE_6__["useComputedStore"])(() => {
    const device = environment.device;

    if (device.isMobile || device.isNative) {
      return false;
    }

    const {
      currentUserStore
    } = _stores_AppStore__WEBPACK_IMPORTED_MODULE_5__["default"].state;

    if (!currentUserStore) {
      return false;
    }

    const email = currentUserStore.getEmail() || "";
    return emailsThatShouldPreferTheDesktopApp.has(email) || _config__WEBPACK_IMPORTED_MODULE_4__["default"].env === "local";
  }, []);

  if (!shouldUseTheApp) {
    return null;
  }

  return react__WEBPACK_IMPORTED_MODULE_2___default.a.createElement(CrazyText, null, text);
}

function CrazyText(props) {
  const [index, setIndex] = Object(react__WEBPACK_IMPORTED_MODULE_2__["useState"])(0);
  Object(react__WEBPACK_IMPORTED_MODULE_2__["useEffect"])(() => {
    const interval = window.setInterval(() => setIndex(index => (index - 1) % rainbow.length), 2 * _shared_utils__WEBPACK_IMPORTED_MODULE_8__["SecondMs"]);
    return () => window.clearInterval(interval);
  }, []);
  const styles = Object(_hooks_useStyles__WEBPACK_IMPORTED_MODULE_7__["useStyles"])(theme => {
    const rotatedRainbow = [...rainbow.slice(index), ...rainbow.slice(0, index)].map((color, index) => "".concat(-4 * (index + 1), "px ").concat(4 * (index + 1), "px ").concat(color)).join(",");
    return {
      main: {
        fontSize: "48px",
        fontFamily: "Comic Sans MS",
        textShadow: rotatedRainbow,
        pointerEvents: "none",
        opacity: 0.5,
        position: "fixed",
        bottom: 30,
        right: 70,
        color: theme.regularTextColor,
        zIndex: 1000
      }
    };
  }, [index]);
  return react__WEBPACK_IMPORTED_MODULE_2___default.a.createElement("div", {
    style: styles.main
  }, props.children);
}

/***/ })

}]);