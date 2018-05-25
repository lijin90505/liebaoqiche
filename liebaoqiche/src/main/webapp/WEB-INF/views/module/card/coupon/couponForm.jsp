<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
	<title>Coupon</title>
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
						<input class="" hidden="true" id="id" name="id" value="${coupon.id}" labelWidth="100" label="id" required="true" data-options="prompt:'id'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="isDelete" name="isDelete" value="${coupon.isDelete}" labelWidth="100" label="是否删除；0未删除，1删除" data-options="prompt:'是否删除；0未删除，1删除'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" required="true" id="couponName" name="couponName" value="${coupon.couponName}" labelWidth="100" label="卡券名称" data-options="prompt:'卡券名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" required="true" id="couponContent" name="couponContent" value="${coupon.couponContent}" labelWidth="100" label="卡券内容" data-options="prompt:'卡券内容'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="couponBuildId" name="couponBuildId" value="${coupon.couponBuildId}" labelWidth="100" label="卡券生成形式" style="width: 90%;"
						       data-options="
									        url:'${ctx}/card/couponBuild/couponTypes',
									        textField:'buildType',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券生成形式'">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="couponGetId" name="couponGetId" value="${coupon.couponGetId}" labelWidth="100" label="卡券领取形式" style="width: 90%;"
						       data-options="
									        url:'${ctx}/card/couponGet/couponGetTypes',
									        textField:'getType',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券领取形式'">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="conpouUseId" name="conpouUseId" value="${coupon.conpouUseId}" labelWidth="100" label="卡券用途形式" style="width: 90%;"
						       data-options="
									        url:'${ctx}/card/conpouUse/couponUseTypes',
									        textField:'couponUseName',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券用途形式'">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" required="true" id="creater" name="creater" value="${coupon.creater}" labelWidth="100" label="创建人" data-options="prompt:'创建人'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" editable="false" required="true" id="createTime" name="createTime" value="${coupon.createTime}" labelWidth="100" label="创建时间" data-options="prompt:'创建时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" required="true" id="modifier" name="modifier" value="${coupon.modifier}" labelWidth="100" label="修改人" data-options="prompt:'修改人'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" editable="false" required="true" id="modifyTime" name="modifyTime" value="${coupon.modifyTime}" labelWidth="100" label="修改时间" data-options="prompt:'修改时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" id="version" name="version" value="${coupon.version}" labelWidth="100" label="版本" data-options="prompt:'版本'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="couponBuildName" name="couponBuildName" value="${coupon.couponBuildName}" labelWidth="100" label="生成券名称" data-options="prompt:'生成券名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="couponGetName" name="couponGetName" value="${coupon.couponGetName}" labelWidth="100" label="领取券名称" data-options="prompt:'领取券名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="couponUseName" name="couponUseName" value="${coupon.couponUseName}" labelWidth="100" label="卡券用途名称" data-options="prompt:'卡券用途名称'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
	    													<textarea class="easyui-textbox" name="remarks" maxlength="200"
														              style="width: 95%; height: 80px;" labelWidth="70" label="备注"
														              data-options="validType:'length[1,300]',prompt:'备注'">${coupon.remarks}</textarea>
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
					url: $("#id").val() == '' ? '${ctx}/card/coupon/create' : '${ctx}/card/coupon/update',
					onSubmit: function () {
						return $(this).form('enableValidation').form('validate');
					},
					success: function (data) {
						var json = $.parseJSON(data);
						hideDialog();
						if (json && json.rtnCode == '00000000') {
							$.messager.alert('提示', "保存成功", "success");
							$("#btnSave").linkbutton('enable');
						} else {
							$.messager.alert('提示', json.rtnMsg, "error");
							$("#btnSave").linkbutton('enable');
						}
						hideDialog();
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