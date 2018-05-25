<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>UserCouponUsedRecord</title>
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
	    						<input class="easyui-textbox" disabled='disabled' id="userName" name="userName" value="${userCouponUsedRecord.userName}" labelWidth="100" label="用户名称"  data-options="prompt:'用户名称'" style="width: 90%;">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-textbox" disabled='disabled' id="couponName" name="couponName" value="${userCouponUsedRecord.couponName}" labelWidth="100" label="卡券名称"  data-options="prompt:'卡券名称'" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" disabled='disabled' id="couponContent" name="couponContent" value="${userCouponUsedRecord.couponContent}" labelWidth="100" label="卡券内容"  data-options="prompt:'卡券内容'" style="width: 90%;">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-textbox" disabled='disabled' id="status" name="status" value="${userCouponUsedRecord.status}" labelWidth="100" label="卡券状态"  data-options="prompt:'卡券状态'" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-datebox" editable="false" disabled='disabled' id="couponGetTime" name="couponGetTime" value="${userCouponUsedRecord.couponGetTime}" labelWidth="100" label="卡券获取时间"  data-options="prompt:'卡券获取时间'" style="width: 90%;">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-datebox" disabled='disabled' id="couponUsedTime" name="couponUsedTime" value="${userCouponUsedRecord.couponUsedTime}" labelWidth="100" label="卡券使用时间"  data-options="prompt:'卡券使用时间'" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-datebox" editable="false" disabled='disabled' id="erminalDesc" name="erminalDesc" value="${userCouponUsedRecord.erminalDesc}" labelWidth="100" label="终端平台"  data-options="prompt:'终端平台'" style="width: 90%;">
						    </td>>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-textbox" disabled='disabled' id="systemSignName" name="systemSignName" value="${userCouponUsedRecord.systemSignName}" labelWidth="100" label="系统名称"  data-options="prompt:'系统名称'" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" disabled='disabled' id="creater" name="creater" value="${userCouponUsedRecord.creater}" labelWidth="100" label="创建人"  data-options="prompt:'创建人'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-datebox" disabled='disabled' id="createTime" name="createTime" value="${userCouponUsedRecord.createTime}" labelWidth="100" label="创建时间"  data-options="prompt:'创建时间'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" disabled='disabled' id="modifier" name="modifier" value="${userCouponUsedRecord.modifier}" labelWidth="100" label="修改人"  data-options="prompt:'修改人'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-datebox" disabled='disabled' id="modifyTime" name="modifyTime" value="${userCouponUsedRecord.modifyTime}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" maxlength="18" disabled='disabled' id="version" name="version" value="${userCouponUsedRecord.version}" labelWidth="100" label="版本"  data-options="prompt:'版本'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
	    													<textarea class="easyui-textbox" disabled='disabled' name="remarks"
									style="width: 95%; height: 80px;" labelWidth="70" label="备注"
									data-options="validType:'length[1,300]',prompt:'备注'">${userCouponUsedRecord.remarks}</textarea>
	    					</td>
	    				</tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="id" name="id" value="${userCouponUsedRecord.id}" labelWidth="100" label="id" required="true" data-options="prompt:'id'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="couponCode" name="couponCode" value="${userCouponUsedRecord.couponCode}" labelWidth="100" label="coupon_code"  data-options="prompt:'coupon_code'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="userId" name="userId" value="${userCouponUsedRecord.userId}" labelWidth="100" label="user_id"  data-options="prompt:'user_id'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="erminalId" name="erminalId" value="${userCouponUsedRecord.erminalId}" labelWidth="100" label="erminal_id"  data-options="prompt:'erminal_id'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="systemSign" name="systemSign" value="${userCouponUsedRecord.systemSign}" labelWidth="100" label="system_sign"  data-options="prompt:'system_sign'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="couponGetId" name="couponGetId" value="${userCouponUsedRecord.couponGetId}" labelWidth="100" label="coupon_get_id"  data-options="prompt:'coupon_get_id'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="couponUseId" name="couponUseId" value="${userCouponUsedRecord.couponUseId}" labelWidth="100" label="coupon_use_id"  data-options="prompt:'coupon_use_id'" style="width: 90%;">
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
					url:$("#id").val() == ''?'${ctx}/card/userCouponUsedRecord/create':'${ctx}/card/userCouponUsedRecord/update',
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