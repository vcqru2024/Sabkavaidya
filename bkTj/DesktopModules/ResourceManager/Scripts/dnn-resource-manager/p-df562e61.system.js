System.register([],(function(e){"use strict";return{execute:function(){e("g",n);function n(e,n){var t=0;var o=0;if(e instanceof MouseEvent){t=e.movementX;o=e.movementY}if(typeof TouchEvent!=="undefined"){if(e instanceof TouchEvent){var i=e.touches[0];if(n!=undefined){t=i.pageX-this.previousTouch.pageX;o=i.pageY-this.previousTouch.pageY}n=i}}return{movementX:t,movementY:o}}}}}));
//# sourceMappingURL=p-df562e61.system.js.map