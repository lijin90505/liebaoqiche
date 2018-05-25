<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>ActivityPermissionAssignment</title>
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
    						${activityPermissionAssignment.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						活动编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.activityId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						活动内容
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.activityName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						活动开始时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.activityStartTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						活动截止时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.activityEndTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						系统标识
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.systemSign}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						系统名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.systemSignName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						是否删除；0未删除，1删除
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.isDelete}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.creater}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.createTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.modifier}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.modifyTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						版本
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.version}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						备注
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${activityPermissionAssignment.remarks}
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
            <a id="btnCancel_ActivityPermissionAssignment" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_ActivityPermissionAssignment").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>