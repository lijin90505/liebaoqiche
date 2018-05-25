<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>WechatPayRefundRecon</title>
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
    						${wechatPayRefundRecon.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						对账渠道;00微信;01支付宝;02银联
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.reconChannel}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						对账单的日期，格式：20140603
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.billDate}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						账单类型;00支付成功;01退款
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.billType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						交易时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.tradeTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						公众账号ID
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.appId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.mchId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						子商户号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.subMchId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						设备号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.deviceInfo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						处理结果订单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.resultOrderNo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户订单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.orderId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						用户标识
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.userId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						交易类型
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.tradeType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						交易状态
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.tradeState}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						付款银行
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.bankType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						货币种类
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.feeType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						总金额
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.totalAmount}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						代金券或立减优惠金额
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.couponFee}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						处理退款订单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.resultRefundOrderNo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户退款订单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.refundOrderNo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						申请退款时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.applyRefundTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款成功时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.refundSuccessTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						处理结果退款单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.resultRefundNo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户申请退款单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.refundNo}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款金额
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.refundAmount}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款代金券或立减优惠金额
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.refundCouponFee}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款类型
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.refundType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						退款状态
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.refundState}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.merchantName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户数据包
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.merchantData}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						手续费
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.serviceCharge}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						费率
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.rate}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						对账状态;00成功；01失败
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.reconState}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						对账失败原因
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.failMessage}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建日期
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${wechatPayRefundRecon.createDate}
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
            <a id="btnCancel_WechatPayRefundRecon" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_WechatPayRefundRecon").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>