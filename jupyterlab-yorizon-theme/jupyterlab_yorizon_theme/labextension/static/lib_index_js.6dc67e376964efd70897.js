"use strict";
(self["webpackChunkjupyterlab_yorizon_theme"] = self["webpackChunkjupyterlab_yorizon_theme"] || []).push([["lib_index_js"],{

/***/ "./lib/index.js"
/*!**********************!*\
  !*** ./lib/index.js ***!
  \**********************/
(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _jupyterlab_apputils__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @jupyterlab/apputils */ "webpack/sharing/consume/default/@jupyterlab/apputils");
/* harmony import */ var _jupyterlab_apputils__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_jupyterlab_apputils__WEBPACK_IMPORTED_MODULE_0__);

const plugin = {
    id: 'jupyterlab-yorizon-theme:plugin',
    description: 'Yorizon dark theme for JupyterLab',
    autoStart: true,
    requires: [_jupyterlab_apputils__WEBPACK_IMPORTED_MODULE_0__.IThemeManager],
    activate: (app, manager) => {
        const style = 'jupyterlab-yorizon-theme/index.css';
        manager.register({
            name: 'Yorizon Dark',
            isLight: false,
            themeScrollbars: true,
            load: () => manager.loadCSS(style),
            unload: () => Promise.resolve(undefined)
        });
    }
};
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (plugin);


/***/ }

}]);
//# sourceMappingURL=lib_index_js.6dc67e376964efd70897.js.map