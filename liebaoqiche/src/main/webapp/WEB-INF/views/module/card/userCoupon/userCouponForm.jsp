<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>UserCoupon</title>
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
	    						<input class="easyui-textbox" maxlength="18" required="true" id="couponName" name="couponName" value="${userCoupon.couponName}" labelWidth="100" label="卡券名称"  data-options="prompt:'卡券名称'" style="width: 90%;">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-combobox" required="true" id="couponBuildId" name="couponBuildId" value="${userCoupon.couponBuildId}" labelWidth="100" label="卡券生成形式" style="width: 90%;"
							           data-options="
									        url:'${ctx}/card/couponBuild/couponTypes',
									        textField:'buildType',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券生成形式'">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-combobox" required="true" id="couponGetId" name="couponGetId" value="${userCoupon.couponGetId}" labelWidth="100" label="卡券领取形式" style="width: 90%;"
							           data-options="
									        url:'${ctx}/card/couponGet/couponGetTypes',
									        textField:'getType',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券领取形式'">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-combobox" required="true" id="couponUseId" name="couponUseId" value="${userCoupon.couponUseId}" labelWidth="100" label="卡券用途形式" style="width: 90%;"
							           data-options="
									        url:'${ctx}/card/conpouUse/couponUseTypes',
									        textField:'couponUseName',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券用途形式'">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-numberbox" maxlength="18" required="true" id="num" name="num" value="${userCoupon.num}" labelWidth="100" label="数量"  data-options="prompt:'数量'" style="width: 90%;">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-numberbox" maxlength="18" required="true" id="useNum" name="useNum" value="${userCoupon.useNum}" labelWidth="100" label="使用数量"  data-options="prompt:'使用数量'" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-numberbox" maxlength="18" required="true" id="serplusNum" name="serplusNum" value="${userCoupon.serplusNum}" labelWidth="100" label="剩余数量"  data-options="prompt:'剩余数量'" style="width: 90%;">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-numberbox" maxlength="18" required="true" id="usableNum" name="usableNum" value="${userCoupon.usableNum}" labelWidth="100" label="可用数量"  data-options="prompt:'可用数量'" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-numberbox" maxlength="18" required="true" id="overdueNum" name="overdueNum" value="${userCoupon.overdueNum}" labelWidth="100" label="过期数量"  data-options="prompt:'过期数量'" style="width: 90%;">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-textbox" maxlength="18" required="true" id="username" name="username" value="${userCoupon.username}" labelWidth="100" label="用户名称"  data-options="prompt:'用户名称'" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-combobox" required="true" id="signId" name="signId" value="${userCoupon.signId}" labelWidth="100" label="系统名称"  style="width: 90%;"
							           data-options="
									        url:'${ctx}/accesssystem/accessSystem/accessSystems',
									        textField:'accessSystemName',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'系统名称'">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-textbox" maxlength="18" required="true" id="creater" name="creater" value="${userCoupon.creater}" labelWidth="100" label="创建人"  data-options="prompt:'创建人'" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-datebox" editable="false" required="true" id="createTime" name="createTime" value="${userCoupon.createTime}" labelWidth="100" label="创建时间"  data-options="prompt:'创建时间'" style="width: 90%;">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-textbox" maxlength="18" required="true" id="modifier" name="modifier" value="${userCoupon.modifier}" labelWidth="100" label="修改人"  data-options="prompt:'修改人'" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-datebox" editable="false" required="true" id="modifyTime" name="modifyTime" value="${userCoupon.modifyTime}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
	    					</td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-textbox" maxlength="18" id="version" name="version" value="${userCoupon.version}" labelWidth="100" label="版本"  data-options="prompt:'版本'" style="width: 90%;">
						    </td>
	    				</tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="userId" name="userId" value="${userCoupon.userId}" labelWidth="100" label="用户编号"  data-options="prompt:'用户编号'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="systemSignName" name="systemSignName" value="${userCoupon.systemSignName}" labelWidth="100" label="系统名称"  data-options="prompt:'系统名称'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="id" name="id" value="${userCoupon.id}" labelWidth="100" label="主键UUID" required="true" data-options="prompt:'主键UUID'" style="width: 90%;">
						    </td>
					    </tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
	    													<textarea class="easyui-textbox" name="remarks" maxlength="200"
									style="width: 95%; height: 80px;" labelWidth="70" label="备注"
									data-options="validType:'length[1,300]',prompt:'备注'">${userCoupon.remarks}</textarea>
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
				var createTime = $("#createTime").val().replace(/\-/g, "\/");
				var modifyTime = $("#modifyTime").val().replace(/\-/g, "\/");
				if (modifyTime >= createTime) {
				$("#btnSave").linkbutton('disable');
			
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/card/userCoupon/create':'${ctx}/card/userCoupon/update',
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success: function(data){
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success");
							$("#btnSave").linkbutton('enable');
							hideDialog();
						}else{
							$.messager.alert('提示', json.rtnMsg, "error");
							$("#btnSave").linkbutton('enable');
						}
					},
					error: function(){
						$("#btnSave").linkbutton('enable');
					}
				});
				} else {
					$.messager.alert('提示', "修改时间不可小于创建时间", "error");
					$("#btnSave").linkbutton('enable');
				}
			});
			
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				hideDialog();
			});
		});
	</script>
</body>
</html>