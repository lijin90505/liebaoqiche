<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>OutSystemOrder</title>
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
	    						<input class="easyui-textbox" id="id" name="id" value="${outSystemOrder.id}" labelWidth="100" label="主键" required="true" data-options="prompt:'主键'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="orderId" name="orderId" value="${outSystemOrder.orderId}" labelWidth="100" label="订单号"  data-options="prompt:'订单号'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="payType" name="payType" value="${outSystemOrder.payType}" labelWidth="100" label="支付类型"  data-options="prompt:'支付类型'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="outSystemId" name="outSystemId" value="${outSystemOrder.outSystemId}" labelWidth="100" label="接入系统标识"  data-options="prompt:'接入系统标识'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="deviceId" name="deviceId" value="${outSystemOrder.deviceId}" labelWidth="100" label="接入设备"  data-options="prompt:'接入设备'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="orderStatus" name="orderStatus" value="${outSystemOrder.orderStatus}" labelWidth="100" label="订单状态"  data-options="prompt:'订单状态'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="amount" name="amount" value="${outSystemOrder.amount}" labelWidth="100" label="订单金额"  data-options="prompt:'订单金额'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="orderPayTime" name="orderPayTime" value="${outSystemOrder.orderPayTime}" labelWidth="100" label="订单支付时间"  data-options="prompt:'订单支付时间'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="userid" name="userid" value="${outSystemOrder.userid}" labelWidth="100" label="用户标识"  data-options="prompt:'用户标识'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="createBy" name="createBy" value="${outSystemOrder.createBy}" labelWidth="100" label="创建人"  data-options="prompt:'创建人'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-datebox" id="createDate" name="createDate" value="${outSystemOrder.createDate}" labelWidth="100" label="创建时间"  data-options="prompt:'创建时间'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="updateBy" name="updateBy" value="${outSystemOrder.updateBy}" labelWidth="100" label="修改人"  data-options="prompt:'修改人'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-datebox" id="updateDate" name="updateDate" value="${outSystemOrder.updateDate}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="remarks" name="remarks" value="${outSystemOrder.remarks}" labelWidth="100" label="备注"  data-options="prompt:'备注'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<label class="label-top">备注:</label>
	    						<input class="easyui-textbox" name="remarks" style="width:99.5%; height:80px;" data-options="multiline:true">
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
				
				$("#btnSave").linkbutton('disable');
			
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/pay/outSystemOrder/create':'${ctx}/pay/outSystemOrder/update',
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success: function(data){
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success");
							$("#btnSave").linkbutton('enable');
						}else{
							$.messager.alert('提示', json.rtnMsg, "error");
							$("#btnSave").linkbutton('enable');
						}
					},
					error: function(){
						$("#btnSave").linkbutton('enable');
					}
				});
			});
			
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>