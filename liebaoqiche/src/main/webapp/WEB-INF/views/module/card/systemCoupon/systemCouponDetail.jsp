<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SystemCoupon</title>
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
    						${systemCoupon.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						是否删除；0未删除，1删除
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.isDelete}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.couponId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						接入系统标识
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.accessSystemId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						接入系统名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.accessSystemName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券使用记录编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.couponUsedRecordId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.couponName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券内容
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.couponContent}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券开始时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.startTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券截止时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.endTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券识别码
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.couponCheckCode}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券状态
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.couponStatus}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券编辑状态
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.editStatus}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券预发数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.conponNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券领取数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.getCouponNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券使用数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.couponUsedNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券最大领取数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.maxGetConpouNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券剩余数量
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.conpouSurplusNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						是否需要预约
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.isAppointments}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						最低消费金额
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.mininumConsumption}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						是否单次限用
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.singleUseRefund}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						卡券url
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.couponUrl}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						图片url
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.pictureUrl}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						系统标识编号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.systemSign}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						系统名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.systemSignName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.creater}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.createTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.modifier}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.modifyTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						版本
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.version}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						备注
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${systemCoupon.remarks}
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
            <a id="btnCancel_SystemCoupon" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_SystemCoupon").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>