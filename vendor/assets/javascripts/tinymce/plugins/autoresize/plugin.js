tinymce.PluginManager.add("autoresize",function(e){function t(){return e.plugins.fullscreen&&e.plugins.fullscreen.isFullscreen()}function n(r){var a,s,l,u,c,d,f,p,h,m,g,v,y=tinymce.DOM;if(s=e.getDoc()){if(l=s.body,u=s.documentElement,c=i.autoresize_min_height,!l||r&&"setcontent"===r.type&&r.initial||t())return void(l&&u&&(l.style.overflowY="auto",u.style.overflowY="auto"));f=e.dom.getStyle(l,"margin-top",!0),p=e.dom.getStyle(l,"margin-bottom",!0),h=e.dom.getStyle(l,"padding-top",!0),m=e.dom.getStyle(l,"padding-bottom",!0),g=e.dom.getStyle(l,"border-top-width",!0),v=e.dom.getStyle(l,"border-bottom-width",!0),d=l.offsetHeight+parseInt(f,10)+parseInt(p,10)+parseInt(h,10)+parseInt(m,10)+parseInt(g,10)+parseInt(v,10),(isNaN(d)||d<=0)&&(d=tinymce.Env.ie?l.scrollHeight:tinymce.Env.webkit&&0===l.clientHeight?0:l.offsetHeight),d>i.autoresize_min_height&&(c=d),i.autoresize_max_height&&d>i.autoresize_max_height?(c=i.autoresize_max_height,l.style.overflowY="auto",u.style.overflowY="auto"):(l.style.overflowY="hidden",u.style.overflowY="hidden",l.scrollTop=0),c!==o&&(a=c-o,y.setStyle(e.iframeElement,"height",c+"px"),o=c,tinymce.isWebKit&&a<0&&n(r))}}function r(t,i,o){tinymce.util.Delay.setEditorTimeout(e,function(){n({}),t--?r(t,i,o):o&&o()},i)}var i=e.settings,o=0;e.settings.inline||(i.autoresize_min_height=parseInt(e.getParam("autoresize_min_height",e.getElement().offsetHeight),10),i.autoresize_max_height=parseInt(e.getParam("autoresize_max_height",0),10),e.on("init",function(){var t,n;t=e.getParam("autoresize_overflow_padding",1),n=e.getParam("autoresize_bottom_margin",50),t!==!1&&e.dom.setStyles(e.getBody(),{paddingLeft:t,paddingRight:t}),n!==!1&&e.dom.setStyles(e.getBody(),{paddingBottom:n})}),e.on("nodechange setcontent keyup FullscreenStateChanged",n),e.getParam("autoresize_on_init",!0)&&e.on("init",function(){r(20,100,function(){r(5,1e3)})}),e.addCommand("mceAutoResize",n))});