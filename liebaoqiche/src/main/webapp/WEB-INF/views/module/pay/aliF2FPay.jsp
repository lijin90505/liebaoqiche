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
				<span>收款方：猎豹汽车XXXXXXXXXXXX</span>
			</div>
			<div class="weixin_page">
				<h3 class="weixin_page_title">扫码支付(支付金额后台写死)</h3>
				<!-- <div class="weixin_page_code">
					二维码图片
					<img src="https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4120013985,2880555286&fm=27&gp=0.jpg" />
				</div> -->
				<table class="weixin_page_money">
					<tr>
						<td>支付金额</td>
						<td>0.1元</td>
					</tr>
					<tr>
						<td>支付方式</td>
						<td>面对面扫码支付</td>
					</tr>
				</table>
				<p class="pay-money">应付金额：<b>0.1</b> 元</p>
				<button id="sendAliF2FPay" class="pay-button">支付</button>
			</div>
		</div>
	</div>
	
	<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
				$("#sendAliF2FPay").click(function(){
				    window.location.href="${ctx}/pay/pay/sendAliF2FScanPay";
			    })
		});
	</script>
</body>
</html>