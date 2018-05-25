// 给JS日期对象增加fmt方法
Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, // 月份
        "d+": this.getDate(), // 日
        "h+": this.getHours(), // 小时
        "m+": this.getMinutes(), // 分
        "s+": this.getSeconds(), // 秒
        "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
        "S": this.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

// 日期格式化
var DataFormatter = {
	DateFormatter : function(value, rec, index){
		if(value == undefined || value == ''){
			return "";
		}	
		/* json格式时间转js时间格式 */
        var obj = new Date(value);
        if (obj.getFullYear() < 1900) {
            return "";
        }
        return obj.format("yyyy-MM-dd");
	},
	DateTimeFormatter : function(value, rec, index){
		if(value == undefined || value == ''){
			return "";
		}	
		/* json格式时间转js时间格式 */
        var obj = new Date(value);
        if (obj.getFullYear() < 1900) {
            return "";
        }
        return obj.format("yyyy-MM-dd hh:mm:ss");
	},
	Formatter : function(value, rec, index){
		if(value == undefined || value == ''){
			return "";
		}	
		/* json格式时间转js时间格式 */
        var obj = new Date(value);
        if (obj.getFullYear() < 1900) {
            return "";
        }
        return obj.format("MM/dd/yyyy");
	}
}

/**
 * 打开对话框
 * @param title
 * @param url
 * @param width
 * @param height
 * @returns
 */
function showDialog(title, url, width, height, onClose){
	top.CommDialog(title, url, width, height, onClose);
}

/**
 * 关闭对话框
 * @returns
 */
function hideDialog(){
	top.closeDialog();
}

/*打开加载框*/
function showMaskLayer(){
	$("body").append('<div class="pageLoading" style="display:block;"><div class="pageLoading_con"><img alt="" src="../../../resources/images/pageLoading.gif"><p>请稍后...</p></div></div>');
}
/*关闭加载框*/
function hideMaskLayer(){
	$(".pageLoading").remove();
}

