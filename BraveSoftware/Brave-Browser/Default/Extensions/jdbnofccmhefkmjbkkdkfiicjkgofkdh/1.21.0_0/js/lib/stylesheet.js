/*! (c) Philipp König under GPL-3.0 */
(e=>{"use strict";e.StylesheetHelper=function(t){const l=["overlay","sidebar","content"];let s={},a="",n="",h=!1;this.init=e=>{e&&e.defaultVal&&!0===e.defaultVal&&(h=!0),s=t.helper.model.getData("a/styles",h),n=t.helper.model.getData("a/theme"),a=t.helper.model.getData("u/customCss")},this.getStylesheetFilesWithThemes=e=>{const t=e;return n&&"default"!==n&&e.forEach((e=>{l.includes(e)&&t.push("themes/"+n+"/"+e)})),t},this.addStylesheets=(l,n=null)=>new Promise((i=>{null===n?n=e(document):(t.helper.font.addStylesheet(n,h?"default":"config"),e.cl&&e.cl.page&&!1===t.helper.model.getData("b/animations")&&e.cl.page.noAnimations&&n.find("body").addClass(e.cl.page.noAnimations));let d=null;d=0===n.find("head").length()?n.find("body"):n.find("head");let o=0;this.getStylesheetFilesWithThemes(l).forEach((t=>{e.xhr(e.api.extension.getURL("css/"+t+".css")).then((n=>{if(n.response){let l=n.response;l+=a,Object.keys(s).forEach((e=>{l=l.replace(new RegExp('"?%'+e+'"?',"g"),s[e])})),e.cl&&e.cl.page&&e.cl.page.style&&e.attr&&e.attr.name?(d.find("style."+e.cl.page.style+"["+e.attr.name+"='"+t+"']").remove(),d.append("<style class='"+e.cl.page.style+"' "+e.attr.name+"='"+t+"'>"+l+"</style>")):d.append("<style>"+l+"</style>")}o++,o>=l.length&&i()}))}))}))}})(jsu);