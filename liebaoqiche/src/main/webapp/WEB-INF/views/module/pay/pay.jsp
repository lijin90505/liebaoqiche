<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>终端支付管理</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxResources}/css/pay.css" rel="stylesheet"/>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center'">
			<div class="page-title"><b></b><span>付款方式</span></div>
			<div class="pay-choose">
				<div class="pay-content">
					<label for="pay01"></label>
					<input id="pay01" type="radio" name="payMethod" value="1" />
				</div>
				<div class="pay-content">
					<label for="pay02"></label>
					<input id="pay02" type="radio" name="payMethod" value="2" />
				</div>
				<div class="pay-content">
					<label for="pay03"></label>
					<input id="pay03" type="radio" name="payMethod" value="3"  />
				</div>
			</div>
			<p class="pay-money">测试订单号：20180315235959000001</p>
			<p class="pay-money">应付金额：<b>0.1</b> 元</p>
			<button id="wechatPay" class="pay-button">微信扫码支付</button>
			<a href="${ctx}/pay/pay/sendUnionGatePay" target="view_window"><button id="unionGatePay"  class="pay-button">银联网关支付</button></a>
			<a href="${ctx}/pay/pay/sendAliScanPay" target="view_window"><button id="aliScanPay" class="pay-button">支付宝扫码支付</button></a>
			<button id="sendAliF2FPay" class="pay-button">支付宝面对面扫码支付</button>
			<button id="aliBarCodePay" class="pay-button">支付宝条码扫码支付</button>
			<a href="${ctx}/pay/pay/sendAliWapPay" target="view_window"><button id="aliScanPay" class="pay-button">支付宝手机Wap支付</button></a>
		</div>
	</div>
	<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			$(".pay-content").click(function(){
				$(this).addClass('active').siblings().removeClass('active');
			})
			
 			$("#wechatPay").click(function(){
 			    window.location.href="${ctx}/pay/pay/sendWechatScanPay";
 		    })
			
// 			$("#aliF2FPay").click(function(){
// 			    window.location.href="${ctx}/pay/pay/aliF2FPay";
// 		    })
// 			$("#aliPay").click(function(){
// 			    window.location.href="${ctx}/pay/pay/alismpay";
// 		    })
			$("#sendAliF2FPay").click(function(){
				    window.location.href="${ctx}/pay/pay/sendAliF2FScanPay";
			    })
			$("#aliBarCodePay").click(function(){
			    window.location.href="${ctx}/pay/pay/aliBarCodePay";
		    })
// 			$("#aliWapPay").click(function(){
// 			    window.location.href="${ctx}/pay/pay/aliWapPay";
// 		    })
		    
		});
	</script>
</body>
</html>