require(['jquery','easyui','insdep','fakeloader'], function($){
	
    // datagrid没有找到数据时默认显示
    $.fn.datagrid.defaults.emptyMsg = '没有找到符合条件的信息';
    // 自定义表单数据填充方法，支持内嵌JSON对象属性注入
    $.extend($.fn.form.methods, {
    	CusFormLoader: function (jq, data) {
    		return jq.each(
				function () {
					loadVal(this, data);
				}
    		);
    		function loadVal(formElement, data) {
    			if (!$.data(formElement, "form")) {
    				$.data(formElement, "form", {
    					options: $.extend({}, $.fn.form.defaults)
    				});
    			}
    			var opts = $.data(formElement, "form").options;
    			if (typeof data == "string") {
    				var optSource = {};
    				if (opts.onBeforeLoad.call(formElement, optSource) == false) {
    					return;
    				}
    				$.ajax({
    					url: data,
    					data: optSource,
    					dataType: "json",
    					success: function (data) {
    						bindValue(data);
    					},
    					error: function () {
    						opts.onLoadError.apply(formElement, arguments);
    					}
    				});
    			} else {
    				bindValue(data);
    			}
    			function bindValue(data) {
    				var form = $(formElement);
    				for (var name in data) {
    					var val = data[name];
    					var rr = setRadioAndCheckBox(name, val);
    					if (!rr.length) {
    						var f = form.find("input[numberboxName=\"" + name + "\"]");
    						if (f.length) {
    							f.numberbox("setValue", val);
    						} else {
    							if (typeof val === 'object' && val != null) {
    								$.each(val, function (cName, value) {
    									var crr = setRadioAndCheckBox(name + "." + cName, value);
    									if (!crr.length) {
    										var cf = form.find("input[numberboxName=\"" + name + "." + cName + "\"]");
    										if (cf.length) {
    											cf.numberbox("setValue", value);
    										} else {
    											cf = form.find("select[comboname=\"" + name + "." + cName + "\"]");
    											if(cf.length){
    												cf.combobox('setValue',value);
    											}else{
    												// 文本框赋值
    												cf = form.find("input[textboxName=\"" + name + "." + cName + "\"]");
    												if(cf.length){
    													cf.textbox('setValue',value);
    												}
    											}
    										}
    									}
    								});
    							} else {
    								cf = form.find("input[textboxName=\"" + name + "\"]");
    								if(cf.length){
										cf.textbox('setValue',val);
									}else{
										$("input[name=\"" + name + "\"]", form).val(val);
									}
    							}
    						}
    					}
    					setEasyUiCtrl(name, val);
    				}
    				opts.onLoadSuccess.call(formElement, data);
    				setValBox(formElement);
    			}
    			function setRadioAndCheckBox(name, val) {
    				var rr = $(formElement).find("input[name=\"" + name + "\"][type=radio], input[name=\"" + name + "\"][type=checkbox]");
    				rr._propAttr("checked", false);
    				rr.each(function () {
    					var f = $(this);
    					if (f.val() == String(val) || $.inArray(f.val(), val) >= 0) {
    						f._propAttr("checked", true);
    					}
    				});
    				return rr;
    			}
    			function setEasyUiCtrl(name, val) {
    				var form = $(formElement);
    				var cc = ["combobox", "combotree", "combogrid", "datetimebox", "datebox", "combo"];
    				var c = form.find("[comboName=\"" + name + "\"]");
    				if (c.length) {
    					for (var i = 0; i < cc.length; i++) {
    						var type = cc[i];
    						if (c.hasClass(type + "-f")) {
    							if (c[type]("options").multiple) {
    								c[type]("setValues", val);
    							} else {
    								c[type]("setValue", val);
    							}
    							return;
    						}
    					}
    				}
    			}
    			function setValBox(eleForm) {
    				if ($.fn.validatebox) {
    					var t = $(eleForm);
    					t.find(".validatebox-text:not(:disabled)").validatebox("validate");
    					var valBox = t.find(".validatebox-invalid");
    					valBox.filter(":not(:disabled):first").focus();
    					return valBox.length == 0;
    				}
    				return true;
    			}
    		}
    	}
    });
    
    $.ajaxSetup({  
    	complete:function(XMLHttpRequest, textStatus){  
    		if(textStatus=="error"){
    			if(XMLHttpRequest.status == '500'){
    				top.$.messager.alert('提示信息', "资源不存在！请确保你已获取正确的网址！", 'info');  
    			} else if(XMLHttpRequest.status == '404'){
    				top.$.messager.alert('提示信息', "请求的资源不存在，请联系管理员", 'info');  
    			} else if (XMLHttpRequest.status == '403'){
    				top.$.messager.alert('提示信息', "您没有权限执行此操作，请联系管理员！", 'info');
    			} else if (XMLHttpRequest.status == '99999999'){
    				top.$.messager.alert('提示信息', "登陆超时！请重新登陆！", 'info',function(){  
        				top.window.location.href = '/';  
        			});
    			} else {
    				//top.$.messager.alert('提示信息', "未知错误，请联系管理员(错误码：" + XMLHttpRequest.status + ")！", 'info');  
    			}
    		}  
        }  
    });
    
    // 关闭加载效果
    $("#fakeloader").fadeOut(200);
    
    // 手动渲染EasyUI控件
	$.parser.parse()
	
	$.extend($.fn.validatebox.defaults.rules, {
	    idcard : {// 验证身份证
	        validator : function(value) {
	            return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
	        },
	        message : '身份证号码格式不正确'
	    },
	    phone : {// 验证电话号码
	        validator : function(value) {
	            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
	        },
	        message : '格式不正确,请使用下面格式:010-88888888'
	    },
	    mobile : {// 验证手机号码
	        validator : function(value) {
	            return /^(1)\d{10}$/i.test(value);
	        },
	        message : '手机号码格式不正确'
	    },
	    special : {
	    	validator : function(value) {
	    		var pattern = new RegExp("[`~!%@#$^&*=\\[\\]<>?~！ @#￥……&*——【】‘；：”“'、？]");
	            return !pattern.test(value);
	        },
	        message : '请勿输入特殊字符'
	    },
	    ltToday : {// 验证日期
	        validator : function(value) {
	        	if(value){
					var date = new Date(value.replace(/-/g,"/")) 
					return date<=new Date();
	        	}
	            return true;
	        },
	        message : '该日期不得大于今日'
	    },
	    phoneAndMobile : {// 电话号码或手机号码  
            validator : function(value) {
            	return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value) || /^(1)\d{10}$/i.test(value); 
            },  
            message : '电话号码或手机号码格式不正确'  
        },
        name: {// 验证姓名，可以是中文或英文
            validator: function (value) {
                return /^[\Α-\￥]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
            },
            message: '请输入中文或英文'
        },
        postzipcode: {// 验证邮政编码
            validator: function (value) {
                return /^[1-9]\d{5}$/i.test(value);
            },
            message: '邮政编码格式不正确'
        },
        day: {// 验证1-31之间的正整数
            validator: function (value) {
                return /^((0?[1-9])|((1|2)[0-9])|30|31)$/.test(value);
            },
            message: '只能输入1-31之间的正整数'
        },
		numbers: {// 验证非0正整数
            validator: function (value) {
                return /^\+?[1-9][0-9]*$/.test(value);
            },
            message: '只能输入非0正整数'
        },
        engOrChineseAndLength : {// 可以是中文或英文  
            validator : function(value) {  
                return /^([A-Za-z]|[\u4E00-\u9FA5])+$/i.test(value);  
            },  
            message : '请输入中文或英文'
        },
        safepass: {
        	  validator: function (value, param) {
        		  	return /^[A-Za-z0-9\-]+$/.test(value);
        	  },
        	  message: '只能输入字母、数字和-组成'
    	 },
    	 engOrChineseAndNum : {// 可以是中文、英文或数字 
             validator : function(value) {  
                 return /^[a-zA-Z0-9\u4E00-\u9FA5\-]+$/i.test(value);  
             },  
             message : '请输入中文、英文或数字'
         },
         account: {
        	 validator : function(value) {  
                 return /^[a-zA-Z0-9]+$/i.test(value);  
             },  
             message : '请输入英文、数字及其组合'
         },
         password : {// 验证密码  
             validator : function(value) {  
                 return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value);  
             },  
             message : '密码不合法（字母开头，允许6-16字节，允许字母数字下划线）'  
         },
         validateLicenseNo : {
	    	 validator : function(value) {
	    		 return /(^[\u4E00-\u9FA5]{1}[A-Z0-9]{6}$)|(^[A-Z]{2}[A-Z0-9]{2}[A-Z0-9\u4E00-\u9FA5]{1}[A-Z0-9]{4}$)|(^[\u4E00-\u9FA5]{1}[A-Z0-9]{5}[挂学警军港澳]{1}$)|(^[A-Z]{2}[0-9]{5}$)|(^(08|38){1}[A-Z0-9]{4}[A-Z0-9挂学警军港澳]{1}$)/.test(value);
		     },
		     message : '车牌号格式不正确'
	     }
         
	});
	
	
	//获取当前FileBox对象选中的文件的File对象
	$.extend($.fn.filebox.methods, {
	    getFile: function (myself) {
	        var temp = $(myself).next().children("[type='file']");
	        var file = document.getElementById(temp.attr("id"));

	        if (file.files.length > 0) {
	            // 若选中一个文件，则返回该文件的File对象
	            return file.files[0];
	        }
	        // 若未选中不论什么文件，则返回null
	        return null;
	    }
	});
	
	/** 
	 * linkbutton方法扩展 
	 * @param {Object} jq 
	 */  
	$.extend($.fn.linkbutton.methods, {  
	    /** 
	     * 激活选项（覆盖重写） 
	     * @param {Object} jq 
	     */  
	    enable: function(jq){  
	        return jq.each(function(){  
	            var state = $.data(this, 'linkbutton');  
	            if ($(this).hasClass('l-btn-disabled')) {  
	                var itemData = state._eventsStore;  
	                //恢复超链接  
	                if (itemData.href) {  
	                    $(this).attr("href", itemData.href);  
	                }  
	                //回复点击事件  
	                if (itemData.onclicks) {  
	                    for (var j = 0; j < itemData.onclicks.length; j++) {  
	                        $(this).bind('click', itemData.onclicks[j]);  
	                    }  
	                }  
	                //设置target为null，清空存储的事件处理程序  
	                itemData.target = null;  
	                itemData.onclicks = [];  
	                $(this).removeClass('l-btn-disabled');  
	            }  
	        });  
	    },  
	    /** 
	     * 禁用选项（覆盖重写） 
	     * @param {Object} jq 
	     */  
	    disable: function(jq){  
	        return jq.each(function(){  
	            var state = $.data(this, 'linkbutton');  
	            if (!state._eventsStore)  
	                state._eventsStore = {};  
	            if (!$(this).hasClass('l-btn-disabled')) {  
	                var eventsStore = {};  
	                eventsStore.target = this;  
	                eventsStore.onclicks = [];  
	                //处理超链接  
	                var strHref = $(this).attr("href");  
	                if (strHref) {  
	                    eventsStore.href = strHref;  
	                    $(this).attr("href", "javascript:void(0)");  
	                }  
	                //处理直接耦合绑定到onclick属性上的事件  
	                var onclickStr = $(this).attr("onclick");  
	                if (onclickStr && onclickStr != "") {  
	                    eventsStore.onclicks[eventsStore.onclicks.length] = new Function(onclickStr);  
	                    $(this).attr("onclick", "");  
	                }  
	                //处理使用jquery绑定的事件  
	                var eventDatas = $(this).data("events") || $._data(this, 'events');  
	                if (eventDatas["click"]) {  
	                    var eventData = eventDatas["click"];  
	                    for (var i = 0; i < eventData.length; i++) {  
	                        if (eventData[i].namespace != "menu") {  
	                            eventsStore.onclicks[eventsStore.onclicks.length] = eventData[i]["handler"];  
	                            $(this).unbind('click', eventData[i]["handler"]);  
	                            i--;  
	                        }  
	                    }  
	                }  
	                state._eventsStore = eventsStore;  
	                $(this).addClass('l-btn-disabled');  
	            }  
	        });  
	    }  
	}); 
	
});