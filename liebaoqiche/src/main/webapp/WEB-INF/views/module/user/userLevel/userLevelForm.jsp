<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>UserLevel</title>
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
						<input class="easyui-textbox" id="level" maxlength="100" name="level" value="${userLevel.level}" labelWidth="100" label="认证等级" required="true"
						       data-options="prompt:'认证等级',
							       validType:['length[1,30]','special','checkLevel']" style="width: 90%">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" id="levelName" maxlength="100" name="levelName" value="${userLevel.levelName}" labelWidth="100" label="认证等级名称" required="true"
						       data-options="prompt:'认证等级名称',
							       validType:['length[1,30]','special','checkLevelName']" style="width: 90%">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
						<textarea class="easyui-textbox" name="remarks" MAXLENGTH="200"
						          style="width: 95%; height: 80px;" labelWidth="100" label="备注"
						          data-options="validType:'length[1,200]',multiline:true,prompt:'备注',tipPosition:'bottom'">${user.remarks}</textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="id" name="id" value="${userLevel.id}" labelWidth="100" label="主键，UUID" required="true" data-options="prompt:'主键，UUID'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="outSystemName" name="outSystemName" value="${userLevel.outSystemName}" labelWidth="100" label="接入系统名称"  data-options="prompt:'接入系统名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="createTime" name="createTime" value="${userLevel.createTime}" labelWidth="100" label="创建时间" required="true" data-options="prompt:'创建时间'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="modifyTime" name="modifyTime" value="${userLevel.modifyTime}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="createUserId" name="createUserId" value="${userLevel.createUserId}" labelWidth="100" label="创建人ID"  data-options="prompt:'创建人ID'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="createUserName" name="createUserName" value="${userLevel.createUserName}" labelWidth="100" label="创建人名称"  data-options="prompt:'创建人名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="modifyUserId" name="modifyUserId" value="${userLevel.modifyUserId}" labelWidth="100" label="修改人ID"  data-options="prompt:'修改人ID'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="modifyUserName" name="modifyUserName" value="${userLevel.modifyUserName}" labelWidth="100" label="修改人名称"  data-options="prompt:'修改人名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="isDelete" name="isDelete" value="${userLevel.isDelete}" labelWidth="100" label="删除标识（0 未删除 1 已删除 2 删除审核）"  data-options="prompt:'删除标识（0 未删除 1 已删除 2 删除审核）'" style="width: 90%;">
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
				url:$("#id").val() == ''?'${ctx}/user/userLevel/create':'${ctx}/user/userLevel/update',
				onSubmit:function(){
					var flag = $(this).form('enableValidation').form('validate');
					if(flag){
						showMaskLayer();
					}
					return flag;
				},
				success: function(data){
					hideMaskLayer();
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

		//验证认证等级是否存在
		$.extend($.fn.textbox.defaults.rules, {
			checkLevel : {
				validator : function(value) {

					var url = '${ctx}/user/userLevel/checkLevel?level='+encodeURI(encodeURI(value));
					var ret = $.ajax({url:url,async:false,cache:false,type:"post"}).responseText;
					return ret=='true';
				},
				message : '该认证等级已存在'
			}
		});

		//验证认证等级名称是否存在
		$.extend($.fn.textbox.defaults.rules, {
			checkLevelName : {
				validator : function(value) {

					var url = '${ctx}/user/userLevel/checkLevelName?levelName='+encodeURI(encodeURI(value));
					var ret = $.ajax({url:url,async:false,cache:false,type:"post"}).responseText;
					return ret=='true';
				},
				message : '该认证等级名称已存在'
			}
		});
	});
</script>
</body>
</html>