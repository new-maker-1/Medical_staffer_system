tinymce._beforeUnloadHandler=function(){var e;return tinymce.each(tinymce.editors,function(t){t.plugins.autosave&&t.plugins.autosave.storeDraft(),!e&&t.isDirty()&&t.getParam("autosave_ask_before_unload",!0)&&(e=t.translate("You have unsaved changes are you sure you want to navigate away?"))}),e},tinymce.PluginManager.add("autosave",function(e){function t(e,t){var n={s:1e3,m:6e4};return e=/^(\d+)([ms]?)$/.exec(""+(e||t)),(e[2]?n[e[2]]:1)*parseInt(e,10)}function n(){var e=parseInt(p.getItem(c+"time"),10)||0;return!((new Date).getTime()-e>f.autosave_retention)||(r(!1),!1)}function r(t){p.removeItem(c+"draft"),p.removeItem(c+"time"),t!==!1&&e.fire("RemoveDraft")}function i(){!u()&&e.isDirty()&&(p.setItem(c+"draft",e.getContent({format:"raw",no_events:!0})),p.setItem(c+"time",(new Date).getTime()),e.fire("StoreDraft"))}function o(){n()&&(e.setContent(p.getItem(c+"draft"),{format:"raw"}),e.fire("RestoreDraft"))}function a(){d||(setInterval(function(){e.removed||i()},f.autosave_interval),d=!0)}function s(){var t=this;t.disabled(!n()),e.on("StoreDraft RestoreDraft RemoveDraft",function(){t.disabled(!n())}),a()}function l(){e.undoManager.beforeChange(),o(),r(),e.undoManager.add()}function u(t){var n=e.settings.forced_root_block;return t=tinymce.trim("undefined"==typeof t?e.getBody().innerHTML:t),""===t||new RegExp("^<"+n+"[^>]*>((\xa0|&nbsp;|[ \t]|<br[^>]*>)+?|)</"+n+">|<br>$","i").test(t)}var c,d,f=e.settings,p=tinymce.util.LocalStorage;c=f.autosave_prefix||"tinymce-autosave-{path}{query}-{id}-",c=c.replace(/\{path\}/g,document.location.pathname),c=c.replace(/\{query\}/g,document.location.search),c=c.replace(/\{id\}/g,e.id),f.autosave_interval=t(f.autosave_interval,"30s"),f.autosave_retention=t(f.autosave_retention,"20m"),e.addButton("restoredraft",{title:"Restore last draft",onclick:l,onPostRender:s}),e.addMenuItem("restoredraft",{text:"Restore last draft",onclick:l,onPostRender:s,context:"file"}),e.settings.autosave_restore_when_empty!==!1&&(e.on("init",function(){n()&&u()&&o()}),e.on("saveContent",function(){r()})),window.onbeforeunload=tinymce._beforeUnloadHandler,this.hasDraft=n,this.storeDraft=i,this.restoreDraft=o,this.removeDraft=r,this.isEmpty=u});