<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>PayInfo</title>
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
    						主键
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户订单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.orderId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						流水号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.serialNo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						交易金额,以分为单位
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.amount}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						00：银联网关；01：支付宝扫码；02：支付宝APP；03：微信扫码；04：微信APP；05：微信公众号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.payType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						01：经销商管理系统；02：APP；03：UBI保险
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.outSystemId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						01：PC端；02：APP；03：H5；04：公众号；05：小程序
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.deviceId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						回调url(不能带参数)
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.notifyUrl}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						00:成功；01:失败；02:未知错误请查询交易状态;03申请退款中
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.orderStatus}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						订单发送时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.orderSendTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						订单成交时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.doneTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						用户id
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.userId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.createBy}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.createDate}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.updateBy}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.updateDate}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						备注
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfo.remarks}
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
            <a id="btnCancel_PayInfo" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_PayInfo").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>