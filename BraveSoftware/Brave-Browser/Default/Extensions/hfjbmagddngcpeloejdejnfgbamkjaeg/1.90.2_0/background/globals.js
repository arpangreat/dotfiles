"use strict";var a,f,o,g,v,n,r,l,Exclusions,c;f=0|(navigator.appVersion.match(/\bChrom(?:e|ium)\/(\d+)/)||[0,998])[1],o=/\sEdg\//.test(navigator.appVersion),g=999,v="chrome",75===f&&matchMedia("(prefers-color-scheme)").matches&&(f=81),n=chrome.i18n.getMessage,r={i:function(e,t){for(var n in t)n in e||(e[n]=t[n]);return e},h:function(e){var t,n,a;for(t=[],a=e.keys();!(n=a.next()).done;)t.push(n.value);return t},b:function(){},w:/a?/,y:function(){return this.w.test("")},x:function(){return chrome.runtime.lastError},S:function(e){return e.length>1?"<escape>"===e?"esc":e.slice(1,-1):e},j:function(e,t,n){var a=n<e.length&&n>t?e.charCodeAt(n-1):0;return e.slice(t,n+=a>=55296&&a<56320?1:8205===a&&n>t+1?-1:0)},z:function(e,t,n){var a=t>0&&t<e.length?e.charCodeAt(t):0;return e.slice(t+=a>=56320&&a<=57343?-1:8205===a&&t<e.length-1&&t<n-1?1:0,n)},$:function(e){function t(e){var t=e.charCodeAt(0);return 38===t?"&amp;":39===t?"&apos;":t<39?"&quot;":60===t?"&lt;":"&gt;"}var n=/["&'<>]/g;return this.$=function(e){return e.replace(n,t)},this.$(e)},R:function(e){return 58===e.charCodeAt(10)&&"javascript"===e.slice(0,10).toLowerCase()},P:function(e){return e=e.slice(0,99).toLowerCase(),1!==l.q.get(e)&&(e.startsWith("about:")?"about:blank"!==e:e.startsWith("chrome:")?!e.startsWith("chrome://downloads"):e.startsWith(v)&&!e.startsWith(l.L.U)||o&&/^(edge|extension):/.test(e)&&!e.startsWith("edge://downloads"))},E:".\u4e2d\u4fe1.\u4e2d\u56fd.\u4e2d\u570b.\u4e2d\u6587\u7f51.\u4f01\u4e1a.\u4f5b\u5c71.\u4fe1\u606f.\u516c\u53f8.\u516c\u76ca.\u5546\u57ce.\u5546\u5e97.\u5546\u6807.\u5728\u7ebf.\u5a31\u4e50.\u5e7f\u4e1c.\u6211\u7231\u4f60.\u624b\u673a.\u62db\u8058.\u653f\u52a1.\u6e38\u620f.\u7f51\u5740.\u7f51\u5e97.\u7f51\u5e97.\u7f51\u7edc.\u8d2d\u7269.\u96c6\u56e2.\u9910\u5385.",I:["","",".ac.ad.ae.af.ag.ai.al.am.ao.aq.ar.as.at.au.aw.ax.az.ba.bb.bd.be.bf.bg.bh.bi.bj.bm.bn.bo.br.bs.bt.bv.bw.by.bz.ca.cc.cd.cf.cg.ch.ci.ck.cl.cm.cn.co.cr.cu.cv.cw.cx.cy.cz.de.dj.dk.dm.do.dz.ec.ee.eg.er.es.et.eu.fi.fj.fk.fm.fo.fr.ga.gb.gd.ge.gf.gg.gh.gi.gl.gm.gn.gp.gq.gr.gs.gt.gu.gw.gy.hk.hm.hn.hr.ht.hu.id.ie.il.im.in.io.iq.ir.is.it.je.jm.jo.jp.ke.kg.kh.ki.km.kn.kp.kr.kw.ky.kz.la.lb.lc.li.lk.lr.ls.lt.lu.lv.ly.ma.mc.md.me.mg.mh.mk.ml.mm.mn.mo.mp.mq.mr.ms.mt.mu.mv.mw.mx.my.mz.na.nc.ne.nf.ng.ni.nl.no.np.nr.nu.nz.om.pa.pe.pf.pg.ph.pk.pl.pm.pn.pr.ps.pt.pw.py.qa.re.ro.rs.ru.rw.sa.sb.sc.sd.se.sg.sh.si.sj.sk.sl.sm.sn.so.sr.st.su.sv.sx.sy.sz.tc.td.tf.tg.th.tj.tk.tl.tm.tn.to.tr.tt.tv.tw.tz.ua.ug.uk.us.uy.uz.va.vc.ve.vg.vi.vn.vu.wf.ws.ye.yt.za.zm.zw",".aaa.abb.abc.aco.ads.aeg.afl.aig.anz.aol.app.art.aws.axa.bar.bbc.bbt.bcg.bcn.bet.bid.bio.biz.bms.bmw.bnl.bom.boo.bot.box.buy.bzh.cab.cal.cam.car.cat.cba.cbn.cbs.ceb.ceo.cfa.cfd.com.crs.csc.dad.day.dds.dev.dhl.diy.dnp.dog.dot.dtv.dvr.eat.eco.edu.esq.eus.fan.fit.fly.foo.fox.frl.ftr.fun.fyi.gal.gap.gdn.gea.gle.gmo.gmx.goo.gop.got.gov.hbo.hiv.hkt.hot.how.ibm.ice.icu.ifm.inc.ing.ink.int.ist.itv.iwc.jcb.jcp.jio.jlc.jll.jmp.jnj.jot.joy.kfh.kia.kim.kpn.krd.lat.law.lds.llc.lol.lpl.ltd.man.map.mba.med.men.mil.mit.mlb.mls.mma.moe.moi.mom.mov.msd.mtn.mtr.nab.nba.nec.net.new.nfl.ngo.nhk.now.nra.nrw.ntt.nyc.obi.off.one.ong.onl.ooo.org.ott.ovh.pay.pet.phd.pid.pin.pnc.pro.pru.pub.pwc.qvc.red.ren.ril.rio.rip.run.rwe.sap.sas.sbi.sbs.sca.scb.ses.sew.sex.sfr.ski.sky.soy.srl.srt.stc.tab.tax.tci.tdk.tel.thd.tjx.top.trv.tui.tvs.ubs.uno.uol.ups.vet.vig.vin.vip.wed.win.wme.wow.wtc.wtf.xin.xxx.xyz.you.yun",".aero.arpa.asia.auto.band.beer.chat.city.club.cool.coop.date.fans.fund.game.gift.gold.guru.help.host.info.jobs.life.link.live.loan.love.luxe.mobi.name.news.pics.plus.shop.show.site.sohu.team.tech.wang.wiki.work.yoga.zone",".citic.cloud.email.games.group.local.onion.party.photo.press.rocks.space.store.today.trade.video.world",".center.design.lawyer.market.museum.online.social.studio.travel",".company.fashion.science.website",".engineer.software"],C:function(){return Object.create(null)},T:function(e){return Object.setPrototypeOf(e,null)},M:new Map,A:/^([^:]+(:[^:]+)?@)?([^:]+|\[[^\]]+])(:\d{2,5})?$/,O:/\s+/g,F:/\xa0/g,D:/^[a-z][\+\-\.\da-z]+:\/\//,B:/^(?:ext|web)\+[a-z]+:/,G:/^"[^"]*"$|^'[^']*'$|^\u201c[^\u201d]*\u201d$/,V:0,K:function(e,t,n){var a,s,i,c,l,u,m,h,p,f=r;return e=e.trim(),f.V=0,f.R(e)?(e=e.replace(f.F," "),f.y(),e):(a=-1,s=0,i=false,h='"'===(u=e.replace(/[\n\r]+[\t \xa0]*/g,"").replace(f.F," "))[0]&&u.endsWith('"'),p=u,e=u=h?u.slice(1,-1):u,/^[A-Za-z]:(?:[\\/][^:*?"<>|]*)?$|^\/(?:Users|home|root)\/[^:*?"<>|]+$/.test(e)?(":"===e[1]&&(e=e[0].toUpperCase()+":/"+e.slice(3).replace(/\\/g,"/")),f.y(),"file://"+("/"===e[0]?e:"/"+e)):e.startsWith("\\\\")&&e.length>3?((e=e.slice(2).replace(/\\/g,"/")).lastIndexOf("/")<=0&&(e+="/"),f.y(),"file://"+e):((c=(e=u.toLowerCase()).indexOf(" ")+1||e.indexOf("\t")+1)>1&&(e=e.slice(0,c-1)),0===(c=e.indexOf(":"))?a=4:-1!==c&&f.D.test(e)?e.startsWith("vimium:")?(a=3,n|=0,e=u.slice(9),n<-1||!e?u="vimium://"+e:-1===n||h||!(u=f.J(e,n))?u=f.Y(e,false,n):"string"!=typeof u&&(a=5)):f.B.test(e)?a=0:(-1===(l=e.indexOf("/",c+3))?e.length<u.length:e.charCodeAt(l+1)<33)?a=4:/[^a-z]/.test(e.slice(0,c))?a=(c=e.charCodeAt(c+3))>32&&47!==c?0:4:e.startsWith("file:")?a=0:e.startsWith("chrome:")?a=e.length<u.length&&e.includes("/")?4:0:o&&e.startsWith("read:")?a=!/^read:\/\/([a-z]+)_([.\da-z\-]+)(?:_(\d+))?\/\?url=\1%3a%2f%2f\2(%3a\3)?(%2f|$)/.test(e)||e.length<u.length?4:0:e=e.slice(c+3,l>=0?l:void 0):(-1!==c&&e.lastIndexOf("/",c)<0&&(a=f.Q(u.toLowerCase(),c,e.length%u.length)),s=2,l=u.length,-1===a&&e.startsWith("//")&&(e=e.slice(2),s=1,l-=2),-1!==a?"about:blank/"===e&&(u="about:blank"):(c=e.indexOf("/"))<=0?(0===c||e.length<l)&&(a=4):e.length>=l||e.charCodeAt(c+1)>32?(i=e.length>c+1,e=e.slice(0,c)):a=4),-1===a&&e.lastIndexOf("%")>=0&&(e=r.W(e)).includes("/")&&(a=4),-1===a&&e.startsWith(".")&&(e=e.slice(1)),-1!==a||((m=f.A.exec(e))?(e=m[3]).endsWith("]")?a=f.Z(e,6)?s:4:"localhost"===e||e.endsWith(".localhost")||f.Z(e,4)||m[4]&&i?a=s:(c=e.lastIndexOf("."))<0||0===(a=f.X(e.slice(c+1)))?(c<0&&"__proto__"===e&&(e="."+e),l=e.length-c-1,a=2!==s&&(c<0||l>=3&&l<=5)||f.ee(e,m[4])>0?s:4):a=/[^.\da-z\-]|^xn--|^-/.test(e)?(e.length===c+3||1!==a?!s:f.ee(e,m[4]))?s:4:2!==s||i?s:e.endsWith(".so")&&e.startsWith("lib")&&e.indexOf(".")===e.length-3?4:m[2]||m[4]||!m[1]||/^ftps?(\b|_)/.test(e)?2:e.startsWith("mail")||e.indexOf(".mail")>0||(l=e.indexOf("."))===c?4:e.indexOf(".",++l)!==c?2:e.length===c+3&&1===a&&f.X(e.slice(l,c),true)?4:2:(a=4,e.length===u.length&&f.Z(e="["+e+"]",6)&&(u=e,a=2))),f.y(),f.V=a,0===a?/^extension:\/\//i.test(u)?"chrome-"+u:u:4===a?f.te(p.split(f.O),t||"~",n):a<=2?2===a&&f.ne(u,e)||(2===f.ee(e,m&&m[4])?"https:":"http:")+(2===a?"//":"")+u:u))},ee:function(e,t){var n=t&&this.M.get(e+t)||this.M.get(e);return n?n.ae?2:1:0},ne:function(e,t){if(/^(?!www\.)[a-z\d-]+\.([a-z]{3}(\.[a-z]{2})?|[a-z]{2})\/?$/i.test(e)&&!this.ee(t)){var n=this.M.get("www."+t);if(n)return(n.ae?"https":"http")+"://www."+e.toLowerCase().replace("/","")+"/"}return""},Q:function(e,t,n){var a=this,o="/"===e.substr(t+1,1);switch(e.slice(0,t)){case"about":return o?4:n>0||e.includes("@",t)?-1:0;case"blob":case"view-source":return(e=e.slice(t+1)).startsWith("blob:")||e.startsWith("view-source:")?4:(a.K(e,null,-2),a.V<=2?0:4);case"data":return o?4:(t=e.indexOf(",",t))<0||n>0&&n<t?-1:0;case"file":return 0;case"filesystem":return e=e.slice(t+1),a.D.test(e)?(a.K(e,null,-2),0===a.V&&/[^/]\/(?:persistent|temporary)(?:\/|$)/.test(e)?0:4):4;case"magnet":return"?"!==e[t+1]?-1:0;case"mailto":return o?4:(t=e.indexOf("/",t))>0&&e.lastIndexOf("?",t)<0?-1:0;case"tel":return/\d/.test(e)?0:4;default:return a.B.test(e)?0:o?4:-1}},oe:function(e){var t=e.startsWith("filesystem:")?11:e.startsWith("view-source:")?12:0;return t?e.slice(t):e},re:function(e){var t,n,a=e.indexOf("\uff1a")+1||e.indexOf(":")+1;if(a&&"/"!==e[a]){if("link"!==(n=e.slice(0,a-1).trim().toLowerCase())&&"\u94fe\u63a5"!==n)return e;t=e.slice(a).trim()}else{if(!a||"/"!==e.substr(a+1,1))return e;t=e}return t=t.split(" ",1)[0],',.;")\u2018\u2019\u201c\u201d\u3002\u300b\uff09\uff0c\uff1b\uff1e'.includes(t.slice(-1))&&(t=t.slice(0,-1)),'"(\u2018\u2019\u201c\u201d\u300a\uff08\uff1c'.includes(t[0])&&(t=t.slice(1)),t=r.se(t,false,true),r.V<=2&&!t.startsWith("vimium:")?t:e},X:function(e,t){return!t&&/[^a-z]/.test(e)?this.E.includes("."+e+".")?2:0:e&&e.length<this.I.length&&this.I[e.length].includes(e)?1:0},ie:function(e){var t=e.toLowerCase().split("."),n=t.length;return[t,0===r.X(t[n-1])?1:n>2&&2===t[n-1].length&&1===r.X(t[n-2])?3:2]},Z:function(e,t){return!!(6!==t&&/^\d{1,3}(?:\.\d{1,3}){3}$/.test(e)||4!==t&&/^\[[\da-f]{0,4}(?::[\da-f]{0,4}){1,5}(?:(?::[\da-f]{0,4}){1,2}|:\d{0,3}(?:\.\d{0,3}){3})]$/.test(e))&&!!this.ce("http://"+e)},ce:function(e){try{return new URL(e)}catch(e){return null}},Y:function(e,t,n){var a,o,r="",s="",i=e.trim();if(!i)return t?"":location.origin+"/pages/";if((a=i.indexOf(" ")+1)&&(s=i.slice(a).trim(),i=i.slice(0,a-1)),(a=i.search(/[\/#?]/)+1)&&(r=i.slice(a-1).trim(),i=i.slice(0,a-1)),"display"===i&&(i="show"),!/\.\w+$/.test(i))if(i=i.toLowerCase(),null!=(o=l.L.le[i]))o=i=o&&"/"!==o[0]&&"#"!==o[0]?o:l.L.ue+(o.includes(".")?"/blob/master"+o:o);else{if("newtab"===i)return l.me.newTabUrl_f;if("/"===i[0]||l.L.he.indexOf(i)>=0)i+=".html";else{if(1===n||-1===n)return"vimium://"+e.trim();i="show.html#!url vimium://"+i}}return t||o&&o.includes("://")||(i=location.origin+("/"===i[0]?"":"/pages/")+i),r&&(i+=r),i+(s&&(i.includes("#")?" ":"#!")+s)},pe:0,J:function(e,t,n){var o,s,i,c,l,u,m,h,p,f,g=r;if("paste"===e&&(e+=" ."),(t|=0)<0||!(e=e.trim())||(o=e.search(/\/| /))<=0||!/^[a-z][\da-z\-]*(?:\.[a-z][\da-z\-]*)*$/i.test(s=e.slice(0,o).toLowerCase())||/\.(?:css|html?|js)$/i.test(s))return null;if(!(e=e.slice(o+1).trim()))return null;if(u=/[\s+,\uff0b\uff0c]+/g,1===t)switch(s){case"sum":case"mul":e=e.replace(u,"sum"===s?" + ":" * "),s="e";break;case"avg":case"average":i=e.split(u),e="("+i.join(" + ")+") / "+i.length,s="e"}if(1===t)switch(s){case"e":case"exec":case"eval":case"expr":case"calc":case"m":case"math":return g.fe("MathParser").catch(g.b).then(g.ge.bind(0,e));case"error":return[e,3]}else if(t>=2)switch(s){case"status":case"state":return[e,4];case"url-copy":case"search-copy":case"search.copy":case"copy-url":if((l=g.K(e,null,1))instanceof Promise)return l.then(function(e){var t=e[0]||e[2]||"";return t=t instanceof Array?t.join(" "):t,[t=r.de(t),1]});e=(l=5===g.V&&l instanceof Array?l[0]:l)instanceof Array?l.join(" "):l;case"cp":case"copy":case"clip":return[e=r.de(e),1]}switch(s){case"cd":case"up":if(!(i=(e+"  ").split(" "))[2]||!a){if(t<1||!a)return null;if("string"!=typeof(l=a.be()))return l.then(function(a){var o=a&&r.J("cd "+e+" "+(e.includes(" ")?a:". "+a),t,n);return o?"string"==typeof o?[o,6]:o:[a?"fail in parsing":"No current tab found",3]});i[2]=l}return m="/"===(s=i[0])[0],o=parseInt(s,10),o=isNaN(o)?"/"===s?1:m?s.replace(/(\.+)|./g,"$1").length+1:-s.replace(/\.(\.+)|./g,"$1").length||-1:o,(h=a.we({u:i[2],p:o,t:null,f:1,a:"."!==i[1]?i[1]:""}))&&h.u||[h?h.e:"No upper path",3];case"parse":case"decode":(s=e.split(" ",1)[0]).search(/\/|%2f/i)<0?e=e.slice(s.length+1).trimLeft():s="~",i=[e=g._e(e)],e=g.K(e),4!==g.V&&(c=a.we({u:e}))?""===c.u?i=[s]:(i=c.u.split(" ")).unshift(s):i=i[0].split(g.O);break;case"sed":case"substitute":case"sed-p":case"sed.p":case"sed2":return p=e.split(" ",1)[0],e=e.slice(p.length+1).trim(),f="sed2"===s?e.split(" ",1)[0]:"",[e=(e=e.slice(f.length).trim())&&g.ve(e,s.endsWith("p")?32768:0,f?{r:p,k:f}:/^[@#$-]?[a-z]+$|^\.$/.test(p)?{r:null,k:p}:{r:p,k:null}),5];case"u":case"url":case"search":i=g._e(e).split(g.O);break;case"paste":if(t>0)return(l=r.ke(e))instanceof Promise?l.then(function(e){return[e?e.trim().replace(r.O," "):"",5]}):[l?l.trim().replace(r.O," "):"",5];default:return null}return n?[i,2]:(o=g.pe++)>12?null:12===o?g.te(i,"",0):o>0?g.te(i,"",t):(l=g.te(i,"",t),g.pe=0,l)},ge:function(e,t){var n,a,o;for(r.G.test(e)&&(e=e.slice(1,-1)),n=/([\u2070-\u2079\xb2\xb3\xb9]+)|[\xb0\uff0b\u2212\xd7\xf7]|''?/g,e=(e=e.replace(/\uff0c/g," ")).replace(/deg\b/g,"\xb0").replace(/[\xb0']\s*\d+(\s*)(?=\)|$)/g,function(e,t){return(e=e.trim())+("'"===e[0]?"''":"'")+t}).replace(n,function(e,t){var n,a,o="";if(!t)return"\xb0"===e?"/180*PI+":(n="\uff0b\u2212\xd7\xf7".indexOf(e))>=0?"+-*/"[n]:"/"+("''"===e?3600:60)+"/180*PI+";for(a of e)o+=a<"\xba"?a>"\xb3"?1:a<"\xb3"?2:3:a.charCodeAt(0)-8304;return o&&"**"+o}).replace(/\*PI\+(?!\s*\d)/g,"*PI").replace(/([\d.])rad\b/g,"$1"),a=[].reduce.call(e,function(e,t){return e+("("===t?1:")"===t?-1:0)},0);a-- >0;)e+=")";if(o="",(t=t||window.MathParser||{}).evaluate){try{o="function"==typeof(o=t.evaluate(e))?"":""+o}catch(e){}t.clean(),t.errormsg&&(t.errormsg="")}return[o,0,e]},de:function(){return""},ke:function(){return""},ve:null,fe:function(e){var t=window[e];return t?Promise.resolve(t):window[e]=new Promise(function(t){var n=document.createElement("script");n.src=l.L[e],n.onload=function(){this.remove(),t(window[e])},document.documentElement.appendChild(n)})},ye:/\$([sS])(?:\{([^}]*)})?/g,xe:/\$([+-]?\d+)/g,te:function(e,t,n){var a,o=r,s=l.me.searchEngineMap.get(t||e[0]);return s?(t||(t=e.shift()),a=o.Se(e,s.je,s.b)):a=e.join(" "),"~"!==t?o.K(a,null,n):(o.V=4,a)},Se:function(e,t,n,a){var o,s=r,i=0;return t=0===e.length&&n?n:t.replace(s.ye,function(n,s,c,l){var u;return"S"===s?(u=e,s=" "):(u=o||(o=e.map(r.encodeAsciiComponent)),s=r.R(t)?"%20":"+"),0===u.length?"":(c=c&&c.includes("$")?c.replace(r.xe,function(e,t){var n=parseInt(t,10);if(!n)return u.join(s);if(n<0)n+=u.length+1;else if("+"===t[0])return u.slice(n-1).join(s);return u[n-1]||""}):u.join(null!=c?c:s),null!=a&&(a.push(l+=i,l+c.length),i+=c.length-n.length),c)}),s.y(),null==a?t:{je:t,ze:a}},W:function(e,t){if(!e)return"";try{e=(t?"atob"===t?atob:decodeURI:decodeURIComponent)(e)}catch(e){}return e},$e:function(e){var t=e.replace(/%25/g,"%2525").replace(/%(?![\da-zA-Z]{2})/g,"%25"),n=r.W(t,1);return(r.D.test(n=n.length!==t.length?n:e)||n.startsWith("data:")||n.startsWith("about:")||r.R(n))&&(n=n.trim().replace(/\s+/g,encodeURIComponent)),n},_e:function(e){return e=!e.includes("://")&&/%(?:2[36f]|3[adf])/i.test(e)?r.W(e).trim():e,r.$e(e)},encodeAsciiURI:function(e,t){return(t?e:encodeURI(e)).replace(/%(?:[CD].%..|E.%..%..)/g,function(e){var t=decodeURIComponent(e);return(f<64||0?/[\u0391-\u03c9\u4e00-\u9fa5]/:new RegExp("[\\p{L}\\p{N}]","u")).test(t)?t:e})},Re:function(e){var t,n,a,o;if(2===l.Pe.o&&e.startsWith("file://")){if((t=e.indexOf("/",7))<0||t===e.length-1)return t<0?e+"/":e;e=7===t&&":"===e.substr(9,1)?e[8].toUpperCase()+e.slice(9):"\\\\"+e.slice(7),o=(a=(n=/[?#]/.exec(e))?n.index:0)?e.slice(a):"",e=(e=a?e.slice(0,a):e).replace(/\/+/g,"\\"),e=a?e+o:e}return e},encodeAsciiComponent:function(e){return e.replace(f<64||0?/[\x00-`{-\u0390\u03ca-\u4dff\u9fa6-\uffff\s]+/g:new RegExp("[^\\p{L}\\p{N}]+","ug"),encodeURIComponent)},se:function(e,t,n){var a,o,r=+e.includes("\u3002")+2*+e.includes("\uff1a");return r||n?(a=e.indexOf("//"),(a=e.indexOf("/",a>=0?a+2:0))>=0&&a<4?e:(o=a>0?e.slice(0,a):e,/^(data|javascript)[:\uff1a]/i.test(o)?e:(1&r&&(o=o.replace(/\u3002/g,".")),2&r&&(o=o.replace("\uff1a",":").replace("\uff1a",":")),a>0&&(o+=e.slice(a)),this.K(o,null,-2),this.V<3?o:1!==r||!t||/[^.\w\u3002-]/.test(e)?e:e.replace(/\u3002/g,".")))):e},qe:function(e){return/\.(?:avif|bmp|gif|icon?|jpe?g|a?png|tiff?|webp)$/i.test(e)?this.Y("show image "+e,false,0):e},Ue:function(e){var t,n,a=e.indexOf(":"),o=a;if(a<=0)return e;if(this.B.test(e.slice(0,a+1).toLowerCase()))return e.slice(0,a).toLowerCase()+e.slice(a);if("://"===e.substr(a,3))if((a=e.indexOf("/",a+3))<0)a=o,o=-1;else if(7===a&&"file"===e.slice(0,4).toLowerCase())return"file:///"+((a=":"===e.substr(9,1)?3:0)?e[8].toUpperCase()+":/":"")+e.slice(a+8);return n=(t=e.slice(0,a)).toLowerCase(),-1===o&&/^(file|ftp|https?|rt[ms]p|wss?)$/.test(t)&&(e+="/"),t!==n?n+e.slice(a):e},Le:function(e,t){var n,a,o,r,s,i,c,l,u,m,h,p=this,f=[],g=/\s/,d=p.ye,b=function(e){return!!((e=e.trim())&&"__proto__"!==e&&e.length<51)&&(t.set(e,s),true)};for(c of e.replace(/\\\\?\n/g,function(e){return 3===e.length?"\\\n":""}).split("\n"))if(!((c=c.trim())<"$")){i=0;do{i=c.indexOf(":",i+1)}while(92===c.charCodeAt(i-1));i<=0||!(r=c.slice(0,i).trimRight())||(n=r.replace(/\\:/g,":").split("|"),(c=c.slice(i+1).trimLeft())&&(l="",(i=(r=c.replace(/\\\s/g,"\\s")).search(g))>0?(e=c.slice(i),c=r.slice(0,i),(i=e.search(/\sblank=/i))>=0&&(u=e.slice(i+7).search(g),l=e.slice(i+7,(u=u>0?i+7+u:0)||void 0),e=e.slice(0,i)+(u?e.slice(u):"")),i=e.search(/\sre=/i)):(c=r,e=""),c=c.replace(/\\s/g," ").trim().replace(/([^\\]|^)%(s)/gi,"$1$$$2").replace(/\\%/g,"%"),s={Ee:"",b:l,je:c},0!==(n=n.filter(b)).length&&(-1===i?(d.lastIndex=0,(m=d.exec(c))&&(i=m.index+1)&&((r=m[2])?c=c.replace(d,"$$$1"):r="s"===m[1]?"+":" ",c=p.K(c,null,-1),p.V>2?i=(c=c.replace(/%24(s)/gi,"$$$1")).search(d)+1:0!==p.V&&(i+=2===p.V?7:5),(a=p.Ie(c.toLowerCase(),i))&&(r.includes("$")?(r=r.replace(p.xe,"(.*)"),o=new RegExp("^"+r,/[a-z]/i.test(r)?"i":"")):o=r.trim()||" ",f.push({Ce:a.Ce,Te:a.Te,Ee:n[0].trimRight(),Ne:o})))):47===e.charCodeAt(i+4)?(r=i>1?e.slice(1,i).trim():"",i=(e=e.slice(i+5)).search(/[^\\]\//)+1,c=e.slice(0,i),i=(e=e.slice(i+1)).search(g),(h=p.Me(c,i>=0?e.slice(0,i):e))&&(r=p.Ae(r),f.push({Ce:r,Te:h,Ee:n[0].trimRight(),Ne:s.je.lastIndexOf("$S")>=0?" ":"+"})),e=i>=0?e.slice(i+1):""):e=e.slice(i+4),e=e.trimLeft(),s.Ee=e?p.W(e):n[n.length-1].trimLeft())))}return f},Ie:function(e,t){var n,a,o,r;return t<1||!this.D.test(e)?null:(n=e.slice(0,t-1),(t=Math.max(n.lastIndexOf("?"),n.lastIndexOf("#"))+1)?(o=a=n.slice(t),n=n.slice(0,n.search(/[#?]/)),(r=a.lastIndexOf("&")+1)&&(o=a.slice(r)),o&&o.indexOf("=")>=1?(a="[#&?]",e="([^#&]*)"):(o=a,a="#"===e[t-1]?"#":o?"[#?]":"\\?",e="([^#&?]*)")):(a="^([^#?]*)",(o=e.slice(n.length+2))&&(t=o.search(/[#?]/)+1)&&(o=o.slice(0,t-1)),e=""),o=o&&o.replace(/[$()*+.?\[\\\]\^{|}]/g,"\\$&").replace(/\\\+|%20| /g,"(?:\\+|%20| )"),{Ce:n=this.Ae(n),Te:new RegExp(a+o+e,/[a-z]/i.test(o)?"i":"")})},Oe:function(e){return(e=e.slice(0,8).toLowerCase()).startsWith("http://")?7:"https://"===e?8:0},Ae:function(e){var t=e.slice(0,9).toLowerCase();return this.Oe(t)?e=e.slice(58===e.charCodeAt(4)?7:8):"vimium://"===t&&(e=this.Y(e.slice(9),false,-1)),e},Me:function(e,t,n){try{return new RegExp(e,t)}catch(a){0===n||console.log("%c/%s/%s","color:#c41a16",e,t,"is not a valid regexp.")}return null},Fe:/<(?!<)(?:.-){0,4}.\w*?(?::i)?>|./g,He:function(){return null},De:function(e,t){setTimeout(t,e)},Be:0},l={me:r.C(),Ge:{Ve:false,Ke:localStorage.length<=0,Je:null,Ye:null,Qe:0,We:null,Ze:null,Xe:null,et:false,tt:null,nt:null},Pe:{v:f,d:"",m:false,g:false,o:2},at:{v:f,o:2,a:0,n:0,t:0,l:"",s:"",c:"",k:null},ot:null,q:new Map,rt:null,st:localStorage,it:function(e,t){var n,a,o;return e in this.me?this.me[e]:(n=this.ct[e],o=null==(a=this.st.getItem(e))?n:"string"==typeof n?a:false===n||true===n?"true"===a:JSON.parse(a),t&&(this.me[e]=o),o)},lt:function(e,t){var n,a,o=this;if(o.me[e]=t,e in o.ut||(t===(n=o.ct[e])?(o.st.removeItem(e),o.mt(e,null)):(o.st.setItem(e,"string"==typeof n?t:JSON.stringify(t)),o.mt(e,t)),e in o.ht&&o.pt(o.ht[e],t,o.Pe)),a=o.ft[e])return a.call(o,t,e)},gt:function(e,t){return l.ft[e].call(this,void 0!==t?t:l.it(e),e)},dt:function(e){if(6!==e.N)l.bt(e);else if(null==e.d.length)l.bt(e);else{var t=e.d,n=l.Ge.We;n?t=t.concat(n):Promise.resolve(e).then(l.bt),l.Ge.We=t,e.d=null}},bt:function(e){var t,n,o,r,s;if(6===e.N&&!e.d){for(o of(t=l.Ge.We,n=e.d={},t))n[o]=l.Pe[o];l.Ge.We=null}for(r of a.wt().values())for(s of r._t)s.postMessage(e)},vt:function(e){for(var t of a.wt(-3))t.postMessage(e)},pt:function(e,t,n){switch(e){case"c":case"n":t=t.toLowerCase().toUpperCase();break;case"i":t=t===!!t?t:t>1||t>0&&!l.Pe.o;break;case"l":t=t===!!t?t?2:0:t;break;case"d":t=t?" D":""}return n?n[e]=t:t},kt:r.b,yt:r.b,ft:{__proto__:null,extAllowList:function(e){var t,n,a,o=l.rt,r=o||(l.rt=new Map);if(o&&r.forEach(function(e,t){false!==e&&r.delete(t)}),e)for(n=(t=e.split("\n")).length,a=/^[\da-z_]/i;0<=--n;)(e=t[n].trim())&&a.test(e)&&r.set(e,true)},grabBackFocus:function(e){l.Pe.g=e},newTabUrl:function(e){e=/^\/?pages\/[a-z]+.html\b/i.test(e)?chrome.runtime.getURL(e):r.K(e),l.lt("newTabUrl_f",e)},searchEngines:function(){var e,t=l,n=t.me.searchEngineMap;return n.clear(),"searchKeywords"in t.me&&t.lt("searchKeywords",null),e=r.Le("~:"+t.it("searchUrl")+"\n"+t.it("searchEngines"),n),t.lt("searchEngineRules",e)},searchUrl:function(e){var t=l.me,n=t.searchEngineMap;if(e)r.Le("~:"+e,n);else if(n.clear(),n.set("~",{Ee:"~",b:"",je:l.it("searchUrl").split(" ",1)[0]}),t.searchEngineRules=[],l.it("newTabUrl_f",true))return;return l.gt("newTabUrl")},mapModifier:function(e){l.vt({N:47,d:{a:e}})},vomnibarPage:function(e){var t=l,n=t.st.getItem("vomnibarPage_f");!n||e?((e=e||t.it("vomnibarPage"))===t.ct.vomnibarPage?e=t.L.xt:e.startsWith("front/")?e=chrome.runtime.getURL(e):(e=r.K(e),e=r.Ue(e),e=f<50&&!e.startsWith(v)?t.L.xt:e.replace(":version",""+parseFloat(t.L.St))),t.lt("vomnibarPage_f",e)):t.me.vomnibarPage_f=n},vomnibarOptions:function(e){var t,n,a,o,r,s,i=l,c=i.ct.vomnibarOptions,u=i.at,m=true,h=c.actions,p=c.maxMatches,f=c.queryInterval,g=c.styles,d=c.sizes;e!==c&&e&&"object"==typeof e&&(t=Math.max(3,Math.min(0|e.maxMatches||p,25)),n=((e.actions||"")+"").trim(),a=+e.queryInterval,o=((e.sizes||"")+"").trim(),r=((e.styles||"")+"").trim(),s=Math.max(0,Math.min(a>=0?a:f,1200)),(m=p===t&&f===s&&o===d&&h===n&&g===r)||(p=t,f=s,d=o,g=r),e.actions=n,e.maxMatches=t,e.queryInterval=s,e.sizes=o,e.styles=r),i.me.vomnibarOptions=m?c:e,u.n=p,u.t=f,u.l=d,u.s=g,i.kt(0,1),i.kt(1,1),i.vt({N:47,d:{n:p,t:f,l:d,s:u.s}})}},jt:null,zt:function(e,t){var n=this.L[e];n="/front/"+n,fetch(n).then(function(e){return e.text()}).then(t)},ct:{__proto__:null,autoDarkMode:true,autoReduceMotion:false,clipSub:"p=^git@([^/:]+):=https://$1/=\np@^https://item\\.m\\.jd\\.com/product/(\\d+)\\.html\\b@https://item.jd.com/$1.html@",dialogMode:false,exclusionListenHash:true,exclusionOnlyFirstMatch:false,exclusionRules:[{pattern:":https://mail.google.com/",passKeys:""}],extAllowList:"# modified versions of X New Tab and PDF Viewer,\n# NewTab Adapter, and Shortcuts Forwarding Tool\nhdnehngglnbnehkfcidabjckinphnief\nnacjakoppgmdcpemlfnfegmlhipddanj\ncglpcedifkgalfdklahhcchnjepcckfn\nclnalilglegcjmlgenoppklmfppddien",filterLinkHints:false,findModeRawQueryList:"",focusNewTabContent:true,grabBackFocus:false,hideHud:false,ignoreCapsLock:0,ignoreKeyboardLayout:0,innerCSS:"",keyboard:[560,33],keyMappings:"",linkHintCharacters:"sadjklewcmpgh",linkHintNumbers:"0123456789",localeEncoding:"gbk",mapModifier:0,mouseReachable:true,newTabUrl:"",newTabUrl_f:"",nextPatterns:"\u4e0b\u4e00\u5c01,\u4e0b\u9875,\u4e0b\u4e00\u9875,\u4e0b\u4e00\u7ae0,\u540e\u4e00\u9875,next,more,newer,>,\u203a,\u2192,\xbb,\u226b,>>",omniBlockList:"",previousPatterns:"\u4e0a\u4e00\u5c01,\u4e0a\u9875,\u4e0a\u4e00\u9875,\u4e0a\u4e00\u7ae0,\u524d\u4e00\u9875,prev,previous,back,older,<,\u2039,\u2190,\xab,\u226a,<<",regexFindMode:false,scrollStepSize:100,searchUrl:navigator.language.startsWith("zh")?"https://www.baidu.com/s?ie=utf-8&wd=%s \u767e\u5ea6":"https://www.google.com/search?q=%s Google",searchEngines:navigator.language.startsWith("zh")?"b|ba|baidu|Baidu|\u767e\u5ea6: https://www.baidu.com/s?ie=utf-8&wd=%s \\\n  blank=https://www.baidu.com/ \u767e\u5ea6\nbi: https://cn.bing.com/search?q=$s\nbi|bing|Bing|\u5fc5\u5e94: https://www.bing.com/search?q=%s \\\n  blank=https://cn.bing.com/ \u5fc5\u5e94\ng|go|gg|google|Google|\u8c37\u6b4c: https://www.google.com/search?q=%s\\\n  www.google.com re=/^(?:\\.[a-z]{2,4})?\\/search\\b.*?[#&?]q=([^#&]*)/i\\\n  blank=https://www.google.com/ Google\nd|ddg|duckduckgo: https://duckduckgo.com/?q=%s DuckDuckGo\nqw|qwant: https://www.qwant.com/?q=%s Qwant\n\nb.m|bm|map|b.map|bmap|\u5730\u56fe|\u767e\u5ea6\u5730\u56fe: \\\n  https://api.map.baidu.com/geocoder?output=html&address=%s&src=vimium-c\\\n  blank=https://map.baidu.com/\ngd|gaode|\u9ad8\u5fb7\u5730\u56fe: https://www.gaode.com/search?query=%s \\\n  blank=https://www.gaode.com\ng.m|gm|g.map|gmap: https://www.google.com/maps?q=%s \\\n  blank=https://www.google.com/maps \u8c37\u6b4c\u5730\u56fe\nbili|bilibili|bz|Bili: https://search.bilibili.com/all?keyword=%s \\\n  blank=https://www.bilibili.com/ \u54d4\u54e9\u54d4\u54e9\ny|yt: https://www.youtube.com/results?search_query=%s \\\n  blank=https://www.youtube.com/ YouTube\n\nw|wiki: https://www.wikipedia.org/w/index.php?search=%s Wikipedia\nb.x|b.xs|bx|bxs|bxueshu: https://xueshu.baidu.com/s?ie=utf-8&wd=%s \\\n  blank=https://xueshu.baidu.com/ \u767e\u5ea6\u5b66\u672f\ngs|g.s|gscholar|g.x|gx|gxs: https://scholar.google.com/scholar?q=$s \\\n  scholar.google.com re=/^(?:\\.[a-z]{2,4})?\\/scholar\\b.*?[#&?]q=([^#&]*)/i\\\n  blank=https://scholar.google.com/ \u8c37\u6b4c\u5b66\u672f\n\nt|tb|taobao|ali|\u6dd8\u5b9d: https://s.taobao.com/search?ie=utf8&q=%s \\\n  blank=https://www.taobao.com/ \u6dd8\u5b9d\nj|jd|jingdong|\u4eac\u4e1c: https://search.jd.com/Search?enc=utf-8&keyword=%s\\\n  blank=https://jd.com/ \u4eac\u4e1c\naz|amazon: https://www.amazon.com/s/?field-keywords=%s \\\n  blank=https://www.amazon.com/ \u4e9a\u9a6c\u900a\n\nv.m|v\\:math: vimium://math\\ $S re= \u8ba1\u7b97\u5668\ngh|github: https://github.com/search?q=$s \\\n  blank=https://github.com/ GitHub \u4ed3\u5e93\nge|gitee: https://search.gitee.com/?type=repository&q=$s \\\n  blank=https://gitee.com/ Gitee \u4ed3\u5e93\njs\\:|Js: javascript:\\ $S; JavaScript":"bi: https://cn.bing.com/search?q=$s\nbi|bing: https://www.bing.com/search?q=%s \\\n  blank=https://www.bing.com/ Bing\nb|ba|baidu|\u767e\u5ea6: https://www.baidu.com/s?ie=utf-8&wd=%s \\\n  blank=https://www.baidu.com/ \u767e\u5ea6\ng|go|gg|google|Google: https://www.google.com/search?q=%s \\\n  www.google.com re=/^(?:\\.[a-z]{2,4})?\\/search\\b.*?[#&?]q=([^#&]*)/i\\\n  blank=https://www.google.com/ Google\nd|ddg|duckduckgo: https://duckduckgo.com/?q=%s DuckDuckGo\nqw|qwant: https://www.qwant.com/?q=%s Qwant\n\ng.m|gm|g.map|gmap: https://www.google.com/maps?q=%s \\\n  blank=https://www.google.com/maps Google Maps\nb.m|bm|map|b.map|bmap|\u767e\u5ea6\u5730\u56fe: \\\n  https://api.map.baidu.com/geocoder?output=html&address=%s&src=vimium-c\ny|yt: https://www.youtube.com/results?search_query=%s \\\n  blank=https://www.youtube.com/ YouTube\nw|wiki: https://www.wikipedia.org/w/index.php?search=%s Wikipedia\ng.s|gs|gscholar: https://scholar.google.com/scholar?q=$s \\\n  scholar.google.com re=/^(?:\\.[a-z]{2,4})?\\/scholar\\b.*?[#&?]q=([^#&]*)/i\\\n  blank=https://scholar.google.com/ Google Scholar\n\na|ae|ali|alie|aliexp: https://www.aliexpress.com/wholesale?SearchText=%s \\\n  blank=https://www.aliexpress.com/ AliExpress\nj|jd|jb|joy|joybuy: https://www.joybuy.com/search?keywords=%s \\\n  blank=https://www.joybuy.com/ Joybuy\naz|amazon: https://www.amazon.com/s/?field-keywords=%s \\\n  blank=https://www.amazon.com/ Amazon\n\nv.m|v\\:math: vimium://math\\ $S re= Calculate\ngh|github: https://github.com/search?q=$s \\\n  blank=https://github.com/ GitHub Repo\nge|gitee: https://search.gitee.com/?type=repository&q=$s \\\n  blank=https://gitee.com/ Gitee \u4ed3\u5e93\njs\\:|Js: javascript:\\ $S; JavaScript",showActionIcon:true,showAdvancedCommands:true,showAdvancedOptions:true,showInIncognito:false,notifyUpdate:true,smoothScroll:true,vomnibarOptions:{maxMatches:10,queryInterval:333,sizes:"77,3,44",styles:"mono-url",actions:""},userDefinedCss:"",vimSync:null,vomnibarPage:"front/vomnibar.html",vomnibarPage_f:"",waitForEnter:true},$t:{__proto__:null,extWhiteList:"extAllowList",phraseBlacklist:"omniBlockList"},ut:{__proto__:null,helpDialog:1,searchEngineMap:1,searchEngineRules:1,searchKeywords:1},Rt:["showAdvancedCommands"],Pt:["icons/enabled.bin","icons/partial.bin","icons/disabled.bin"],ht:{__proto__:null,filterLinkHints:"f",ignoreCapsLock:"i",ignoreKeyboardLayout:"l",mapModifier:"a",mouseReachable:"e",keyboard:"k",linkHintCharacters:"c",linkHintNumbers:"n",regexFindMode:"r",smoothScroll:"s",scrollStepSize:"t",waitForEnter:"w"},mt:r.b,qt:null,L:{Ut:true,Lt:0,U:o?"https://www.msn.cn/spartan/ntp":"chrome-search://local-ntp/local-ntp.html",Et:"pages/blank.html",It:false,Ct:null,St:"",Tt:"",GitVer:"9f590c4",Nt:"/lib/injector.js",he:["blank","newtab","options","show"],MathParser:"/lib/math_parser.js",HelpDialog:"/background/help_dialog.js",Mt:"content/injected_end.js",At:"",Ot:false,Ft:true,Ht:"pages/options.html",Dt:"browser",baseCSS:"vimium-c.css",helpDialog:"help_dialog.html",words:"words.txt",Bt:"",ue:"https://github.com/gdh1995/vimium-c",le:{about:"",changelog:"/RELEASE-NOTES.md",help:"/wiki",home:"",license:"/LICENSE.txt",permissions:"/PRIVACY-POLICY.md#permissions-required",policy:"/PRIVACY-POLICY.md",popup:"options.html",privacy:"/PRIVACY-POLICY.md#privacy-policy",readme:"#readme",release:"/RELEASE-NOTES.md","release-notes":"/RELEASE-NOTES.md",settings:"options.html",wiki:"/wiki",__proto__:null},Gt:null,Vt:"pages/show.html",xt:"",Kt:"/front/vomnibar.js",Jt:""}},chrome.runtime.getPlatformInfo(function(e){var t=e.os.toLowerCase(),n=chrome.runtime.PlatformOs,o=t===n.WIN?2:t===n.MAC?0:1,r=l.it("ignoreCapsLock");l.L.Dt=t,l.at.o=l.Pe.o=o,l.pt("i",r,l.Pe),l.Ge.Qe|=1,a&&a.Yt()}),(function(){function e(e){return(47===e.charCodeAt(0)?i:e.startsWith(c)?"":c)+e}var t,n,a,r,s=chrome.runtime.getManifest(),i=location.origin,c=i+"/",u=s.content_scripts[0].js,m=l,h=m.L,p=m.ct,f=m.ht,g=m.Pe,d=m.q;for(t in p.newTabUrl=o?"edge://newtab":"chrome://newtab",d.set("about:newtab",1),d.set("about:newtab/",1),d.set("chrome://newtab",1),d.set("chrome://newtab/",1),o&&(d.set("edge://newtab",1),d.set("edge://newtab/",1)),d.set("chrome://new-tab-page",1),d.set("chrome://new-tab-page/",1),m.me.searchEngineMap=new Map,h.Gt=Object.keys(s.commands||{}).map(function(e){return"quickNext"===e?"nextTab":e}),h.St=s.version,h.Tt=s.version_name||s.version,h.Ht=e(s.options_page||h.Ht),h.Ut=null!=s.permissions&&s.permissions.indexOf("clipboardRead")>=0,h.Vt=e(h.Vt),h.xt=e(p.vomnibarPage),h.Jt=e(h.Kt),h.ue=s.homepage_url||h.ue,h.le.release+="#"+h.St.replace(/\D/g,""),h.Nt=e(h.Nt),u.push(h.Mt),h.Ct=u.map(e),g.g=m.it("grabBackFocus"),f)m.pt(f[t],m.it(t),g);for(n in m.$t)null!=(a=m.st.getItem(n))&&(m.lt(m.$t[n],a),m.st.removeItem(n));m.Ge.Ke&&((r=(navigator.platform||"").toLowerCase()).startsWith("mac")||r.startsWith("ip"))&&m.lt("ignoreKeyboardLayout",1)})(),Exclusions={Qt:null,Wt:function(e,t){var n,a,o=this.Qt.get(e);return t=t&&t.replace(/<(\S+)>/g,"$1"),o?{t:o.t,v:o.v,k:t}:("^"===e[0]&&((n=r.Me(e.startsWith("^$|")?e.slice(3):e,"",0))||console.log("Failed in creating an RegExp from %o",e)),a=n?{t:1,v:n,k:t}:{t:2,v:e.startsWith(":vimium://")?r.Y(e.slice(10),false,-1):e.slice(1),k:t},this.Qt.set(e,a),a)},Zt:function(e){if("^"===e[0]){var t=r.Me(e.startsWith("^$|")?e.slice(3):e,"");return t?{t:1,v:t}:null}return"localhost"===e||!e.includes("/")&&e.includes(".")&&(!/:(?!\d+$)/.test(e)||r.Z(e,6))?(e=e.toLowerCase(),{t:1,v:new RegExp("^https?://"+(e.startsWith("*")&&"."!==e[1]?"[^/]"+e:(e=e.replace(/\./g,"\\."),e.startsWith("*")?e.replace("*\\.","(?:[^./]+\\.)*?"):e)),"")}):{t:2,v:(":"===e[0]?e.slice(1):e).replace(/([\/?#])\*$/,"$1")}},Xt:function(e,t){return 2===e.t?t.startsWith(e.v):e.v.test(t)},en:false,tn:false,nn:l.it("exclusionOnlyFirstMatch"),an:[],on:function(e){if(0===e.length)return this.an=[],a.rn=null,void this.sn();this.Qt||(this.Qt=new Map),this.an=e.map(this.in),this.Qt=null,a.rn=this.cn,this.sn()},cn:function(e,t){var n,o,s,i="";for(n of Exclusions.an)if(2===n.t?e.startsWith(n.v):n.v.test(e)){if(0===(o=n.k).length||Exclusions.nn||"^"===o[0]&&o.length>2)return o;i+=o}return!i&&t.ln&&e.lastIndexOf("://",5)<0&&!r.D.test(e)&&(s=a.wt(t.un,0))?Exclusions.cn(s.s.je,s.s):i||null},mn:function(){var e=chrome.webNavigation?function(e){a.hn[8](e)}:null;return this.mn=function(){return e},e},in:function(e){return Exclusions.Wt(e.pattern,e.passKeys)},pn:function(){var e,t,n,a=r.C(),o=0;for(e of this.an)if(t=e.k){if("^"===t[0]&&t.length>2)return true;for(n of t.split(" "))a[n]=1,o++}return o?a:null},fn:function(e,t,n){var a,o=this.an;return this.an=n.map(this.in),a=this.cn(e,t),this.an=o,a},gn:function(e){var t,n,o,r=Exclusions.an.length>0?null:{N:1,p:null,f:0};e?r||l.dt({N:3,H:8}):(t=!!l.Ge.Ze&&(l.Ge.Ze()||l.it("showActionIcon")),n=null,o=0,a.wt().forEach(function(e){var s,i=e.bn.s.dn;for(s of e._t){if(r){if(0===s.s.dn)continue}else if(n=a.rn(s.s.je,s.s),o=null===n?0:n?1:2,!n&&s.s.dn===o)continue;e.wn||(s.postMessage(r||{N:1,p:n,f:0}),s.s.dn=o)}t&&i!==(o=e.bn.s.dn)&&a._n(e.bn.s.un,o)}))},sn:function(){var e,t=Exclusions,n=t.an.length>0,a=t.mn(),o=n&&l.it("exclusionListenHash");a&&(t.en!==n&&(t.en=n,e=chrome.webNavigation.onHistoryStateUpdated,n?e.addListener(a):e.removeListener(a)),t.tn!==o&&(t.tn=o,e=chrome.webNavigation.onReferenceFragmentUpdated,o?e.addListener(a):e.removeListener(a)))}},l.ft.exclusionRules=function(e){var t=!Exclusions.an.length,n=c.vn;Exclusions.on(e),setTimeout(function(){setTimeout(Exclusions.gn,10,t),c.vn===n&&l.gt("keyMappings",null)},1)},l.ft.exclusionOnlyFirstMatch=function(e){Exclusions.nn=e},l.ft.exclusionListenHash=Exclusions.sn;