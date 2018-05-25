<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>PayType</title>
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
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input type="hidden" id="id" name="id" value="${payType.id}" />
	    						<select name="payChannelId" id="payChannelId" label="支付渠道" editable="false" labelWidth="100"  class="easyui-combobox"  required="true" data-options="valueField:'id', textField:'text',prompt:'支付渠道'" style="width: 90%;">
									<c:forEach items="${payChannelList}" var="pc">
										<option value="${pc.id}" <c:if test="${pc.id== payType.payChannelId}"> selected="selected"</c:if>>${pc.payChannelName}</option>
									</c:forEach>
	    						</select>
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<c:choose>
	    							<c:when test="${payType.payType != null}">
	    								<input class="easyui-textbox" disabled="disabled" id="payType" name="payType" value="${payType.payType}" labelWidth="100" label="支付类型编码"  data-options="prompt:'支付类型编码',required:true,validType:['remarks','length[0,3]']" style="width: 90%;">
	    							</c:when>
	    							<c:otherwise>
	    								<input class="easyui-textbox" id="payType" name="payType" value="${payType.payType}" labelWidth="100" label="支付类型编码"  data-options="prompt:'支付类型编码',required:true,validType:['remarks','checkNames','length[0,3]']" style="width: 90%;">
	    							</c:otherwise>
	    						</c:choose>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<c:choose>
	    							<c:when test="${payType.payName != null}">
	    								<input class="easyui-textbox" disabled="disabled" id="payName" name="payName" value="${payType.payName}" labelWidth="100" label="支付类型名称" data-options="prompt:'支付类型名称',required:true,validType:['remarks']"  style="width: 90%;">
	    							</c:when>
	    							<c:otherwise>
	    								<input class="easyui-textbox" id="payName" name="payName" value="${payType.payName}" labelWidth="100" label="支付类型名称" data-options="prompt:'支付类型名称',required:true,validType:['remarks','checkNames']"  style="width: 90%;">
	    							</c:otherwise>
	    						</c:choose>
	    					</td>
	    				</tr>
	    				<tr>
						    <td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
							<textarea class="easyui-textbox" name="remarks" maxlength="1200"
							          style="width: 95%; height: 80px;" labelWidth="100" label="备注"
							          data-options="validType:'length[1,200]',multiline:true,prompt:'备注',tipPosition:'bottom'">${payType.remarks}</textarea>
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
				var payChannelId = $("#payChannelId").combobox("getValue");
				if(payChannelId==null || payChannelId==''){
					$.messager.alert('提示', "请选择支付渠道", "error");
					return;
				}
				$("#btnSave").linkbutton('disable');
			
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/pay/payType/create':'${ctx}/pay/payType/update',
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
							});
						}
					},
					error: function(){
						$("#btnSave").linkbutton('enable');
					}
				});
			});
			
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				hideDialog();
			});

			$.extend($.fn.validatebox.defaults.rules, {
			    integer : {// 验证整数
		            validator : function(value) {
		                return /^[1-9]\d*$/i.test(value);
		            },
		            message : '无效的格式，请确认后输入！'
		        },
		        remarks : {// 验证备注
		        	validator : function(value) {
		        		 var canMatch=  /[@#\$%\^&\*]+/g.test(value);
		                 return !canMatch;
		            },
		            message : '这个不太友好，请检查后再输入吧。'		           
		        },
		        checkNames : {
		            validator : function(value) {
		                var haha = "";
		                $.ajax({
		                    type : 'post',
		                    async : false,
		                    url : '${ctx}/pay/payType/checkNames',
		                    data : {
		                        "payType" : value,
		                        "payName" : value
		                    },
		                    success : function(data) {
		                        haha = data;
		                    }
		                });
		               	haha = eval(haha);
		                return haha;
		            },
		            message : '此项已经被占用啦！'
		        }
			});
		});
	</script>
</body>
</html>