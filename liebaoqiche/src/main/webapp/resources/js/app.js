/**
 * 创建TabPanel
 * 
 * @param title
 *            标题
 * @param url
 *            打开的地址
 * @param closeable
 *            是否可以关闭
 * @returns
 */
var currentModule = "";
function createTab(moduleId, title, url, closeable){
	var newTab = $("#app-tabs").tabs('getTab',title);
	if(newTab){
		$("#app-tabs").tabs('select', $("#app-tabs").tabs('getTabIndex',newTab));
		// 点击左侧菜单刷新Tab内容
		$('#frame_' + moduleId ).attr('src', $('#frame_' + moduleId ).attr('src'));
	}else{
		var tabs = $("#app-tabs").tabs('tabs');
		if(tabs && tabs.length > 10){
			$.messager.alert('提示','为保证系统流畅使用，标签页不宜超过10个，请先关闭其他的标签页，再重新打开新的标签页。','warning');
		}else{
			$("#app-tabs").tabs('add', {
				fit: true,
				title: title,
				closable: closeable,
				content:'<iframe id="frame_' + moduleId + '" name="frame_' + moduleId + '" scrolling="no" frameborder="0"  src="' + url + '" style="padding:0px; margin:0px; width:100%;height:100%;"></iframe>'
			});
		}
	}
	
	// 更新选中状态
	if(currentModule != moduleId){
		if(currentModule != ""){
			$("#" + currentModule).removeClass("on");
		}
		
		currentModule = moduleId;
		$("#" + moduleId).addClass("on");
	}
}

/**
 * 公共的请求方法，统一处理返回信息
 * @param requestUrl
 * @param requestParam
 * @param successCallback
 * @param errorCallback
 * @returns
 */
function PostRequest(requestUrl, requestParam, successCallback, failureCallback, errorCallback){
	$.ajax({
		url: requestUrl,
		data: requestParam,
		type: 'post',
        dataType: 'json',
        success: function (json) {
        	if (json && json.rtnCode == '00000000') {
                if(successCallback){
                	successCallback(json);
                }
            } else {
            	if(failureCallback){
            		failureCallback(json);
            	}
            }
		},
		error: function(){
			if(errorCallback){
				errorCallback();
			}
		}
	});
}

/**
 * 公共弹窗
 * @param title
 * @param url
 * @param width
 * @param height
 * @returns
 */
var dialogs = new Array();
var dialogsCount = 1;
function CommDialog(title, url, width, height, onCloseCallback){
	
	var dialogId = "CommDialog_" + dialogsCount++;
	var dialogContent = '<iframe id="CommDialog_IFrame_' + dialogId + '" scrolling="no" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
	var dialogDiv = '<div id="' + dialogId + '" title="' + title + '"></div>';
	$(document.body).append(dialogDiv);
	
	$("#" + dialogId).dialog({
		content: dialogContent,
		width: width?width:800,
		height: height?height:600,
		title: title,
		modal: true,
		onClose: function(){
			$(this).dialog("destroy");
			if(onCloseCallback){
				onCloseCallback();
			}
		}
	});
	
	dialogs.push(dialogId);
}

/**
 * 关闭对话框
 * @returns
 */
function closeDialog(){
	if(dialogs.length > 0){
		var dialogId = dialogs.pop();
		$("#" + dialogId).dialog("close");
	}
}

/*计算时长*/
var timer;
function keepTime(){
	var HH = 0;
	var mm = 0;
	var ss = 0;
	var str = '';
	var kt=document.getElementById("keepTime");
	kt.innerHTML="00:00:00";
	clearInterval(timer);
	timer = setInterval(function(){
			str="";
    		if(++ss==60)
    		{
    			if(++mm==60)
    			{
    				HH++;
    				mm=0;
    			}
    			ss=0;
    		}
    		str+=HH<10?"0"+HH:HH;
    		str+=":";
    		str+=mm<10?"0"+mm:mm;
    		str+=":";
    		str+=ss<10?"0"+ss:ss;
    		kt.innerHTML=str;
	},1000);
};


/**
 * 加载页面所有js完成后的逻辑代码写在这里面
*/
require(['jquery','common'], function($){
	/*侧边栏*/
	$(document).on("click",".slider-first",function(){
		var _this=$(this).parent();
		var _thisAct=$(this).parent().hasClass("active");
		if(_thisAct){
			_this.removeClass("active");
		}else{
			_this.addClass("active").siblings().removeClass("active");
		}
	})
	
	/*登录时长*/
	keepTime();
	/*个人头像点击下拉*/
	var pMes=$(".person-mes");
	$(".person-pic").hover(function(){
		$(".person-mes").addClass('showLog');
	},function(){
		$(".person-mes").removeClass('showLog');
	})
	
	$(".person-mes").hover(function(){
		$(".person-mes").addClass('showLog');
	},function(){
		$(".person-mes").removeClass('showLog');
	})
	
	/*退出*/
	$(document).on("click",".exitBtn",function(){
		$.messager.confirm('警告','确定退出吗？',function(r){
			if(r){
				window.location.href = "/userLogout";
			}else{
				//取消 不退出 
				$(".person-mes").removeClass('showLog');
			}
		})
	});
	//修改密码
    $(".updatePassword").click(function(){
    	CommDialog('<i class="fa fa-id-badge fa-lg"></i>&nbsp;&nbsp;修改密码','/updatePassView', 600, 400, function(){
    	});
    })
	
    //修改用户信息
    $(".updateUser").click(function(){
    	showDialog('<i class="fa fa-save fa-lg"></i>&nbsp;&nbsp;修改用户信息', '/updateUserPage', 800, 500, function(){
    	});
    })
});

