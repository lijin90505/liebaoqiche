<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>PayRefundInfo</title>
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
    						${payRefundInfo.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						支付信息主表
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.payInfoId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						微信支付信息主表
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.wechatPayInfoId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						接入系统标识,01：经销商管理系统；02：APP；03：UBI保险
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.outSystemId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款渠道；01银联;02微信;03支付宝
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundChannel}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						用户唯一ID
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.userId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款流水号（成功才有）
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundNo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户订单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.outTradeNo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户退款单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.outRefundNo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						订单金额
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.totalFee}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款金额
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundFee}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款原因
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundDesc}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						回调URL
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.notifyUrl}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款状态；00成功，01失败;02退款关闭;03未知错误;04处理中
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundStatus}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款开始时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundStartTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款结束时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundEndTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款成功时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundSuccessTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款入账账户；1退回银行卡({银行名称}{卡类型}{卡尾号});2退回支付用户零钱(支付用户零钱);3退还商户(商户基本账户,商户结算银行账户);4退回支付用户零钱通(支付用户零钱通)针对微信
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundRecvAccout}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款资金来源;REFUND_SOURCE_RECHARGE_FUNDS可用余额退款/基本账户;REFUND_SOURCE_UNSETTLED_FUNDS 未结算资金退款(针对微信)
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundAccount}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						API接口;VENDOR_PLATFORM商户平台(针对微信)
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.refundRequestSource}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						备注
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.remarks}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.createBy}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.createDate}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.updateBy}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payRefundInfo.updateDate}
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
            <a id="btnCancel_PayRefundInfo" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_PayRefundInfo").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>