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
	<!-- 数据列表  -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center'">
			<table id="Grid" class="easyui-datagrid" title="" ctrlSelect="true" striped="true"
				rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
				loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
				data-options="url:'${ctx}/pay/payRefundInfo/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			           <!--  <th data-options="field:'id'">主键</th>
			            <th data-options="field:'payInfoId'">支付信息主表</th>
			            <th data-options="field:'wechatPayInfoId'">微信支付信息主表</th> -->
			            <!-- <th data-options="field:'outSystemId'">接入系统标识</th> -->
			            <th data-options="field:'refundChannel'">退款渠道</th>
			            <th data-options="field:'userId'">用户名称</th>
			            <th data-options="field:'refundNo'">退款流水号</th>
			            <th data-options="field:'outRefundNo'">退款订单号</th>
			            <th data-options="field:'outTradeNo'">支付订单号</th>
<!-- 			            <th data-options="field:'totalFee'">订单金额</th> -->
			            <th data-options="field:'refundFee'">退款金额</th>
<!-- 			            <th data-options="field:'refundDesc'">退款原因</th> -->
			            <th data-options="field:'refundStatus'">退款状态</th>
			            <th data-options="field:'refundStartTime'">退款开始时间</th>
<!-- 			            <th data-options="field:'refundEndTime'">退款结束时间</th> -->
			            <th data-options="field:'refundSuccessTime'">退款成功时间</th>
			            <!-- <th data-options="field:'notifyUrl'">回调URL</th> -->
			           <!--  <th data-options="field:'refundRecvAccout'">退款入账账户；1退回银行卡({银行名称}{卡类型}{卡尾号});2退回支付用户零钱(支付用户零钱);3退还商户(商户基本账户,商户结算银行账户);4退回支付用户零钱通(支付用户零钱通)针对微信</th>
			            <th data-options="field:'refundAccount'">退款资金来源;REFUND_SOURCE_RECHARGE_FUNDS可用余额退款/基本账户;REFUND_SOURCE_UNSETTLED_FUNDS 未结算资金退款(针对微信)</th>
			            <th data-options="field:'refundRequestSource'">API接口;VENDOR_PLATFORM商户平台(针对微信)</th> 
			            <th data-options="field:'remarks'">备注</th>
			            <th data-options="field:'createBy'">创建人</th>
			            <th data-options="field:'createDate'">创建时间</th>
			            <th data-options="field:'updateBy'">修改人</th>
			            <th data-options="field:'updateDate'">修改时间</th>-->
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<shiro:hasPermission name="payRefundInfo:query">
					<form id="searchForm">
						<input class="easyui-textbox" id="refundNo" name="keyword" data-options="prompt:'退款流水号'" size="35" style="width:200px;">
						<input class="easyui-textbox" id="outRefundNo" name="keyword" data-options="prompt:'退款订单号'" size="32" style="width:200px;">
						<input class="easyui-textbox" id="outTradeNo" name="keyword" data-options="prompt:'支付订单号'" size="32" style="width:200px;">
			        	<input class="easyui-datebox" id="refundStartTime" name="keyword" editable="false" data-options="prompt:'退款时间'" size="17">
			        	<select class="easyui-combobox" id="refundStatus" name="refundStatus"
					        data-options="width:120,panelHeight:'auto',editable:false,value:null,prompt:'退款状态'">
					        <option value="04">处理中</option>
					        <option value="00">成功</option>
					        <option value="01">失败</option>
					        <option value="02">退款关闭</option>
					        <option value="03">未知错误</option>
						</select>
			        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
			    		<a href="javascript:void(0)" id="reset_btn" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" ><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
				    </form>
		    	</shiro:hasPermission>
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
	require(['jquery','common'], function($){
			// 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				window.location.href = '${ctx}/pay/payRefundInfo/add';
			});
			
			// 给查询按钮添加点击事件
			$("#btnSearch").on('click', function(){
				if($('#searchForm').form('enableValidation').form('validate')){
					reload();
				}
			});
			
			// 清空查询表单，重载表格数据
			$('#reset_btn').click(function () {
				$('#searchForm').form('reset');
				$('#searchForm').form('submit');
				reload();
			});
		});
			
		function reload(){
			var params = $('#Grid').datagrid('options').queryParams;
			params.refundNo = $('#refundNo').val();
			params.outRefundNo = $('#outRefundNo').val();
			params.outTradeNo = $('#outTradeNo').val();
			params.refundStartTime = $('#refundStartTime').val();
			params.refundStatus = $('#refundStatus').combobox("getValue");
			
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
		
		
	</script>
</body>
</html>