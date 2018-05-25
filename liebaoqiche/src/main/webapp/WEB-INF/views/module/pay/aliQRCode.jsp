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
				<span>收款方：沙箱测试XXXXXXXXXXXX</span>
			</div>
			<div class="weixin_page">
				<h3 class="weixin_page_title">扫码支付</h3>
				<div class="weixin_page_code" id="qrcode">
				</div>
				<p>打开支付宝沙箱扫一扫</p>
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
			</div>
		</div>
	</div>
	
	<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		$(document).ready(function($){
			var qrcode = "${codeUrl}";
			console.log(qrcode)
	        $('#qrcode').qrcode({  
	             width: 200, //设置宽  
	             height: 200, //设置高  
	             text:  qrcode //设置内容  
	        });   
	    })
		require(['jquery','common'], function($){
			$(".pay-button").click(function(){
		    })
		});
	</script>
</body>
</html>