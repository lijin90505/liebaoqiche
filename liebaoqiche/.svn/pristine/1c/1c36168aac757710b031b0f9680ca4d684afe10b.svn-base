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
	<!-- 数据列表  -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center'">
			<table id="Grid" class="easyui-datagrid" title="" ctrlSelect="true" striped="true"
				rownumbers="true" pagination="true" fitColumns="true" toolbar="#Grid_Toolbar"
				loadMsg="正在加载数据，请稍等..." emptyMsg="没有找到符合条件的数据"
				data-options="url:'${ctx}/pay/wechatPayRefundRecon/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'reconChannel'">对账渠道</th>
			            <th data-options="field:'billDate'">对账日期</th>
			            <th data-options="field:'billType'">账单类型</th>
			            <th data-options="field:'tradeTime'">交易时间</th>
			            <!-- <th data-options="field:'appId'">公众账号ID</th>
			            <th data-options="field:'mchId'">商户号</th>
			            <th data-options="field:'subMchId'">子商户号</th>
			            <th data-options="field:'deviceInfo'">设备号</th> -->
			            <th data-options="field:'resultRefundOrderNo'">退款流水号</th>
			            <th data-options="field:'orderId'">订单号</th>
			            <th data-options="field:'resultOrderNo'">流水号</th>
<!-- 			            <th data-options="field:'userId'">openId</th> -->
			            <!-- <th data-options="field:'tradeState'">交易状态</th> -->
			            <!-- <th data-options="field:'bankType'">付款银行</th>
			            <th data-options="field:'tradeType'">交易类型</th>
			            <th data-options="field:'feeType'">货币种类</th> -->
			            <!-- <th data-options="field:'totalAmount'">总金额</th> -->
			          <!--   <th data-options="field:'couponFee'">代金券或立减优惠金额</th> -->
			            <th data-options="field:'refundOrderNo'">退款订单号</th>
			            <th data-options="field:'applyRefundTime'">申请退款时间</th>
			            <th data-options="field:'refundSuccessTime'">退款成功时间</th>
			            <th data-options="field:'refundAmount'">退款金额</th>
			            <!-- <th data-options="field:'refundCouponFee'">退款代金券或立减优惠金额</th> -->
			            <th data-options="field:'refundType'">退款类型</th>
			            <th data-options="field:'refundState'">退款状态</th>
			            <!-- <th data-options="field:'merchantName'">商户名称</th>
			            <th data-options="field:'merchantData'">商户数据包</th> -->
			            <!-- <th data-options="field:'serviceCharge'">手续费</th>
			            <th data-options="field:'rate'">费率</th> -->
			            <th data-options="field:'reconState'">对账状态</th>
			            <!-- <th data-options="field:'failMessage'">对账失败原因</th> -->
			            <!-- <th data-options="field:'createDate'">创建日期</th> -->
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm">
					<div class="pull-left">
						<input class="easyui-textbox" id="resultRefundOrderNo" name="keyword" data-options="prompt:'退款流水号'" size="32" style="width:200px;">
						<input class="easyui-textbox" id="orderId" name="keyword" data-options="prompt:'订单号'" size="30" style="width:200px;">
						<input class="easyui-datebox" editable="false" id="tradeTime" name="keyword" data-options="prompt:'支付日期'" size="12">
						<input class="easyui-datebox" editable="false" id="billDate" name="keyword" data-options="prompt:'对账日期'" size="12">
			        	<select class="easyui-combobox" id="reconChannel" name="reconChannel"
							        data-options="width:100,panelHeight:'auto',editable:false,value:null,prompt:'对账渠道'">
								<option value="00" selected="selected">微信</option>
								<option value="01">支付宝</option>
								<option value="02">银联</option>
						</select>
						<select class="easyui-combobox" id="reconState" name="reconState"
						        data-options="width:150,panelHeight:'auto',editable:false,value:null,prompt:'对账状态'" style="width:120px;">
						        <option value="00">成功</option>
						        <option value="01">状态不一致</option>
						        <option value="02">金额不一致</option>
						        <option value="03">对账失败</option>
						</select>
				    	<shiro:hasPermission name="payInfo:query">
					    	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
				    	</shiro:hasPermission>
				    	<a href="javascript:void(0)" id="reset_btn" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" ><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
				     </div>
				     <div class="pull-right">
				    	<shiro:hasPermission name="wechatPayRefundRecon:downloadRecon">
							<a id="recon" href="javascript:void(0)" class="easyui-linkbutton button-success">
								<i class="fa fa-download fa-lg"></i>&nbsp;&nbsp;对账
							</a>
						</shiro:hasPermission>
					 </div>
				</form>
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 清空查询表单，重载表格数据
			$('#reset_btn').click(function () {
				$('#searchForm').form('reset');
				reload();
			});
			
			$("#recon").on('click', function(){
				var ss = $("#billDate").val();
				if(ss==null || ss==''){
					alert("请输入对账日期！");
					return;
				}
				
				var reconChannel = $("#reconChannel").combobox("getValue");
				if(reconChannel==null || reconChannel==''){
					alert("请选择对账渠道！");
					return;
				}
				
				 $.ajax({
                     url: '${ctx}/pay/wechatPayRefundRecon/downloadRecon',
                     data: {
                    	 billDate: ss,
                    	 reconChannel:reconChannel,
                    	 billType:'REFUND'
                     },
                     type: 'post',
                     dataType: 'json',
                     success: function (json) {
                    	 if (json && json.rtnCode == '00000000') {
                             $.messager.alert('提示', json.rtnMsg,"success");
                             $('#Grid').datagrid('reload');
                         } else {
                        	 $.messager.alert('提示', json.rtnMsg,"error");
                             $('#Grid').datagrid('reload');
                         }
                     }
             	});
			});
			
			/* //新增
			$("#btnCreate").on('click', function(){
				var ss = $("#billDate").val();
				if(ss==null || ss==''){
					alert("请输入对账日期！");
					return;
				}
				
				var reconChannel = $("#reconChannel").combobox("getValue");
				if(reconChannel==null || reconChannel==''){
					alert("请选择对账渠道");
					return;
				}
				$.ajax({
					url: '${ctx}/pay/wechatPayRefundRecon/downloadRecon?billDate='+ss+'&reconChannel='+reconChannel+'&billType=REFUND',
					data: {	},
					type: 'post',
					dataType: 'json',
					success: function (json) {
						console.log("success")
					}
				});
			}); */
			
			// 给查询按钮添加点击事件
			$("#btnSearch").on('click', function(){
				if($('#searchForm').form('enableValidation').form('validate')){
					reload();
				}
			});
		});
		
		function reload(){
			var params = $('#Grid').datagrid('options').queryParams;
			
			params.resultRefundOrderNo = $('#resultRefundOrderNo').val();
			
			params.orderId = $('#orderId').val();
			
			params.billDate = $('#billDate').val();
			
			params.tradeTime = $('#tradeTime').val();
			
			params.reconChannel = $('#reconChannel').combobox("getValue");
			
			params.reconState = $('#reconState').combobox("getValue");
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
	</script>
</body>
</html>