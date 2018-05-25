<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>Activity</title>
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
						<input class="easyui-textbox" id="activityDetailsName" name="activityDetailsName" value="${activity.activityDetailsName}" required="true" maxlength="200" labelWidth="100" label="活动名称"  data-options="prompt:'活动名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" id="integralId" name="integralId" value="${activity.integralId}" required="true" editable="false" maxlength="200" labelWidth="100" label="积分名称" style="width: 90%;"
						       data-options="
									        url:'${ctx}/integral/integral/integrals',
									        textField:'name',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'积分名称'">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" id="cardId" name="cardId" value="${activity.cardId}" required="true" maxlength="200" editable="false" labelWidth="100" label="卡券名称" style="width: 90%;"
						       data-options="
									        url:'${ctx}/card/card/cards',
									        textField:'name',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券名称'">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" id="experienceId" name="experienceId" value="${activity.experienceId}" maxlength="200" editable="false" required="true" labelWidth="100" label="经验值名称" style="width: 90%;"
						       data-options="
									        url:'${ctx}/experience/experience/experiences',
									        textField:'name',
									        valueField:'id',
									        width:120,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'经验值名称'">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" id="state" name="state" value="${activity.state}" required="true" labelWidth="100" editable="false" label="活动状态" style="width: 90%;"
						       data-options="
											        url:'${ctx}/enumData/lieBao/EnumsActivityStatus',
											        textField:'label',
											        panelHeight:'auto',
											        editable:false,
											        prompt:'活动状态'">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
	    													<textarea class="easyui-textbox" name="remarks" maxlength="200"
														              style="width: 95%; height: 80px;" labelWidth="70" label="备注"
														              data-options="validType:'length[1,300]',multiline:true,prompt:'备注'">${activity.remarks}</textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="createTime" name="createTime" value="${activity.createTime}" labelWidth="100" label="创建时间"  data-options="prompt:'创建时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="modifier" name="modifier" value="${activity.modifier}" labelWidth="100" label="修改人"  data-options="prompt:'修改人'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="modifyTime" name="modifyTime" value="${activity.modifyTime}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="version" name="version" value="${activity.version}" labelWidth="100" label="版本"  data-options="prompt:'版本'" style="width: 90%;">
					</td>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="id" name="id" value="${activity.id}" labelWidth="100" label="id" required="true" data-options="prompt:'id'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="activityDetailsId" name="activityDetailsId" value="${activity.activityDetailsId}" labelWidth="100" label="活动id" required="true" data-options="prompt:'活动id'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="isDelete" name="isDelete" value="${activity.isDelete}" labelWidth="100" label="是否删除；0未删除，1删除"  data-options="prompt:'是否删除；0未删除，1删除'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="creater" name="creater" value="${activity.creater}" labelWidth="100" label="创建人"  data-options="prompt:'创建人'" style="width: 90%;">
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

			$("#DataForm").form('submit',{
				url:$("#id").val() == ''?'${ctx}/activity/activity/create':'${ctx}/activity/activity/update',
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
	});
</script>
</body>
</html>