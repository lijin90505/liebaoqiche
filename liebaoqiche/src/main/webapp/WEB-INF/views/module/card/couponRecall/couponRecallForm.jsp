<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
	<title>CouponRecall</title>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp" %>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'">
		<form id="DataForm" method="post">
			<table style="width: 100%;">
				<tbody>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="id" name="id" value="${couponRecall.id}" labelWidth="100" label="id" required="true" data-options="prompt:'id'" style="width: 90%;">
						<input class="easyui-combobox" required="true" id="id" name="id" labelWidth="100" label="卡券名称" style="width: 90%;"
						       data-options="
									        url:'${ctx}/card/coupon/coupons',
									        textField:'couponName',
									        valueField:'id',
									        width:176,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券名称'">
					</td>
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="status" name="status" value="${couponRecall.status}" labelWidth="100" label="卡券发放状态" style="width: 90%;"
						       data-options="
								        url:'${ctx}/enumData/lieBao/EnumsCouponGrantStatus',
								        textField:'label',
								        width:160,
								        panelHeight:'auto',
								        editable:false,
								        prompt:'卡券发放状态'">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="recallUserId" name="recallUserId" labelWidth="100" label="用户名称" style="width: 90%;"
						       data-options="
									        url:'${ctx}/user/user/users',
									        textField:'realname',
									        valueField:'id',
									        width:176,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'用户名称'">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" maxlength="18" required="true" id="recallNum" name="recallNum" value="${couponRecall.recallNum}" labelWidth="100" label="数量" data-options="prompt:'数量'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="signId" name="signId" labelWidth="100" label="系统名称" style="width: 90%;"
						       data-options="
									        url:'${ctx}/accesssystem/accessSystem/accessSystems',
									        textField:'accessSystemName',
									        valueField:'id',
									        width:176,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'系统名称'">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" required="true" id="creater" name="creater" value="${couponRecall.creater}" labelWidth="100" label="创建人" data-options="prompt:'创建人'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" editable="false" required="true" id="createTime" name="createTime" value="${couponRecall.createTime}" labelWidth="100" label="创建时间" data-options="prompt:'创建时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" required="true" id="modifier" name="modifier" value="${couponRecall.modifier}" labelWidth="100" label="修改人" data-options="prompt:'修改人'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" editable="false" required="true" id="modifyTime" name="modifyTime" value="${couponRecall.modifyTime}" labelWidth="100" label="修改时间" data-options="prompt:'修改时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" id="version" name="version" value="${couponRecall.version}" labelWidth="100" label="版本" data-options="prompt:'版本'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
	    													<textarea class="easyui-textbox" name="remarks" maxlength="200"
														              style="width: 95%; height: 80px;" labelWidth="70" label="备注"
														              data-options="validType:'length[1,300]',prompt:'备注'">${couponRecall.remarks}</textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" maxlength="18" required="true" id="couponName" name="couponName" value="${couponRecall.couponName}" labelWidth="100" label="卡券名称" data-options="prompt:'卡券名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" maxlength="18" required="true" id="recallUsername" name="recallUsername" value="${couponRecall.recallUsername}" labelWidth="100" label="用户名称" data-options="prompt:'用户名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" maxlength="18" required="true" id="signName" name="signName" value="${couponRecall.signName}" labelWidth="100" label="系统名称" data-options="prompt:'系统名称'" style="width: 90%;">
					</td>
				</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
		<a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;">
			<i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存
		</a>
		<a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;">
			<i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消
		</a>
	</div>
</div>

<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
<script type="text/javascript">
	require(['jquery', 'common'], function ($) {
		// 给保存按钮添加点击事件
		$("#btnSave").on('click', function () {
			var createTime = $("#createTime").val().replace(/\-/g, "\/");
			var modifyTime = $("#modifyTime").val().replace(/\-/g, "\/");
			if (modifyTime >= createTime) {
				$("#btnSave").linkbutton('disable');

				$("#DataForm").form('submit', {
					url: $("#id").val() == '' ? '${ctx}/card/couponRecall/create' : '${ctx}/card/couponRecall/update',
					onSubmit: function () {
						return $(this).form('enableValidation').form('validate');
					},
					success: function (data) {
						var json = $.parseJSON(data);
						if (json && json.rtnCode == '00000000') {
							$.messager.alert('提示', "保存成功", "success");
							$("#btnSave").linkbutton('enable');
							hideDialog();
						} else {
							$.messager.alert('提示', json.rtnMsg, "error");
							$("#btnSave").linkbutton('enable');
						}
					},
					error: function () {
						$("#btnSave").linkbutton('enable');
					}
				});
			} else {
				$.messager.alert('提示', "修改时间不可小于创建时间", "error");
				$("#btnSave").linkbutton('enable');
			}
		});

		// 给保存按钮添加点击事件
		$("#btnCancel").on('click', function () {
			hideDialog();
		});
	});
</script>
</body>
</html>