System.register(["./p-c9ec67c1.system.js"],(function(t){"use strict";var o,r,n,i;return{setters:[function(t){o=t.r;r=t.c;n=t.h;i=t.H}],execute:function(){var e=":host{--color:#888;--color-sorted:var(--dnn-color-primary, rgb(2,139,255));--color-hover:var(--dnn-color-primary-light, #36a1ff);display:inline-block}button{outline:none;border:none;margin:0;padding:0;background-color:transparent;outline:none;display:inline-block;line-height:1em;position:relative;top:0.25em}button svg{height:1.5em;width:auto;fill:var(--color)}button.active svg{fill:var(--color-sorted)}button:hover svg,button:focus svg{fill:var(--color-hover)}";var s=t("dnn_sort_icon",function(){function t(t){o(this,t);this.sortChanged=r(this,"sortChanged",7);this.sortDirection="none"}t.prototype.changeSort=function(){switch(this.sortDirection){case"asc":this.sortDirection="desc";break;case"desc":this.sortDirection="asc";break;case"none":this.sortDirection="asc";break}this.sortChanged.emit(this.sortDirection)};t.prototype.render=function(){var t=this;return n(i,null,n("button",{class:{active:this.sortDirection!="none"},onClick:function(){return t.changeSort()}},this.sortDirection=="none"&&n("svg",{xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 12 16"},n("path",{d:"M 0 7 H 12 L 6 0 Z M 0 9 H 12 L 6 16 Z"})),this.sortDirection=="asc"&&n("svg",{xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 12 16"},n("path",{d:"M 0 7 H 12 L 6 0 Z"})),this.sortDirection=="desc"&&n("svg",{xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 12 16"},n("path",{d:"M 0 9 H 12 L 6 16 Z"}))))};return t}());s.style=e}}}));
//# sourceMappingURL=p-6a1e7068.system.entry.js.map