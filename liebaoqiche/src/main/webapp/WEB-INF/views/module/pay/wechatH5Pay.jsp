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
				<h3 class="weixin_page_title">微信扫码支付</h3>
				<div class="weixin_page_code" id="qrcode">
				</div>
				<p>打开手机浏览器</p>
				<table class="weixin_page_money">
					<tr>
						<td>支付金额</td>
						<td>0.1元</td>
					</tr>
					<tr>
						<td>支付方式</td>
						<td>微信H5支付</td>
					</tr>
				</table>
				<p class="pay-money">应付金额：<b>0.1</b> 元</p>
				<a href="${codeurl}" target="view_window">支付</a>
			</div>
		</div>
	</div>
	
	<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			$(".pay-button").click(function(){
		    })
		});
	</script>
</body>
</html>