<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE><html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxResources}/css/pay.css" rel="stylesheet"/>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center'">
			<div class="page-title"><b></b><span>支付中心</span></div>
			<div class="page_money">
				<span>0.1元</span>
				<span>商品描述：测试</span>
				<span>收款方：猎豹汽车XXXXXXXXXXXX(沙箱支付)</span>
			</div>
			<div class="weixin_page">
				<h3 class="weixin_page_title">支付宝扫码支付(支付金额后台固定)</h3>
				<!-- <div class="weixin_page_code">
					二维码图片
					<img src="https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4120013985,2880555286&fm=27&gp=0.jpg" />
				</div> -->
				<p>打开手机支付宝沙箱客户端扫一扫</p>
				<table class="weixin_page_money">
					<tr>
						<td>支付金额</td>
						<td>0.1元</td>
					</tr>
					<tr>
						<td>支付方式</td>
						<td>支付宝扫码支付</td>
					</tr>
					<tr>
						<td>订单号</td>
						<td>20180315235959000001</td>
					</tr>
				</table>
				<p  class="pay-money">应付金额：<b>0.1</b> 元</p>
				<a href="${ctx}/pay/pay/sendAliScanPay" target="view_window"><button id="aliScanPay" class="pay-button">支付</button></a>
			</div>
		</div>
	</div>
	
	<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
// 				$("#aliScanPay").click(function(){
// 				    window.location.href="${ctx}/pay/pay/sendAliScanPay";
// 			    })
		});
	</script>
</body>
</html>