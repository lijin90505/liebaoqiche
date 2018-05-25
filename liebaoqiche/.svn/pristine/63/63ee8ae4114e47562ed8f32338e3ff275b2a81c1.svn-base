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
    		<table style="width: 100%;">
    			<tbody>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						主键UUID
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.couponName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券生成编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.couponBuildId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券领取编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.couponGetId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券使用编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.couponUseId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.num}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						使用数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.useNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						剩余数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.serplusNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						可用数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.usableNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						过期数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.overdueNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						用户编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.userId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						用户名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.username}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						系统标识
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.signId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						系统名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.systemSignName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.creater}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.createTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.modifier}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.modifyTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						版本
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.version}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						备注
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${userCoupon.remarks}
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
            <a id="btnCancel_UserCoupon" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_UserCoupon").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>