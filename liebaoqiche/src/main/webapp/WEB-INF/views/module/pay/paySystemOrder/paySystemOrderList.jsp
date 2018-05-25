<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>PaySystemOrder</title>
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
				data-options="url:'${ctx}/pay/paySystemOrder/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th width="100" data-options="field:'ck',checkbox:true"></th>
			            <th width="100" data-options="field:'transactionId'">支付系统流水号</th>
			            <th width="100" data-options="field:'orderId'">商户订单号</th>
			            <th width="40" data-options="field:'merchantNo'">商户号</th>
			            <th width="70" data-options="field:'tradeTime'">交易时间</th>
			            <th width="40" data-options="field:'tradeState'">交易状态</th>
			            <th width="40" data-options="field:'tradeAmount'">交易金额</th>
			            <!-- <th data-options="field:'couponFee'">代金券或立减优惠金额</th>
			            <th data-options="field:'appid'">appid</th>
			            <th data-options="field:'subMerchantNo'">子商户号</th>
			            <th data-options="field:'tradeType'">交易类型</th>
			            <th data-options="field:'bankType'">付款银行</th>
			            <th data-options="field:'deviceNo'">设备号</th>
			            <th data-options="field:'openid'">用户标识</th>
			            <th data-options="field:'feeType'">货币种类</th>
			            <th data-options="field:'productName'">商品名称</th>
			            <th data-options="field:'attach'">商户数据包</th>
			            <th data-options="field:'serviceCharge'">手续费</th>
			            <th data-options="field:'rate'">费率</th> 
			            <th data-options="field:'creater'">创建人</th>
			            <th data-options="field:'createTime'">创建时间</th>
			            <th data-options="field:'modifier'">修改人</th>
			            <th data-options="field:'modifyTime'">修改时间</th>
			            <th width="100" data-options="field:'remarks'">备注</th>-->
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<div class="pull-left">
					<shiro:hasPermission name="paySystemOrder:query">
						<form id="searchForm">
							<input class="easyui-textbox" id="orderId" name="orderId" data-options="prompt:'订单号'" size="32">
							<input class="easyui-datebox" id="tradeTime" editable="false" name="tradeTime" data-options="prompt:'交易时间'" size="17">
				    		<select class="easyui-combobox" id="tradeState" name="tradeState"
						        data-options="width:120,editable:false,value:null,prompt:'支付状态'">
						        <option value="00">支付成功</option>
						        <option value="01">支付失败</option>
						        <option value="02">未知错误</option>
						        <option value="03">申请退款中</option>
						        <option value="04">未支付</option>
							</select>
				        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
				    		<a href="javascript:void(0)" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" onclick="resetForm()"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
				    	</form>
			    	</shiro:hasPermission>
		    	</div>
		    	<div class="pull-right">
					<%--  <shiro:hasPermission name="paySystemOrder:create">
				        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
					</shiro:hasPermission>
					
					<shiro:hasPermission name="paySystemOrder:update">
				        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
					</shiro:hasPermission>
					
					<shiro:hasPermission name="paySystemOrder:delete">
				        <a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除</a>
					</shiro:hasPermission>
					--%>
					<shiro:hasPermission name="paySystemOrder:exportoPaySystemOrder">
				        <a id="btnExport" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-share-square-o fa-lg"></i>&nbsp;&nbsp;导出</a>
					</shiro:hasPermission>
				</div>
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				window.location.href = '${ctx}/pay/paySystemOrder/add';
			});
			
			// 给修改按钮添加点击事件
			$("#btnUpdate").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要修改的记录', "info");
				}
				if(selected.length > 1){
					$.messager.alert('提示','只能选择一条需要修改的记录', "info");
				}
				if(selected.length == 1){
					window.location.href = '${ctx}/pay/paySystemOrder/edit?id=' + selected[0].id;
				}
			});
			
			// 给删除按钮添加点击事件
			$("#btnDelete").on('click', function(){
				var selected = $("#Grid").datagrid('getSelections');
				if(selected.length == 0){
					$.messager.alert('提示','请选择需要删除的记录', "info");
				}else{
                    $.messager.confirm('警告', '确认删除本条记录吗?', function (r) {
                        if(r){
                            var ids = '';
                            for (var i = 0; i < selected.length; i++) {
                                ids += selected[i].id + ',';
                            }
                            
                            $.ajax({
	                            url: '${ctx}/pay/paySystemOrder/delete',
	                            data: {
	                                ids: ids
	                            },
	                            type: 'post',
	                            dataType: 'json',
	                            success: function (json) {
	                                if (json && json.rtnCode == '00000000') {
	                                    $.messager.alert('提示', "删除成功", "success");
	                                    $('#Grid').datagrid('reload');
	                                } else {
	                                    $.messager.alert('提示', json.rtnMsg);
	                                }
	                            }
                        	});
						}
                    });
				}
			});
			
			// 给查询按钮添加点击事件
			$("#btnSearch").on('click', function(){
				if($('#searchForm').form('enableValidation').form('validate')){
					reload();
				}
			});
			
			// 清空查询表单，重载表格数据
			$('#reset_btn').click(function () {
				$('#searchForm').form('reset').submit();
// 				reload();
			});
			
			// 给导出按钮添加点击事件
			$("#btnExport").on('click', function(){
				$.messager.confirm('警告', '确认导出支付信息?', function (r) {
					if(r){
						var str = "";
						var orderId = $('#orderId').val();
						if(orderId!=null || orderId!=''){
							str = "orderId="+orderId;
						}
						var tradeTime = $('#tradeTime').val();
						if(tradeTime!=null || tradeTime!=''){
							str +="&tradeTime="+tradeTime;
						}
						var tradeState = $('#tradeState').combobox("getValue");
						if(tradeState!=null || tradeState!=''){
							str +="&tradeState="+tradeState;
						}
						var url = '${ctx}/pay/paySystemOrder/exportoPaySystemOrder?'+str;
						window.location.href = url;
					}
				});
			});
		});
		function resetForm(){
			$('#searchForm').form('reset');
			reload();
		};
		function reload(){
			var params = $('#Grid').datagrid('options').queryParams;
			params.orderId = $('#orderId').val();
			params.tradeTime = $('#tradeTime').val();
			params.tradeState = $('#tradeState').combobox("getValue");
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
	</script>
</body>
</html>