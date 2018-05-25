<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>对账管理</title>
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
				data-options="url:'${ctx}/pay/wechatPayRecon/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'reconChannel'">对账渠道</th>
			            <th data-options="field:'billDate'">对账日期</th>
			            <th data-options="field:'billType'">账单类型</th>
			            <th data-options="field:'tradeTime'">支付时间</th>
			            <!-- <th data-options="field:'appId'">公众账号ID</th>
			            <th data-options="field:'mchId'">商户号</th>
			            <th data-options="field:'subMchId'">子商户号</th>
			            <th data-options="field:'deviceInfo'">设备号</th> -->
			            <th data-options="field:'resultOrderNo'">流水号</th>
			            <th data-options="field:'orderId'">订单号</th>
<!-- 			            <th data-options="field:'userId'">openId</th> -->
			            <th data-options="field:'tradeType'">交易类型</th>
			            <th data-options="field:'tradeState'">交易状态</th>
			            <th data-options="field:'totalAmount'">总金额</th>
			            <!-- <th data-options="field:'bankType'">付款银行</th>
			             <th data-options="field:'merchantName'">商户名称</th>
			            <th data-options="field:'serviceCharge'">手续费</th>
			            <th data-options="field:'rate'">费率</th>-->
			            <th data-options="field:'reconState'">对账状态</th>
			            <th data-options="field:'failMessage'">对账失败原因</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm">
					<shiro:hasPermission name="wechatPayRecon:query">
						<input class="easyui-textbox" id="resultOrderNo" name="keyword" data-options="prompt:'流水号'" size="30">
						<input class="easyui-textbox" id="orderId" name="keyword" data-options="prompt:'订单号'" size="30">
						<input class="easyui-datebox" editable="false" id="billDate" name="keyword" data-options="prompt:'对账日期'" size="15">
						<input class="easyui-datebox" editable="false" id="tradeTime" name="keyword" data-options="prompt:'支付日期'" size="15">
						<select class="easyui-combobox" id="reconChannel" name="reconChannel"
						        data-options="width:110,panelHeight:'auto',editable:false,value:null,prompt:'对账渠道'">
							<option value="0" selected="selected">微信</option>
							<option value="1">支付宝</option>
							<option value="2">银联</option>
						</select>
						<select class="easyui-combobox" id="reconState" name="reconState"
						        data-options="width:110,panelHeight:'auto',editable:false,value:null,prompt:'对账状态'">
						        <option value="00">成功</option>
						        <option value="01">失败</option>
						</select>
					</shiro:hasPermission>
			    	<shiro:hasPermission name="payInfo:query">
			        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
			    	</shiro:hasPermission>
			    	<a href="javascript:void(0)" id="reset_btn" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" ><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
			    	
			    	<div  class="pull-right">
			    		<shiro:hasPermission name="wechatPayRecon:downloadRecon">
						<a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success">
							<i class="fa fa-download fa-lg"></i>&nbsp;&nbsp;下载对账
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
			/* // 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				window.location.href = '${ctx}/pay/wechatPayRecon/add';
			}); */
			// 清空查询表单，重载表格数据
			$('#reset_btn').click(function () {
				$('#searchForm').form('reset');
				reload();
			});	
			//新增
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
					url: '${ctx}/pay/wechatPayRecon/downloadRecon?billDate='+ss+'&reconChannel='+reconChannel+'&billType=SUCCESS',
					data: {	},
					type: 'post',
					dataType: 'json',
					success: function (json) {
						console.log("success")
					}
				});
			});
			
			// 给查询按钮添加点击事件
			$("#btnSearch").on('click', function(){
				if($('#searchForm').form('enableValidation').form('validate')){
					reload();
				}
			});
		});
		
		function reload(){
			var params = $('#Grid').datagrid('options').queryParams;
			
			var resultOrderNo = $('#resultOrderNo').val();
			if(resultOrderNo!=null && resultOrderNo!=''){
				params.resultOrderNo = resultOrderNo;
			}
			
			var orderId = $('#orderId').val();
			if(orderId!=null && orderId!=''){
				params.orderId = orderId;
			}
			
			var billDate = $('#billDate').val();
			if(billDate!=null && billDate!=''){
				params.billDate = billDate;
			}
			
			var tradeTime = $('#tradeTime').val();
			if(tradeTime!=null && tradeTime!=''){
				params.tradeTime = tradeTime;
			}
			
			var reconChannel = $('#reconChannel').combobox("getValue");
			if(reconChannel!=null && reconChannel!=''){
				params.reconChannel = reconChannel;
			}
			
			var reconState = $('#reconState').combobox("getValue");
			if(reconState!=null && reconState!=''){
				params.reconState = $('#reconState').combobox("getValue");
			}
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
	</script>
</body>
</html>