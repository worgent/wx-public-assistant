!function(){
"object"!=typeof JSON&&(window.JSON={
stringify:function(){
return"";
},
parse:function(){
return{};
}
});
var e=function(){
!function(){
var o={},e={},t={};
o.COMBO_UNLOAD=0,o.COMBO_LOADING=1,o.COMBO_LOADED=2;
var n=function(o,t,n){
if(!e[o]){
e[o]=n;
for(var r=3;r--;)try{
moon.setItem(moon.prefix+o,n.toString()),moon.setItem(moon.prefix+o+"_ver",moon_map[o]);
break;
}catch(i){
moon.clear();
}
}
},r=function(o){
if(!o||!e[o])return null;
var n=e[o];
return"function"!=typeof n||t[o]||(n=e[o]=n(r),t[o]=!0),n;
};
o.combo_status=o.COMBO_UNLOAD,o.run=function(){
var e=o.run.info,t=e&&e[0],n=e&&e[1];
if(t&&o.combo_status==o.COMBO_LOADED){
var i=r(t);
n&&n(i);
}
},o.use=function(e,t){
o.run.info=[e,t],o.run();
},window.define=n,window.seajs=o;
}(),function(){
function o(o){
var e="; "+document.cookie,t=e.split("; "+o+"=");
return 2==t.length?t.pop().split(";").shift():void 0;
}
window.__consoleList=[];
for(var e=window.console,t=function(o){
return function(){
var t=arguments;
window.__consoleList.push({
type:o,
msg:t,
time:+new Date
}),e&&e[o]&&e[o].apply(e,t);
};
},n=["log","info","error","warn","debug"],r={},i=0,a=n.length;a>i;++i){
var c=n[i];
r[c]=t(c);
}
if(window.console=r,window._console=e,window.localStorage&&window.__DEBUGINFO){
var s=o("DEBUG_SWITCH"),l=window.__DEBUGINFO;
if("1"==s&&l.js){
window.__moondebug=!0;
var u=document.createElement("script");
u.src=l.js,u.type="text/javascript",u.async=!0;
var f=document.head||document.getElementsByTagName("head")[0];
f.appendChild(u);
}
}
}(),function(){
function e(o){
return"[object Array]"===Object.prototype.toString.call(o);
}
function t(o){
return"[object Object]"===Object.prototype.toString.call(o);
}
function n(e){
var t=e.stack?e.stack:"";
try{
t=t.replace(/http(s)?:\/\/res\.wx\.qq\.com/g,"");
for(var n=/\/([^.]+)\/(\S+?)\.js(\,|:)?/g;n.test(t);)t=t.replace(n,"$2$3");
}catch(e){
t=e.stack?e.stack:"";
}
var r=[];
for(o in _reportOpt)_reportOpt.hasOwnProperty(o)&&r.push(o+":"+_reportOpt[o]);
return r.push("STK:"+t.replace(/\n/g,"")),r.join("|");
}
function r(o){
if(!o){
var e=window.onerror;
window.onerror=function(){},o=setTimeout(function(){
window.onerror=e,o=null;
},50);
}
}
function i(o){
var e;
if(window.ActiveXObject)try{
e=new ActiveXObject("Msxml2.XMLHTTP");
}catch(t){
try{
e=new ActiveXObject("Microsoft.XMLHTTP");
}catch(n){
e=!1;
}
}else window.XMLHttpRequest&&(e=new XMLHttpRequest);
e&&(e.open("POST",location.protocol+"//mp.weixin.qq.com/mp/jsmonitor?",!0),e.setRequestHeader("cache-control","no-cache"),
e.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8"),
e.setRequestHeader("X-Requested-With","XMLHttpRequest"),e.send(o));
}
function a(o){
return function(e,t){
if("string"==typeof e)try{
e=new Function(e);
}catch(n){
throw n;
}
var i=[].slice.call(arguments,2),a=e;
return e=function(){
try{
return a.apply(this,i.length&&i||arguments);
}catch(o){
throw o.stack&&console&&console.error&&console.error("[TryCatch]"+o.stack),s&&window.__moon_report&&(window.__moon_report([{
offset:m,
log:"timeout_error;host:"+top.location.host,
e:o
}]),r(f)),o;
}
},o(e,t);
};
}
var c=/MicroMessenger/i.test(navigator.userAgent);
if(/mp\.weixin\.qq\.com\/s\?/.test(location.href)&&!(Math.random()>.5)&&c&&top==window){
var s,l,u,f,w=window.define,p=0,m=9,d=10;
if(window.__initCatch=function(o){
s=o.idkey,l=o.startKey||0,u=o.limit||1,_reportOpt=o.reportOpt||"",_extInfo=o.extinfo||"";
},window.__moon_report=function(o){
if(t(o)&&(o=[o]),e(o)&&""!=s){
for(var r="",a=[],c=[],f=[],w=[],p=0;p<o.length;p++){
var m=o[p]||{};
if(!(m.offset>u)&&"number"==typeof m.offset){
var d=l+m.offset;
a[p]="[moon]"+s+"_"+d+";"+m.log+";"+n(m.e||{})||"",c[p]=d,f[p]=1;
}
}
for(var _=0;_<c.length;_++)w[_]=s+"_"+c[_]+"_"+f[_],r=r+"&log"+_+"="+a[_];
w.length>0&&i("idkey="+w.join(";")+"&lc="+a.length+r);
}
},window.setTimeout=a(window.setTimeout),window.setInterval=a(window.setInterval),
window.localStorage&&window.localStorage.setItem){
var _=window.localStorage.setItem;
window.localStorage.setItem=function(o,e){
try{
_.call(window.localStorage,o,e);
}catch(t){
t.stack&&console&&console.error&&console.error("[TryCatch]"+t.stack),window.__moon_report([{
offset:d,
log:"localstorage_error",
e:t
}]);
}
};
}
window.seajs&&w&&(window.define=function(){
for(var o,e=[],t=0,n=arguments.length;n>t;t++){
var i=o=arguments[t];
"function"==typeof o&&(o=function(){
try{
return i.apply(this,arguments);
}catch(o){
throw o.stack&&console&&console.error&&console.error("[TryCatch]"+o.stack),s&&window.__moon_report&&(window.__moon_report([{
offset:p,
log:"define_error",
e:o
}]),r(f)),o;
}
},o.toString=function(o){
return function(){
return o.toString();
};
}(arguments[t])),e.push(o);
}
return w.apply(this,e);
});
}
}(),function(o){
function e(o,e,n){
if("object"==typeof o){
var r=Object.prototype.toString.call(o).replace(/^\[object (.+)\]$/,"$1");
if(n=n||o,"Array"==r){
for(var i=0,a=o.length;a>i;++i)if(e.call(n,o[i],i,o)===!1)return;
}else{
if("Object"!==r&&t!=o)throw"unsupport type";
if(t==o){
for(var i=o.length-1;i>=0;i--){
var c=t.key(i),s=t.getItem(c);
if(e.call(n,s,c,o)===!1)return;
}
return;
}
for(var i in o)if(o.hasOwnProperty(i)&&e.call(n,o[i],i,o)===!1)return;
}
}
}
var t=o.localStorage,n=document.head||document.getElementsByTagName("head")[0],r=1,i={
prefix:"__MOON__",
loaded:[],
unload:[],
hit_num:0,
mod_num:0,
version:1003,
init:function(){
i.loaded=[],i.unload=[];
var n,r,a;
if(t){
var c="_moon_ver_key_",s=t.getItem(c);
s!=i.version&&(i.clear(),t.setItem(c,i.version));
}
if(-1!=location.search.indexOf("no_moon=1")&&i.clear(),t){
var l=1*t.getItem(i.prefix+"clean_time"),u=+new Date;
if(u-l>=1296e6){
i.clear();
try{
!!t&&t.setItem(i.prefix+"clean_time",+new Date);
}catch(f){}
}
}
e(moon_map,function(e,c){
if(r=i.prefix+c,a=!!e&&e.replace(/^http(s)?:\/\/res.wx.qq.com/,""),n=!!t&&t.getItem(r),
version=!!t&&(t.getItem(r+"_ver")||"").replace(/^http(s)?:\/\/res.wx.qq.com/,""),
i.mod_num++,n&&a==version)try{
var s="//# sourceURL="+c+"\n//@ sourceURL="+c;
o.eval.call(o,'define("'+c+'",[],'+n+")"+s),i.hit_num++;
}catch(l){
i.unload.push(a.replace(/^http(s)?:\/\/res.wx.qq.com/,""));
}else i.unload.push(a.replace(/^http(s)?:\/\/res.wx.qq.com/,""));
}),i.load(i.genUrl());
},
genUrl:function(){
var o=i.unload;
if(!o||o.length<=0)return[];
for(var e,t,n="",r=[],a={},c=-1!=location.search.indexOf("no_moon=2"),s=0,l=o.length;l>s;++s)/^\/(.*?)\//.test(o[s]),
RegExp.$1&&(t=RegExp.$1,n=a[t],n?(e=n+","+o[s],e.length>1e3||c?(r.push(n+"?v="+i.version),
n=location.protocol+"//res.wx.qq.com"+o[s],a[t]=n):(n=e,a[t]=n)):(n=location.protocol+"//res.wx.qq.com"+o[s],
a[t]=n));
for(var u in a)a.hasOwnProperty(u)&&r.push(a[u]);
return r;
},
load:function(o){
if(!o||o.length<=0)return seajs.combo_status=seajs.COMBO_LOADED,void seajs.run();
seajs.combo_status=seajs.COMBO_LOADING;
var t=0;
e(o,function(e){
var i=document.createElement("script");
i.src=e,i.type="text/javascript",i.async=!0,i.onerror=function(o){
if(window.__moon_report){
var t=new Error(o);
window.__moon_report([{
offset:r,
log:"load_script_error: "+e,
e:t
}]);
}
},"undefined"!=typeof moon_crossorigin&&moon_crossorigin&&i.setAttribute("crossorigin",!0),
i.onload=i.onreadystatechange=function(){
!i||i.readyState&&!/loaded|complete/.test(i.readyState)||(t++,i.onload=i.onreadystatechange=null,
t==o.length&&(seajs.combo_status=seajs.COMBO_LOADED,seajs.run()));
},n.appendChild(i);
});
},
setItem:function(o,e){
!!t&&t.setItem(o,e);
},
clear:function(){
t&&e(t,function(o,e){
~e.indexOf(i.prefix)&&t.removeItem(e);
});
}
};
window.moon=i;
}(window),window.moon.init();
};
e(),moon.setItem(moon.prefix+"biz_wap/moon.js",e.toString());
}();