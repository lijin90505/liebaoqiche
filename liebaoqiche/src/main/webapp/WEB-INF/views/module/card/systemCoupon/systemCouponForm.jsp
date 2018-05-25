<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
	<title>SystemCoupon</title>
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
						<input class="easyui-combobox" required="true" id="accessSystemId" name="accessSystemId" value="${systemCoupon.accessSystemId}" labelWidth="100" label="系统名称" style="width: 90%;"
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
						<input class="easyui-textbox" maxlength="18" required="true" id="couponName" name="couponName" value="${systemCoupon.couponName}" labelWidth="100" label="卡券名称" data-options="prompt:'卡券名称'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" required="true" id="couponContent" name="couponContent" value="${systemCoupon.couponContent}" labelWidth="100" label="卡券内容" data-options="prompt:'卡券内容'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" required="true" id="startTime" name="startTime" value="${systemCoupon.startTime}" labelWidth="100" label="卡券开始时间" data-options="prompt:'卡券开始时间'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" required="true" id="endTime" name="endTime" value="${systemCoupon.endTime}" labelWidth="100" label="卡券截止时间" data-options="prompt:'卡券截止时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="couponStatus" name="couponStatus" value="${systemCoupon.couponStatus}" labelWidth="100" label="卡券开启状态" style="width: 90%;"
						       data-options="
									        url:'${ctx}/enumData/lieBao/EnumsCouponOpenStatus',
									        textField:'label',
									        width:176,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券状态'">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="editStatus" name="editStatus" value="${systemCoupon.editStatus}" labelWidth="100" label="卡券修改状态" style="width: 90%;"
						       data-options="
									        url:'${ctx}/enumData/lieBao/EnumsCouponEditStatus',
									        textField:'label',
									        width:176,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券编辑状态'">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" maxlength="18" required="true" id="conponNum" name="conponNum" value="${systemCoupon.conponNum}" labelWidth="100" label="卡券预发数量" data-options="prompt:'卡券预发数量'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" maxlength="18" required="true" id="getCouponNum" name="getCouponNum" value="${systemCoupon.getCouponNum}" labelWidth="100" label="卡券领取数量" data-options="prompt:'卡券领取数量'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" maxlength="18" required="true" id="couponUsedNum" name="couponUsedNum" value="${systemCoupon.couponUsedNum}" labelWidth="100" label="卡券使用数量" data-options="prompt:'卡券使用数量'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" maxlength="18" required="true" id="maxGetConpouNum" name="maxGetConpouNum" value="${systemCoupon.maxGetConpouNum}" labelWidth="100" label="卡券最大领取数量" data-options="prompt:'卡券最大领取数量'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" maxlength="18" required="true" id="conpouSurplusNum" name="conpouSurplusNum" value="${systemCoupon.conpouSurplusNum}" labelWidth="100" label="卡券剩余数量" data-options="prompt:'卡券剩余数量'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="isAppointments" name="isAppointments" value="${systemCoupon.isAppointments}" labelWidth="100" label="是否需要预约" style="width: 90%;"
						       data-options="
								        url:'${ctx}/enumData/lieBao/EnumsCouponIsAppointments',
								        textField:'label',
								        width:160,
								        panelHeight:'auto',
								        editable:false,
								        prompt:'是否需要预约'">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" required="true" id="mininumConsumption" name="mininumConsumption" value="${systemCoupon.mininumConsumption}" labelWidth="100" label="最低消费金额" data-options="prompt:'最低消费金额'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="singleUseRefund" name="singleUseRefund" value="${systemCoupon.singleUseRefund}" labelWidth="100" label="是否单次限用" style="width: 90%;"
						       data-options="
								        url:'${ctx}/enumData/lieBao/EnumsCouponIsSingleUse',
								        textField:'label',
								        width:160,
								        panelHeight:'auto',
								        editable:false,
								        prompt:'是否单次限用'">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="255" required="true" id="couponUrl" name="couponUrl" value="${systemCoupon.couponUrl}" labelWidth="100" label="卡券url" data-options="prompt:'卡券url'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="255" required="true" id="pictureUrl" name="pictureUrl" value="${systemCoupon.pictureUrl}" labelWidth="100" label="图片url" data-options="prompt:'图片url'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" required="true" id="creater" name="creater" value="${systemCoupon.creater}" labelWidth="100" label="创建人" data-options="prompt:'创建人'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" editable="false" required="true" id="createTime" name="createTime" value="${systemCoupon.createTime}" labelWidth="100" label="创建时间" data-options="prompt:'创建时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" required="true" id="modifier" name="modifier" value="${systemCoupon.modifier}" labelWidth="100" label="修改人" data-options="prompt:'修改人'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" editable="false" required="true" id="modifyTime" name="modifyTime" value="${systemCoupon.modifyTime}" labelWidth="100" label="修改时间" data-options="prompt:'修改时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" maxlength="18" id="version" name="version" value="${systemCoupon.version}" labelWidth="100" label="版本" data-options="prompt:'版本'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
	    													<textarea class="easyui-textbox" name="remarks" maxlength="200"
														              style="width: 95%; height: 80px;" labelWidth="70" label="备注"
														              data-options="validType:'length[1,300]',prompt:'备注'">${systemCoupon.remarks}</textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="id" name="id" value="${systemCoupon.id}" labelWidth="100" label="id" required="true" data-options="prompt:'id'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="isDelete" name="isDelete" value="${systemCoupon.isDelete}" labelWidth="100" label="是否删除；0未删除，1删除" data-options="prompt:'是否删除；0未删除，1删除'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="couponId" name="couponId" value="${systemCoupon.couponId}" labelWidth="100" label="卡券编号" data-options="prompt:'卡券编号'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="accessSystemName" name="accessSystemName" value="${systemCoupon.accessSystemName}" labelWidth="100" label="接入系统名称" data-options="prompt:'接入系统名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="couponUsedRecordId" name="couponUsedRecordId" value="${systemCoupon.couponUsedRecordId}" labelWidth="100" label="卡券使用记录编号" data-options="prompt:'卡券使用记录编号'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="couponCheckCode" name="couponCheckCode" value="${systemCoupon.couponCheckCode}" labelWidth="100" label="卡券识别码" data-options="prompt:'卡券识别码'" style="width: 90%;">
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
					url: $("#id").val() == '' ? '${ctx}/card/systemCoupon/create' : '${ctx}/card/systemCoupon/update',
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