<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>Coupon</title>
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
    						${coupon.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						是否删除；0未删除，1删除
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.isDelete}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.couponName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券内容
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.couponContent}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券形式
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.couponType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券生成编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.couponBuildId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						生成券名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.couponBuildName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						领取券名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.couponGetName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						领取券编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.couponGetId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券用途编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.conpouUseId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券用途名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.couponUseName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.creater}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.createTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.modifier}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.modifyTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						version
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.version}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						remarks
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${coupon.remarks}
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
            <a id="btnCancel_Coupon" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_Coupon").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>