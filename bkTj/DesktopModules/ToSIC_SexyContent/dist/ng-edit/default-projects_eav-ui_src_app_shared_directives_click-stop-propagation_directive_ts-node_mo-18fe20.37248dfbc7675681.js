"use strict";(self.webpackChunkeav_ui=self.webpackChunkeav_ui||[]).push([["default-projects_eav-ui_src_app_shared_directives_click-stop-propagation_directive_ts-node_mo-18fe20","projects_eav-ui_src_app_shared_directives_click-stop-propagation_directive_ts"],{504:(ne,H,F)=>{F.d(H,{c:()=>R});var L=F(4896);let R=(()=>{class T{onClick(w){w.stopPropagation()}static#t=this.\u0275fac=function(p){return new(p||T)};static#e=this.\u0275dir=L.Sc5({type:T,selectors:[["","appClickStopPropagation",""]],hostBindings:function(p,z){1&p&&L.qCj("click",function(V){return z.onClick(V)})}})}return T})()},4192:(ne,H,F)=>{F.d(H,{c:()=>ms});const ot=function T(t,e){return t===e||t!=t&&e!=e},p=function w(t,e){for(var n=t.length;n--;)if(ot(t[n][0],e))return n;return-1};var st=Array.prototype.splice;function v(t){var e=-1,n=null==t?0:t.length;for(this.clear();++e<n;){var r=t[e];this.set(r[0],r[1])}}v.prototype.clear=function L(){this.__data__=[],this.size=0},v.prototype.delete=function V(t){var e=this.__data__,n=p(e,t);return!(n<0||(n==e.length-1?e.pop():st.call(e,n,1),--this.size,0))},v.prototype.get=function ae(t){var e=this.__data__,n=p(e,t);return n<0?void 0:e[n][1]},v.prototype.has=function se(t){return p(this.__data__,t)>-1},v.prototype.set=function ce(t,e){var n=this.__data__,r=p(n,t);return r<0?(++this.size,n.push([t,e])):n[r][1]=e,this};const G=v,it="object"==typeof global&&global&&global.Object===Object&&global;var Te="object"==typeof self&&self&&self.Object===Object&&self;const f=it||Te||Function("return this")(),C=f.Symbol;var ct=Object.prototype,je=ct.hasOwnProperty,Ae=ct.toString,I=C?C.toStringTag:void 0;var we=Object.prototype.toString;var _t=C?C.toStringTag:void 0;const P=function Ee(t){return null==t?void 0===t?"[object Undefined]":"[object Null]":_t&&_t in Object(t)?function me(t){var e=je.call(t,I),n=t[I];try{t[I]=void 0;var r=!0}catch{}var c=Ae.call(t);return r&&(e?t[I]=n:delete t[I]),c}(t):function Ie(t){return we.call(t)}(t)},x=function Me(t){var e=typeof t;return null!=t&&("object"==e||"function"==e)},lt=function Ue(t){if(!x(t))return!1;var e=P(t);return"[object Function]"==e||"[object GeneratorFunction]"==e||"[object AsyncFunction]"==e||"[object Proxy]"==e};var t,Ke=f["__core-js_shared__"],ut=(t=/[^.]+$/.exec(Ke&&Ke.keys&&Ke.keys.IE_PROTO||""))?"Symbol(src)_1."+t:"";var ze=Function.prototype.toString;const b=function Ve(t){if(null!=t){try{return ze.call(t)}catch{}try{return t+""}catch{}}return""};var $e=/^\[object .+?Constructor\]$/,Xe=RegExp("^"+Function.prototype.toString.call(Object.prototype.hasOwnProperty).replace(/[\\^$.*+?()[\]{}|]/g,"\\$&").replace(/hasOwnProperty|(function).*?(?=\\\()| for .+?(?=\\\])/g,"$1.*?")+"$");const Qe=function Ze(t){return!(!x(t)||function Ne(t){return!!ut&&ut in t}(t))&&(lt(t)?Xe:$e).test(b(t))},y=function nn(t,e){var n=function tn(t,e){return t?.[e]}(t,e);return Qe(n)?n:void 0},B=y(f,"Map"),E=y(Object,"create");var fn=Object.prototype.hasOwnProperty;var yn=Object.prototype.hasOwnProperty;function j(t){var e=-1,n=null==t?0:t.length;for(this.clear();++e<n;){var r=t[e];this.set(r[0],r[1])}}j.prototype.clear=function on(){this.__data__=E?E(null):{},this.size=0},j.prototype.delete=function cn(t){var e=this.has(t)&&delete this.__data__[t];return this.size-=e?1:0,e},j.prototype.get=function pn(t){var e=this.__data__;if(E){var n=e[t];return"__lodash_hash_undefined__"===n?void 0:n}return fn.call(e,t)?e[t]:void 0},j.prototype.has=function hn(t){var e=this.__data__;return E?void 0!==e[t]:yn.call(e,t)},j.prototype.set=function vn(t,e){var n=this.__data__;return this.size+=this.has(t)?0:1,n[t]=E&&void 0===e?"__lodash_hash_undefined__":e,this};const ft=j,U=function On(t,e){var n=t.__data__;return function mn(t){var e=typeof t;return"string"==e||"number"==e||"symbol"==e||"boolean"==e?"__proto__"!==t:null===t}(e)?n["string"==typeof e?"string":"hash"]:n.map};function A(t){var e=-1,n=null==t?0:t.length;for(this.clear();++e<n;){var r=t[e];this.set(r[0],r[1])}}A.prototype.clear=function jn(){this.size=0,this.__data__={hash:new ft,map:new(B||G),string:new ft}},A.prototype.delete=function wn(t){var e=U(this,t).delete(t);return this.size-=e?1:0,e},A.prototype.get=function Pn(t){return U(this,t).get(t)},A.prototype.has=function Bn(t){return U(this,t).has(t)},A.prototype.set=function Mn(t,e){var n=U(this,t),r=n.size;return n.set(t,e),this.size+=n.size==r?0:1,this};const Fn=A;function m(t){var e=this.__data__=new G(t);this.size=e.size}m.prototype.clear=function le(){this.__data__=new G,this.size=0},m.prototype.delete=function fe(t){var e=this.__data__,n=e.delete(t);return this.size=e.size,n},m.prototype.get=function ge(t){return this.__data__.get(t)},m.prototype.has=function ye(t){return this.__data__.has(t)},m.prototype.set=function Gn(t,e){var n=this.__data__;if(n instanceof G){var r=n.__data__;if(!B||r.length<199)return r.push([t,e]),this.size=++n.size,this;n=this.__data__=new Fn(r)}return n.set(t,e),this.size=n.size,this};const Kn=m;var Rn=function(){try{var t=y(Object,"defineProperty");return t({},"",{}),t}catch{}}();const pt=Rn,gt=function zn(t,e,n){"__proto__"==e&&pt?pt(t,e,{configurable:!0,enumerable:!0,value:n,writable:!0}):t[e]=n};var kn=Object.prototype.hasOwnProperty;const bt=function $n(t,e,n){var r=t[e];(!kn.call(t,e)||!ot(r,n)||void 0===n&&!(e in t))&&gt(t,e,n)},K=function Wn(t,e,n,r){var c=!n;n||(n={});for(var i=-1,s=e.length;++i<s;){var _=e[i],l=r?r(n[_],t[_],_,n,t):void 0;void 0===l&&(l=t[_]),c?gt(n,_,l):bt(n,_,l)}return n},M=function Jn(t){return null!=t&&"object"==typeof t},yt=function Zn(t){return M(t)&&"[object Arguments]"==P(t)};var ht=Object.prototype,Qn=ht.hasOwnProperty,tr=ht.propertyIsEnumerable,er=yt(function(){return arguments}())?yt:function(t){return M(t)&&Qn.call(t,"callee")&&!tr.call(t,"callee")};const nr=er,$=Array.isArray;var dt="object"==typeof exports&&exports&&!exports.nodeType&&exports,Tt=dt&&"object"==typeof module&&module&&!module.nodeType&&module,vt=Tt&&Tt.exports===dt?f.Buffer:void 0;const Ct=(vt?vt.isBuffer:void 0)||function ar(){return!1};var lr=/^(?:0|[1-9]\d*)$/;const fr=function ur(t,e){var n=typeof t;return!!(e=e??9007199254740991)&&("number"==n||"symbol"!=n&&lr.test(t))&&t>-1&&t%1==0&&t<e},jt=function gr(t){return"number"==typeof t&&t>-1&&t%1==0&&t<=9007199254740991};var o={};o["[object Float32Array]"]=o["[object Float64Array]"]=o["[object Int8Array]"]=o["[object Int16Array]"]=o["[object Int32Array]"]=o["[object Uint8Array]"]=o["[object Uint8ClampedArray]"]=o["[object Uint16Array]"]=o["[object Uint32Array]"]=!0,o["[object Arguments]"]=o["[object Array]"]=o["[object ArrayBuffer]"]=o["[object Boolean]"]=o["[object DataView]"]=o["[object Date]"]=o["[object Error]"]=o["[object Function]"]=o["[object Map]"]=o["[object Number]"]=o["[object Object]"]=o["[object RegExp]"]=o["[object Set]"]=o["[object String]"]=o["[object WeakMap]"]=!1;const W=function Hr(t){return function(e){return t(e)}};var At="object"==typeof exports&&exports&&!exports.nodeType&&exports,D=At&&"object"==typeof module&&module&&!module.nodeType&&module,q=D&&D.exports===At&&it.process;const S=function(){try{return D&&D.require&&D.require("util").types||q&&q.binding&&q.binding("util")}catch{}}();var mt=S&&S.isTypedArray;const kr=mt?W(mt):function Kr(t){return M(t)&&jt(t.length)&&!!o[P(t)]};var Wr=Object.prototype.hasOwnProperty;const St=function qr(t,e){var n=$(t),r=!n&&nr(t),c=!n&&!r&&Ct(t),i=!n&&!r&&!c&&kr(t),s=n||r||c||i,_=s?function qn(t,e){for(var n=-1,r=Array(t);++n<t;)r[n]=e(n);return r}(t.length,String):[],l=_.length;for(var u in t)(e||Wr.call(t,u))&&(!s||!("length"==u||c&&("offset"==u||"parent"==u)||i&&("buffer"==u||"byteLength"==u||"byteOffset"==u)||fr(u,l)))&&_.push(u);return _};var Yr=Object.prototype;const Y=function Jr(t){var e=t&&t.constructor;return t===("function"==typeof e&&e.prototype||Yr)},Ot=function Xr(t,e){return function(n){return t(e(n))}},Qr=Ot(Object.keys,Object);var ea=Object.prototype.hasOwnProperty;const wt=function aa(t){return null!=t&&jt(t.length)&&!lt(t)},J=function oa(t){return wt(t)?St(t):function na(t){if(!Y(t))return Qr(t);var e=[];for(var n in Object(t))ea.call(t,n)&&"constructor"!=n&&e.push(n);return e}(t)};var ua=Object.prototype.hasOwnProperty;const pa=function fa(t){if(!x(t))return function ca(t){var e=[];if(null!=t)for(var n in Object(t))e.push(n);return e}(t);var e=Y(t),n=[];for(var r in t)"constructor"==r&&(e||!ua.call(t,r))||n.push(r);return n},X=function ga(t){return wt(t)?St(t,!0):pa(t)};var It="object"==typeof exports&&exports&&!exports.nodeType&&exports,Pt=It&&"object"==typeof module&&module&&!module.nodeType&&module,xt=Pt&&Pt.exports===It?f.Buffer:void 0,Bt=xt?xt.allocUnsafe:void 0;const Et=function ma(){return[]};var Oa=Object.prototype.propertyIsEnumerable,Mt=Object.getOwnPropertySymbols,wa=Mt?function(t){return null==t?[]:(t=Object(t),function ja(t,e){for(var n=-1,r=null==t?0:t.length,c=0,i=[];++n<r;){var s=t[n];e(s,n,t)&&(i[c++]=s)}return i}(Mt(t),function(e){return Oa.call(t,e)}))}:Et;const Z=wa,Dt=function xa(t,e){for(var n=-1,r=e.length,c=t.length;++n<r;)t[c+n]=e[n];return t},Ft=Ot(Object.getPrototypeOf,Object);var Ma=Object.getOwnPropertySymbols?function(t){for(var e=[];t;)Dt(e,Z(t)),t=Ft(t);return e}:Et;const Lt=Ma,Gt=function La(t,e,n){var r=e(t);return $(t)?r:Dt(r,n(t))},Ua=function Ga(t){return Gt(t,J,Z)},Na=function Ka(t){return Gt(t,X,Lt)},Q=y(f,"DataView"),tt=y(f,"Promise"),et=y(f,"Set"),nt=y(f,"WeakMap");var Ut="[object Map]",Kt="[object Promise]",Nt="[object Set]",Ht="[object WeakMap]",Rt="[object DataView]",$a=b(Q),Wa=b(B),qa=b(tt),Ya=b(et),Ja=b(nt),h=P;(Q&&h(new Q(new ArrayBuffer(1)))!=Rt||B&&h(new B)!=Ut||tt&&h(tt.resolve())!=Kt||et&&h(new et)!=Nt||nt&&h(new nt)!=Ht)&&(h=function(t){var e=P(t),n="[object Object]"==e?t.constructor:void 0,r=n?b(n):"";if(r)switch(r){case $a:return Rt;case Wa:return Ut;case qa:return Kt;case Ya:return Nt;case Ja:return Ht}return e});const rt=h;var Za=Object.prototype.hasOwnProperty;const zt=f.Uint8Array,at=function no(t){var e=new t.constructor(t.byteLength);return new zt(e).set(new zt(t)),e};var oo=/\w*$/;var Vt=C?C.prototype:void 0,kt=Vt?Vt.valueOf:void 0;const Mo=function Eo(t,e,n){var r=t.constructor;switch(e){case"[object ArrayBuffer]":return at(t);case"[object Boolean]":case"[object Date]":return new r(+t);case"[object DataView]":return function ro(t,e){var n=e?at(t.buffer):t.buffer;return new t.constructor(n,t.byteOffset,t.byteLength)}(t,n);case"[object Float32Array]":case"[object Float64Array]":case"[object Int8Array]":case"[object Int16Array]":case"[object Int32Array]":case"[object Uint8Array]":case"[object Uint8ClampedArray]":case"[object Uint16Array]":case"[object Uint32Array]":return function lo(t,e){var n=e?at(t.buffer):t.buffer;return new t.constructor(n,t.byteOffset,t.length)}(t,n);case"[object Map]":case"[object Set]":return new r;case"[object Number]":case"[object String]":return new r(t);case"[object RegExp]":return function so(t){var e=new t.constructor(t.source,oo.exec(t));return e.lastIndex=t.lastIndex,e}(t);case"[object Symbol]":return function co(t){return kt?Object(kt.call(t)):{}}(t)}};var $t=Object.create,Do=function(){function t(){}return function(e){if(!x(e))return{};if($t)return $t(e);t.prototype=e;var n=new t;return t.prototype=void 0,n}}();const Fo=Do;var Wt=S&&S.isMap;const Ro=Wt?W(Wt):function Ko(t){return M(t)&&"[object Map]"==rt(t)};var qt=S&&S.isSet;const Wo=qt?W(qt):function Vo(t){return M(t)&&"[object Set]"==rt(t)};var Yt="[object Arguments]",Jt="[object Function]",Xt="[object Object]",a={};a[Yt]=a["[object Array]"]=a["[object ArrayBuffer]"]=a["[object DataView]"]=a["[object Boolean]"]=a["[object Date]"]=a["[object Float32Array]"]=a["[object Float64Array]"]=a["[object Int8Array]"]=a["[object Int16Array]"]=a["[object Int32Array]"]=a["[object Map]"]=a["[object Number]"]=a[Xt]=a["[object RegExp]"]=a["[object Set]"]=a["[object String]"]=a["[object Symbol]"]=a["[object Uint8Array]"]=a["[object Uint8ClampedArray]"]=a["[object Uint16Array]"]=a["[object Uint32Array]"]=!0,a["[object Error]"]=a[Jt]=a["[object WeakMap]"]=!1;const vs=function N(t,e,n,r,c,i){var s,_=1&e,l=2&e,u=4&e;if(n&&(s=c?n(t,r,c,i):n(t)),void 0!==s)return s;if(!x(t))return t;var Zt=$(t);if(Zt){if(s=function Qa(t){var e=t.length,n=new t.constructor(e);return e&&"string"==typeof t[0]&&Za.call(t,"index")&&(n.index=t.index,n.input=t.input),n}(t),!_)return function va(t,e){var n=-1,r=t.length;for(e||(e=Array(r));++n<r;)e[n]=t[n];return e}(t,s)}else{var O=rt(t),Qt=O==Jt||"[object GeneratorFunction]"==O;if(Ct(t))return function da(t,e){if(e)return t.slice();var n=t.length,r=Bt?Bt(n):new t.constructor(n);return t.copy(r),r}(t,_);if(O==Xt||O==Yt||Qt&&!c){if(s=l||Qt?{}:function Lo(t){return"function"!=typeof t.constructor||Y(t)?{}:Fo(Ft(t))}(t),!_)return l?function Da(t,e){return K(t,Lt(t),e)}(t,function ba(t,e){return t&&K(e,X(e),t)}(s,t)):function Ia(t,e){return K(t,Z(t),e)}(t,function sa(t,e){return t&&K(e,J(e),t)}(s,t))}else{if(!a[O])return c?t:{};s=Mo(t,O,_)}}i||(i=new Kn);var te=i.get(t);if(te)return te;i.set(t,s),Wo(t)?t.forEach(function(g){s.add(N(g,e,n,g,t,i))}):Ro(t)&&t.forEach(function(g,d){s.set(d,N(g,e,n,d,t,i))});var ee=Zt?void 0:(u?l?Na:Ua:l?X:J)(t);return function Nn(t,e){for(var n=-1,r=null==t?0:t.length;++n<r&&!1!==e(t[n],n,t););}(ee||t,function(g,d){ee&&(g=t[d=g]),bt(s,d,N(g,e,n,d,t,i))}),s},ms=function As(t){return vs(t,5)}}}]);
//# sourceMappingURL=https://sources.2sxc.org/17.04.00/dist/ng-edit/default-projects_eav-ui_src_app_shared_directives_click-stop-propagation_directive_ts-node_mo-18fe20.37248dfbc7675681.js.map