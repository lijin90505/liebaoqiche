<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>PayInfoConfig</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
	    	<form id="DataForm" method="post">
	    		<table style="width: 100%;">
	    			<tbody>
	    				<tr>	
	    					<td labelWidth="100"  style="width: 50%; padding: 5px; text-align: center;">
	                        	<select id="payChannelId" name="payChannelId"  class="easyui-combobox" required="true" data-options="valueField:'id', textField:'text',prompt:'支付类型'" style="width: 90%;height:32px;" label="支付渠道" labelWidth="100" >
							        <option value="9999">请选择</option>
							        <c:forEach items="${payChannelList}" var="pc">
	                        			<option value="${pc.id}" <c:if test="${payInfoConfig.payChannelId==pc.id}">selected="selected"</c:if>>${pc.payChannelName}</option>
	                        		</c:forEach>
								</select>
	    					</td>
	    					<td labelWidth="100" style="width: 50%; padding: 5px; text-align: center;">
	                        	<select id="payTypeId" name="payTypeId" class="easyui-combobox" required="true" data-options="valueField:'id', textField:'text', panelHeight:'auto',prompt:'支付类型'" style="width: 90%;height:32px;" label="支付类型" labelWidth="100">
									<c:forEach items="${payTypeList}" var="pt">
	                        			<option value="${pt.id}" <c:if test="${payInfoConfig.payTypeId==pt.id}">selected="selected"</c:if>>${pt.payName}</option>
	                        		</c:forEach>
								</select>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input type="hidden" id="id" name="id" value="${payInfoConfig.id}">
	    						<input class="easyui-textbox" id="appid" name="appid" value="${payInfoConfig.appid}" labelWidth="100" label="appid" required="true" data-options="prompt:'appid',required:true,validType:['appid','appid','length[2,50]']" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="merchantId" name="merchantId"  value="${payInfoConfig.merchantId}" labelWidth="100" label="商户号"  data-options="prompt:'商户号',validType:['merchantId','integer','length[6,50]']" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="merchantName" name="merchantName" required="true"  value="${payInfoConfig.merchantName}" labelWidth="100" label="商户号名称"  data-options="prompt:'商户号名称',required:true,validType:['merchantName','merchantName','length[2,50]']" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="merchantCode" name="merchantCode" required="true"  value="${payInfoConfig.merchantCode}" labelWidth="100" label="商户号编码" data-options="prompt:'商户号编码',required:true,validType:['merchantCode','merchantCode','length[2,50]']" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="merchantKey" name="merchantKey" value="${payInfoConfig.merchantKey}" labelWidth="100" label="商户号密钥" data-options="prompt:'商户号密钥',validType:['merchantKey','merchantKey','length[8,50]']"  style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="keyStoreFile" name="keyStoreFile" value="${payInfoConfig.keyStoreFile}" labelWidth="100" label="证书路径" data-options="prompt:'证书路径',validType:['length[6,50]']"  style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="keyStorePassword" name="keyStorePassword" value="${payInfoConfig.keyStorePassword}" labelWidth="100" label="证书密码"  data-options="prompt:'证书密码',validType:['keyStorePassword','keyStorePassword','length[6,50]']" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="requestUrl" name="requestUrl" value="${payInfoConfig.requestUrl}" labelWidth="100" label="请求url"  data-options="prompt:'请求url',validType:['length[6,200]']" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="notifyUrl" name="notifyUrl" value="${payInfoConfig.notifyUrl}" labelWidth="100" label="回调url"  data-options="prompt:'回调url',validType:['length[6,200]']" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="backUrl" name="backUrl" value="${payInfoConfig.backUrl}" labelWidth="100" label="后置通知url"  data-options="prompt:'后置通知url',validType:['length[6,200]']" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="frontUrl" name="frontUrl" value="${payInfoConfig.frontUrl}" labelWidth="100" label="前置通知url"  data-options="prompt:'前置通知url',validType:['length[6,200]']" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="publicKey" name="publicKey" value="${payInfoConfig.publicKey}" labelWidth="100" label="公钥"  data-options="prompt:'公钥'"  data-options="prompt:'公钥',validType:['length[6,5000]']" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="privateKey" name="privateKey" value="${payInfoConfig.privateKey}" labelWidth="100" label="私钥"  data-options="prompt:'私钥'"  data-options="prompt:'私钥',validType:['length[6,5000]']" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<%-- <tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;" >
	    						<textarea class="easyui-textbox" name="remarks"
									style="width: 95%; maxlength="100"; height: 80px;" labelWidth="70" label="备注"
									data-options="prompt:'备注',validType:['remarks','remarks','length[6,100]']">${payInfo.remarks}</textarea>
	    					</td>
	    				</tr> --%>
	    				<tr>
						    <td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
							<textarea class="easyui-textbox" name="remarks" maxlength="1200"
							          style="width: 95%; height: 80px;" labelWidth="100" label="备注"
							          data-options="validType:'length[1,200]',multiline:true,prompt:'备注',tipPosition:'bottom'">${payInfo.remarks}</textarea>
						    </td>
					    </tr>
	    			</tbody>
	    		</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
            <a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;"><i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存</a>
            <a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnSave").on('click', function(){
				var payChannel = $("#payChannelId").textbox("getValue");
				if(payChannel=="9999"){
					$.messager.alert('提示', "请选择支付渠道", "success");
					return;
				}
				
				$("#btnSave").linkbutton('disable');
			
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/pay/payInfoConfig/create':'${ctx}/pay/payInfoConfig/update',
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success: function(data){
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success",function(){
								$("#btnSave").linkbutton('enable');
								hideDialog();
							});
						}else{
							$.messager.alert('提示', json.rtnMsg, "error",function(){
								$("#btnSave").linkbutton('enable');
								hideDialog();
							});
						}
					},
					error: function(){
						$("#btnSave").linkbutton('enable');
						hideDialog();
					}
				});
			});
			
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				hideDialog();
			});
			
			//根据支付渠道选择支付类型
			$('#payChannelId').combobox({  
			    onChange: function(value) {
				var payChannelId = $("#payChannelId").textbox("getValue");
					if(payChannelId.trim() != ''){
						
						$.ajax({
		                    url: '${ctx}/pay/payInfoConfig/queryByPayType',
		                    data: {
		                    	payChannelId: payChannelId
		                    },
		                    type: 'post',
		                    dataType: 'json',
		                    success: function (json) {
		                     	var payTypeList = json.payTypeList;
								var data,json;
								data = [];
	                        	for (var i = 0; i < payTypeList.length; i++) {
									data.push({"id":payTypeList[i].id,"text":payTypeList[i].payName});
	                        	}	
								$("#payTypeId").combobox({editable:false});
								$("#payTypeId").combobox({data:data});
		                    }		
		            	});
					}
			    }
			});
			
			$.extend($.fn.validatebox.defaults.rules, {
			    integer : {// 验证整数
		            validator : function(value) {
		                return /^[1-9]\d*$/i.test(value);
		            },
		            message : '请输入数字格式！'
		        },
		        remarks : {// 验证备注
		        	validator : function(value) {
		        		 var canMatch=  /[@#\$%\^&\*]+/g.test(value);
		                 return !canMatch;
		            },
		            message : '这个备注不太友好，请检查后再输入吧。'		           
		        },
		        appid:{
		        	validator : function(value) {
		                return /^[a-zA-Z0-9]+$/.test(value);
		            },
		            message : 'appid只能是字母加数字，请重新输入！'
		        },
		        merchantName:{
		        	validator : function(value) {
		                return /^[a-zA-Z\u4e00-\u9fa5]+$/.test(value);
		            },
		            message : '商户号名称只能是字母加中文，请重新输入！'
		        },
		        merchantCode:{
		        	validator : function(value) {
		                return /^[A-Z_]{1,}$/.test(value);
		            },
		            message : '商户号编码只能大写字母加下划线，请重新输入！'
		        },
		        merchantKey:{
		        	validator : function(value) {
		        		return /^[a-zA-Z0-9]+$/.test(value);
		            },
		            message : '商户号密钥只能字母加数字，请重新输入！'
		        },
		        keyStorePassword:{
		        	validator : function(value) {
		        		 return /^[a-zA-Z0-9]+$/.test(value);
		            },
		            message : '证书路径格式错误，请重新输入！'
		        }
			});
		});
	</script>
</body>
</html>