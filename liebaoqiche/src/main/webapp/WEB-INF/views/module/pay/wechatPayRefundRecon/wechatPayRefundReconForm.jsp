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
	    	<form id="DataForm" method="post">
	    		<table style="width: 100%;">
	    			<tbody>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="id" name="id" value="${wechatPayRefundRecon.id}" labelWidth="100" label="主键" required="true" data-options="prompt:'主键'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="reconChannel" name="reconChannel" value="${wechatPayRefundRecon.reconChannel}" labelWidth="100" label="对账渠道;00微信;01支付宝;02银联"  data-options="prompt:'对账渠道;00微信;01支付宝;02银联'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="billDate" name="billDate" value="${wechatPayRefundRecon.billDate}" labelWidth="100" label="对账单的日期，格式：20140603"  data-options="prompt:'对账单的日期，格式：20140603'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="billType" name="billType" value="${wechatPayRefundRecon.billType}" labelWidth="100" label="账单类型;00支付成功;01退款"  data-options="prompt:'账单类型;00支付成功;01退款'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="tradeTime" name="tradeTime" value="${wechatPayRefundRecon.tradeTime}" labelWidth="100" label="交易时间"  data-options="prompt:'交易时间'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="appId" name="appId" value="${wechatPayRefundRecon.appId}" labelWidth="100" label="公众账号ID"  data-options="prompt:'公众账号ID'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="mchId" name="mchId" value="${wechatPayRefundRecon.mchId}" labelWidth="100" label="商户号"  data-options="prompt:'商户号'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="subMchId" name="subMchId" value="${wechatPayRefundRecon.subMchId}" labelWidth="100" label="子商户号"  data-options="prompt:'子商户号'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="deviceInfo" name="deviceInfo" value="${wechatPayRefundRecon.deviceInfo}" labelWidth="100" label="设备号"  data-options="prompt:'设备号'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="resultOrderNo" name="resultOrderNo" value="${wechatPayRefundRecon.resultOrderNo}" labelWidth="100" label="处理结果订单号"  data-options="prompt:'处理结果订单号'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="orderId" name="orderId" value="${wechatPayRefundRecon.orderId}" labelWidth="100" label="商户订单号"  data-options="prompt:'商户订单号'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="userId" name="userId" value="${wechatPayRefundRecon.userId}" labelWidth="100" label="用户标识"  data-options="prompt:'用户标识'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="tradeType" name="tradeType" value="${wechatPayRefundRecon.tradeType}" labelWidth="100" label="交易类型"  data-options="prompt:'交易类型'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="tradeState" name="tradeState" value="${wechatPayRefundRecon.tradeState}" labelWidth="100" label="交易状态"  data-options="prompt:'交易状态'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="bankType" name="bankType" value="${wechatPayRefundRecon.bankType}" labelWidth="100" label="付款银行"  data-options="prompt:'付款银行'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="feeType" name="feeType" value="${wechatPayRefundRecon.feeType}" labelWidth="100" label="货币种类"  data-options="prompt:'货币种类'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="totalAmount" name="totalAmount" value="${wechatPayRefundRecon.totalAmount}" labelWidth="100" label="总金额"  data-options="prompt:'总金额'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="couponFee" name="couponFee" value="${wechatPayRefundRecon.couponFee}" labelWidth="100" label="代金券或立减优惠金额"  data-options="prompt:'代金券或立减优惠金额'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="resultRefundOrderNo" name="resultRefundOrderNo" value="${wechatPayRefundRecon.resultRefundOrderNo}" labelWidth="100" label="处理退款订单号"  data-options="prompt:'处理退款订单号'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="refundOrderNo" name="refundOrderNo" value="${wechatPayRefundRecon.refundOrderNo}" labelWidth="100" label="商户退款订单号"  data-options="prompt:'商户退款订单号'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="applyRefundTime" name="applyRefundTime" value="${wechatPayRefundRecon.applyRefundTime}" labelWidth="100" label="申请退款时间"  data-options="prompt:'申请退款时间'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="refundSuccessTime" name="refundSuccessTime" value="${wechatPayRefundRecon.refundSuccessTime}" labelWidth="100" label="退款成功时间"  data-options="prompt:'退款成功时间'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="resultRefundNo" name="resultRefundNo" value="${wechatPayRefundRecon.resultRefundNo}" labelWidth="100" label="处理结果退款单号"  data-options="prompt:'处理结果退款单号'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="refundNo" name="refundNo" value="${wechatPayRefundRecon.refundNo}" labelWidth="100" label="商户申请退款单号"  data-options="prompt:'商户申请退款单号'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="refundAmount" name="refundAmount" value="${wechatPayRefundRecon.refundAmount}" labelWidth="100" label="退款金额"  data-options="prompt:'退款金额'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="refundCouponFee" name="refundCouponFee" value="${wechatPayRefundRecon.refundCouponFee}" labelWidth="100" label="退款代金券或立减优惠金额"  data-options="prompt:'退款代金券或立减优惠金额'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="refundType" name="refundType" value="${wechatPayRefundRecon.refundType}" labelWidth="100" label="退款类型"  data-options="prompt:'退款类型'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="refundState" name="refundState" value="${wechatPayRefundRecon.refundState}" labelWidth="100" label="退款状态"  data-options="prompt:'退款状态'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="merchantName" name="merchantName" value="${wechatPayRefundRecon.merchantName}" labelWidth="100" label="商户名称"  data-options="prompt:'商户名称'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="merchantData" name="merchantData" value="${wechatPayRefundRecon.merchantData}" labelWidth="100" label="商户数据包"  data-options="prompt:'商户数据包'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="serviceCharge" name="serviceCharge" value="${wechatPayRefundRecon.serviceCharge}" labelWidth="100" label="手续费"  data-options="prompt:'手续费'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="rate" name="rate" value="${wechatPayRefundRecon.rate}" labelWidth="100" label="费率"  data-options="prompt:'费率'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="reconState" name="reconState" value="${wechatPayRefundRecon.reconState}" labelWidth="100" label="对账状态;00成功；01失败"  data-options="prompt:'对账状态;00成功；01失败'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="failMessage" name="failMessage" value="${wechatPayRefundRecon.failMessage}" labelWidth="100" label="对账失败原因"  data-options="prompt:'对账失败原因'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-datebox" id="createDate" name="createDate" value="${wechatPayRefundRecon.createDate}" labelWidth="100" label="创建日期" required="true" data-options="prompt:'创建日期'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;" colspan="2">
	    						<label class="label-top">备注:</label>
	    						<input class="easyui-textbox" name="remarks" style="width:99.5%; height:80px;" data-options="multiline:true">
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
				
				$("#btnSave").linkbutton('disable');
			
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/pay/wechatPayRefundRecon/create':'${ctx}/pay/wechatPayRefundRecon/update',
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success: function(data){
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success");
							$("#btnSave").linkbutton('enable');
						}else{
							$.messager.alert('提示', json.rtnMsg, "error");
							$("#btnSave").linkbutton('enable');
						}
					},
					error: function(){
						$("#btnSave").linkbutton('enable');
					}
				});
			});
			
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>