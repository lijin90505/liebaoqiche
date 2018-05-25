<%@ page contentType="text/html;charset=UTF-8" %>
 <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
<title>修改密码</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
 	.textbox .textbox-addon .textbox-icon {
    	padding: 0 5px;
 	} 
</style>
</head>
<body>
 	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
 <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
		<form id="DataForm" method="post">
		<table style="width: 100%;">
	    			<tbody>
	    				<tr>
	    					<td align="center" style="padding: 5px" >
	    						<input class="easyui-textbox" id="oldPass" name="oldPass"  labelWidth="100" label="旧密码" required=true  data-options="prompt:'旧密码'" style="width: 100%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td align="center" style="padding: 5px" >
	    						<input class="easyui-passwordbox" id="password" name="password" labelWidth="100" label="新密码"  required=true  data-options="prompt:'新密码',validType:'special'"  style="width: 100%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td align="center" style="padding: 5px" >
	    						<input class="easyui-passwordbox" id="repassword" name="repassword"  labelWidth="100" label="确认密码"  required=true 
	    						data-options="prompt:'确认密码'"  validType='equalTo["#password"]'
	    						style="width: 100%;">
	    					</td>
	    				</tr>
	    			</tbody>
	    		</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align: left; padding: 5px;">
            <a id="btnSave" href="javascript:void(0)"  class="easyui-linkbutton button-success" style="width: 80px;"><i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;确认</a>
            <a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
	</div>
 	<script type="text/javascript">
	require(['jquery','common'], function($){
		$('#btnSave').click(function(){
			$('#DataForm').form('submit',{
				url:'${ctx}/system/sysUser/actUpdatePass',
				onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success: function(data){    
						var map = eval('('+data+')');
						console.log(map);
						if(map.rtnCode == 00000000){
							$.messager.alert('通知',map.rtnMsg,"info",function(){
							
				        		window.location = '/userLogout';
				        	});
						}else{
							$.messager.alert('通知',map.rtnMsg,"info");
						}
				        	
				    }    
				});
		});
		$('#btnCancel').click(function(){
			hideDialog();
		});
		$.extend($.fn.validatebox.defaults.rules, {    
	 		equalTo : {// 确认密码  
	 			validator: function(value,param) {
	 	    		  return value == $(param[0]).val();
	 	    	},
	 	        message : '确认密码不相同'
	 	    }
		});
	});
</script>
</body>

</html>