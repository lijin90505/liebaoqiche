<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>CouponPermissionAssignment</title>
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
    						${couponPermissionAssignment.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券生成编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.couponBuildId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券生成名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.couponBuildName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						coupon_get_id
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.couponGetId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券获取名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.couponGetName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券用途编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.couponUseId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券用途名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.couponUseName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						系统标识
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.systemSign}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						系统标识名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.systemSignName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						是否删除；0未删除，1删除
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.isDelete}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.creater}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.createTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.modifier}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.modifyTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						版本
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.version}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						备注
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponPermissionAssignment.remarks}
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
            <a id="btnCancel_CouponPermissionAssignment" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_CouponPermissionAssignment").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>