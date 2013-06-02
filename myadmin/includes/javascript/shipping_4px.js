var box={
		showUpload:function(){
			mztDlg.showId('frmUpload','杂费设置');
			mztDlg.resetByObj(_('tdMztDlgContent'));			
		}
}
function setTdName(bool){
	var value=bool?"inline-block":"none";
	_('tdName').style.display=value;
	_('tdNameValue').style.display=value;
}
_ = function(id) {
    return document.getElementById(id)
}
var mztDlg = {
    path: '',
    isIE6: !window.XMLHttpRequest,
    isIE: !+[1, ],
    isFF: navigator.userAgent.toLowerCase().indexOf("firefox") != -1,
    arguments: null,
    windowWidth: window.screen.availWidth,
    windowHeight: window.screen.availHeight,
    imgCloseExternal: null,
    imgCloseInternal: null,
    imgIcon: null,
    boxTitle: null,
    boxContent: null,
    boxTmp: null,
    boxHead: null,
    box: null,
    boxBg: null,
    style: null,
    addEvent: function(elm, evType, fn, useCapture) {
        if (elm.addEventListener) {
            elm.addEventListener(evType, fn, useCapture)
        } else if (elm.attachEvent) {
            elm.attachEvent('on' + evType, fn)
        }
        elm['on' + evType] = fn
    },
    close: function() {
        this.box.style.display = "none";
        this.boxBg.style.display = "none";
        this.box.style.height = "auto";
        this.box.style.width = "auto";
        this.boxContent.style.height = "auto";
        this.boxContent.style.width = "auto"
    },
    resetBoxBg: function() {
        if (this.boxBg.style.display == "none") return;
        if (this.isIE6) {
            this.boxBg.style.width = document.body.offsetWidth + "px"
        } else if (this.isIE) {
            if (document.body.parentNode.scrollWidth != document.body.offsetWidth) {
                this.boxBg.style.width = document.body.parentNode.scrollWidth + "px"
            } else {
                this.boxBg.style.width = "100%"
            }
        } else {
            this.boxBg.style.width = "0px";
            this.boxBg.style.width = parseInt(document.body.parentNode.scrollWidth) + "px"
        }
        var tmpHeight = 0;
        if (this.isIE6 || (this.windowWidth - 16) == document.body.offsetWidth || this.windowWidth == document.body.offsetWidth) {
            tmpHeight = 0
        } else {
            tmpHeight = 21
        }
        if (document.documentElement.clientHeight > document.body.offsetHeight) {
            this.boxBg.style.height = document.documentElement.clientHeight + tmpHeight + "px"
        } else {
            this.boxBg.style.height = document.body.offsetHeight + tmpHeight + "px"
        }
    },
    resetBoxXY: function() {
        if (document.documentElement.clientWidth > this.box.offsetWidth) {
            this.box.style.left = (document.documentElement.clientWidth - this.box.offsetWidth) / 2 + "px"
        } else {
            this.box.style.left = "0px"
        }
        if (this.isIE6) {
            this.setTop()
        }
    },
    resetByObj: function(obj) {
        if (!obj) return;
        this.box.style.width = obj.offsetWidth + 8 + "px";
        this.boxContent.style.width = obj.offsetWidth + "px";
        this.box.style.height = obj.offsetHeight+this.boxHead.offsetHeight + "px";
        this.boxContent.style.height = obj.offsetHeight + "px";
        this.boxXY();
    },
    setTop: function() {
        if (this.boxBg.style.display == "none") return;
        var web_ide_height = this.isIE ? document.documentElement.offsetHeight: window.innerHeight;
        var new_top = 0;
        if (web_ide_height - this.box.offsetHeight > 0) {
            new_top = (web_ide_height - this.box.offsetHeight) / 2 + (document.documentElement.scrollTop ? document.documentElement.scrollTop: document.body.scrollTop)
        } else {
            new_top = (document.documentElement.scrollTop ? document.documentElement.scrollTop: document.body.scrollTop) - (this.box.offsetHeight - web_ide_height)
        }
        this.box.style.position = "absolute";
        this.box.style.top = new_top + "px"
    },
    boxXY: function() {
        if (document.documentElement.clientWidth > this.box.offsetWidth) {
            this.box.style.left = (document.documentElement.clientWidth - this.box.offsetWidth) / 2 + "px"
        } else {
            this.box.style.left = "0px"
        }
        if (this.isIE6) {
            this.setTop()
        } else {
            this.box.style.position = "fixed";
            this.box.style.top = ((this.isIE ? document.documentElement.offsetHeight: window.innerHeight) - this.box.offsetHeight) / 2 + "px"
        }
        this.resetBoxBg()
    },
    isParam: function(param) {
        return param != null && param != ''
    },
    init_shiping: function() {
        try {
            throw Error("get path")
        } catch(ex) {
            if (ex.fileName) this.path = ex.fileName;
            else if (ex.stack) this.path = (ex.stack.match(/at\s+(.*?):\d+:\d+/) || ['', ''])[1];
            else if (ex.sourceURL) this.path = ex.sourceURL
        }
        if (!this.path) {
            var scripts = document.getElementsByTagName("script"),
            script = scripts[scripts.length - 1];
            this.path = document.querySelector ? script.src: script.getAttribute("src", 4)
        }
        this.path = this.path.substr(this.path, this.path.lastIndexOf('/'));
        this.path = this.path.substr(this.path, this.path.lastIndexOf('/'));
        document.write('<link rel="stylesheet" type="text/css" id="mztDlgStyle" /><div id="divMztDlgBg"></div><div id="divMztDlg"  onkeypress="if(event.keyCode==27)mztDlg.close();"><img id="imgMztDlgCloseExternal" src="' + this.path + 'images/mztDlgCloseExternal.gif" /><div class="t"><div class="l"></div><div class="r"></div></div><div class="c"><div id="divMztDlgMain"><div id="divMztDlgHead"><img id="imgMztDlgIcon" align="absmiddle" src="images/mztDlgIcon.png" /><span id="spTitle"></span><img id="imgMztDlgCloseInternal" src="images/mztDlgCloseInternal.gif" /></div><table cellpadding="0" cellspacing="0" border="0" style="width:100%;"><tr><td id="tdMztDlgContent" style="padding:0!important;margin:0!important;"></td></tr></table></div></div><div class="t"><div class="l b"></div><div class="r rb"></div></div></div><div id="divMztDlgTmp"></div>');
        this.addEvent(window, "load", 
        function() {
            mztDlg.style = _('mztDlgStyle');
            mztDlg.boxBg = _('divMztDlgBg');
            mztDlg.box = _("divMztDlg");
            mztDlg.imgCloseExternal = _('imgMztDlgCloseExternal');
            mztDlg.imgCloseInternal = _('imgMztDlgCloseInternal');
            mztDlg.boxHead = _("divMztDlgHead");
            mztDlg.imgIcon = _("imgMztDlgIcon");
            mztDlg.boxTitle = _("spTitle");
            mztDlg.boxContent = _("tdMztDlgContent");
            mztDlg.boxTmp = _("divMztDlgTmp");
            mztDlg.addEvent(mztDlg.imgCloseExternal, "click", 
            function() {
                mztDlg.close()
            });
            mztDlg.addEvent(mztDlg.imgCloseInternal, "click", 
            function() {
                mztDlg.close()
            })
        },
        false);
        this.addEvent(window, "resize", 
        function() {
            if (mztDlg.boxBg.style.display == "none") return;
            mztDlg.resetBoxBg();
            mztDlg.resetBoxXY();
            mztDlg.setTop()
        },
        false);
        this.addEvent(window, "scroll", 
        function() {
            if (mztDlg.boxBg && mztDlg.boxBg.style.display == "none") return;
            if (mztDlg.isIE6) {
                mztDlg.setTop()
            } else {
                var windowHeight = mztDlg.isIE ? document.documentElement.offsetHeight: window.innerHeight;
                if (mztDlg.box) {
                    mztDlg.box.style.position = "fixed";
                    mztDlg.box.style.top = (windowHeight - mztDlg.box.offsetHeight) / 2 + "px"
                }
            }
        },
        false);
    },
    show: function(obj) {
        if (!obj || this.boxBg.style.display != "none" && this.boxBg.style.display != '' && obj.id != 'divMztDlgTmp') return;
        var params = this.arguments ? this.arguments: arguments;
        var objWidth = 0;
        var objHeight = 0;
        if (obj.style.display == "none" || obj.style.display == '') {
            obj.style.display = "block";
            var tmpPosition = obj.style.position;
            obj.style.position = "absolute";
            objWidth = obj.offsetWidth;
            objHeight = obj.offsetHeight;
            obj.style.display = "none";
            obj.style.position = tmpPosition
        }
        this.boxHead.style.display = "block";
        if (params.length > 1) {
            if (params[1] == null) {
                this.boxHead.style.display = "none"
            } else if (params[1] == 0) {
                this.boxTitle.innerHTML = "Message Box"
            } else {
                this.boxTitle.innerHTML = params[1]
            }
        } else {
            this.boxTitle.innerHTML = "Message Box"
        }
        this.boxBg.style.display = "block";
        this.box.style.display = "block";
        if (params.length > 3 && this.isParam(params[3])) {
            this.box.style.width = (parseInt(params[3]) + 16) + "px"
        } else {
            this.box.style.width = objWidth + 8 + "px"
        }
        if (params.length > 4 && this.isParam(params[4])) {
            this.box.style.height = params[4]
        } else {
            this.boxContent.style.height = objHeight + "px";
            if (this.boxHead.style.display != "none") {
                this.box.style.height = (objHeight + 22) + "px"
            } else {
                this.box.style.height = (objHeight + (this.isFF ? 0: 2)) + "px"
            }
        }
        if (params.length > 5) {
            if (this.isParam(params[5])) {
                this.imgIcon.src = params[5]
            }
        } else {
            this.imgIcon.src =  "images/mztDlgIcon.png"
        }
        if (params.length > 6) {
            this.style.href = this.path + "/css/cssMztDlg" + params[6] + ".css"
        } else {
            this.style.href = ""
        }
        if (this.boxTmp) {
            if (this.isIE) {
                this.boxTmp.removeNode(true)
            } else {
                if (this.boxTmp.parentNode) this.boxTmp.parentNode.removeChild(this.boxTmp)
            }
        }
        this.boxContent.appendChild(obj.cloneNode(true));
		if(this.boxContent.childNodes.length>0){
	        this.boxContent.childNodes[0].style.display = "block";
			this.boxContent.childNodes[0].id = "divMztDlgTmp";
		}
        if (params.length > 2 && _(params[2]) && this.isParam(params[2])) {
            if (obj.id != 'divMztDlgTmp') {
                _(params[2]).focus();
                if (this.isIE) {
                    _(params[2]).focus()
                }
            }
        } else {
            this.box.focus()
        }
        if (/msie 8\.0/i.test(navigator.userAgent)) {
            setTimeout(function() {
					try{
					mztDlg.boxContent.childNodes[0].style.position = "inherit"
					}catch(e){					}
            },
            1)
        }
        if (this.boxHead.style.display != "none") {
            this.boxContent.style.height = (this.box.offsetHeight - (this.isFF ? 20: 22)) + "px";
            this.imgCloseExternal.style.display = "none";
            this.imgCloseInternal.style.display = "inline"
        } else {
            this.boxContent.style.height = (this.box.offsetHeight - (this.isFF ? 0: 2)) + "px";
            this.imgCloseExternal.style.display = "block";
            this.imgCloseInternal.style.display = "none"
        }
        this.arguments = null;
        this.boxXY()
    },
    showHtml: function(html) {
        this.arguments = arguments;
        if (this.arguments.length < 4) {
            this.boxTmp.style.width = "auto";
            this.boxTmp.style.height = "auto"
        }
        this.boxTmp.innerHTML = "<div style='padding:20px 20px 20px 20px;'>" + html + "</div>";
        this.show(this.boxTmp)
    },
    showUrl: function(url) {
        this.arguments = arguments;
        var html = '';
        if (this.arguments.length > 4) {
            if (this.arguments[1] != null) {
                html = '<iframe id="ifrMztDlg" frameborder="0" style="width:' + (parseInt(this.arguments[3]) + 8) + 'px;height:' + (parseInt(this.arguments[4]) - 20) + 'px" src="' + url + '"></iframe>'
            } else {
                html = '<iframe id="ifrMztDlg" frameborder="0" style="width:' + (parseInt(this.arguments[3]) + 8) + 'px;height:' + this.arguments[4] + '" src="' + url + '"></iframe>'
            }
        } else {
            html = '<iframe id="ifrMztDlg" frameborder="0" src="' + url + '"></iframe>'
        }
        this.boxTmp.innerHTML = html;
        this.show(this.boxTmp);
        if (this.isIE6) {
            setTimeout(function() {
                _('ifrMztDlg').src = url
            },
            0)
        }
    },
    showId: function(id) {
        this.arguments = arguments;
        this.show(_(id));
    }
};
mztDlg.init_shiping();


