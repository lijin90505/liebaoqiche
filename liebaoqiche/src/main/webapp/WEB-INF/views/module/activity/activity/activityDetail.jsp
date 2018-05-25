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
		<table style="width: 100%;">
			<tbody>
			<tr>
				<td style="width: 50%; padding: 5px;">
					id
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.id}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					活动id
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.activityDetailsId}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					活动名称
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.activityDetailsName}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					积分id
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.integralId}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					积分名称
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.integralName}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					卡券id
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.cardId}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					卡券名称
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.cardName}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					经验值id
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.experienceId}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					经验值名称
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.experienceName}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					是否删除；0未删除，1删除
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.isDelete}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					状态；0可用，1不可用
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.state}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					创建人
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.creater}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					创建时间
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.createTime}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					修改人
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.modifier}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					修改时间
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.modifyTime}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					版本
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.version}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					备注
				</td>
				<td style="width: 50%; padding: 5px;">
					${activity.remarks}
				</td>
			</tr>
			<tr>
				<td style="width: 50%; padding: 5px;">
					<label class="label-top">备注:</label>
					<input class="easyui-textbox" name="remarks" style="width:99.5%; height:80px;" data-options="multiline:true">
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
		<a id="btnCancel_Activity" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
	</div>
</div>

<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
<script type="text/javascript">
	require(['jquery','common'], function($){
		// 给保存按钮添加点击事件
		$("#btnCancel_Activity").on('click', function(){
			history.go(-1);
		});
	});
</script>
</body>
</html>