function show_miscellaneous_list(pr_id){
  $.post("shipping_4px.php?action=select_incidentalprice&isajax=true", {pr_id:pr_id},function(data) {$("#show_loading").html(data);});
}
function miscellaneous_setup(pr_id){
  show_miscellaneous_list(pr_id);
  javascript:box.showUpload();
}
function insert_incidentalprice(pr_id){
  $.post("shipping_4px.php?action=insert_incidentalprice&isajax=true", {pr_id:pr_id},function(data) {$("#show_loading").html(data);}); 
  return false;
}
function insert_return(pr_id){
  show_miscellaneous_list(pr_id);
}
var utime=0;
function insert_incidentalprice_save(){
  var new_date=Date.parse(new Date())/1000;
  var time_new =(new_date-utime);
  if(time_new<5){
	alert('请稍后提交！');
	return false;
  }
  utime=new_date;
  var insert_pr_id      = parseInt($("#insert_pr_id").val());
  var action_way        = $("#action_way").val();
  var zf_id             = $("#zf_id").val(); 
  var insert_fk_code    = $("#insert_fk_code").val();
  var insert_ut_code    = $("#insert_ut_code").val();
  var insert_pricevalue = $("#insert_pricevalue").val();
  var insert_max_value  = $("#insert_max_value").val();
  var insert_min_value  = $("#insert_min_value").val();
  var insert_status     = $("input:checked").val(); 
  $.post("shipping_4px.php?action=insert_incidentalprice_save&isajax=true", {action_way:action_way,insert_pr_id:insert_pr_id,insert_fk_code:insert_fk_code,insert_ut_code:insert_ut_code,insert_pricevalue:insert_pricevalue,insert_max_value:insert_max_value,insert_min_value:insert_min_value,insert_status:insert_status,zf_id:zf_id},function(data){
  $("#show_loading").html(data);
}); alert('Add Success!');
 show_miscellaneous_list(insert_pr_id);
}
function send_edit_incidentalprice(handle_pr_id,id){
  $.post("shipping_4px.php?action=show_incidentalprice_info&isajax=true", {handle_pr_id:handle_pr_id,id:id},function(data) {$("#show_loading").html(data);});
}
function delete_zf_info(pr_id,id){
  $.post("shipping_4px.php?action=delete_zf_info&isajax=true", {pr_id:pr_id,id:id},function(data){$("#show_loading").html(data);});
}



