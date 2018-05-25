<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>OutSystemOrder</title>
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
				data-options="url:'${ctx}/pay/outSystemOrder/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th width="100" data-options="field:'ck',checkbox:true"></th>
			            <th width="100" data-options="field:'orderId'">订单号</th>
			            <th width="70" data-options="field:'payType'">支付类型</th>
			            <th width="70" data-options="field:'outSystemId'">接入系统标识</th>
			            <th width="70" data-options="field:'deviceId'">接入设备</th>
			            <th width="70" data-options="field:'orderStatus'">订单状态</th>
			            <th width="70" data-options="field:'amount'">订单金额</th>
			            <th width="70" data-options="field:'orderPayTime'">支付时间</th>
			            <th width="70" data-options="field:'userid'">用户标识</th>
			            <!-- <th data-options="field:'createBy'">创建人</th>
			            <th data-options="field:'createDate'">创建时间</th>
			            <th data-options="field:'updateBy'">修改人</th>
			            <th data-options="field:'updateDate'">修改时间</th>
			            <th data-options="field:'remarks'">备注</th> -->
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<div class="pull-left">
					<form id="searchForm">
						<shiro:hasPermission name="outSystemOrder:query">
				        	<input class="easyui-textbox" id="orderId" name="keyword" data-options="prompt:'订单号'" size="32">
				        	<input class="easyui-datebox" id="orderPayTime" editable="false" name="keyword" data-options="prompt:'支付时间'" size="17">
				        	<select class="easyui-combobox" id="orderStatus" name="orderStatus"
						        data-options="width:120,panelHeight:'auto',editable:false,value:null,prompt:'订单状态'">
						        <option value="00">支付成功</option>
						        <option value="01">支付失败</option>
						        <option value="02">未知错误</option>
						        <option value="03">转入退款</option>
						        <option value="04">未支付</option>
							</select>
				        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
				    		<a href="javascript:void(0)" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" onclick="resetForm()"><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
				    	</shiro:hasPermission>
			    	</form>
		    	</div>
		    	<div class="pull-right">
			    	<shiro:hasPermission name="outSystemOrder:exportoOutSystemOrder">
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
				window.location.href = '${ctx}/pay/outSystemOrder/add';
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
					window.location.href = '${ctx}/pay/outSystemOrder/edit?id=' + selected[0].id;
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
						var orderId = $('#orderId').val();
						var orderPayTime = $('#orderPayTime').val();
						var orderStatus = $('#orderStatus').combobox("getValue");
						var url = '${ctx}/pay/outSystemOrder/exportoOutSystemOrder?orderId='+orderId+'&orderPayTime='+orderPayTime+'&orderStatus='+orderStatus;
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
			params.orderPayTime = $('#orderPayTime').val();
			params.orderStatus = $('#orderStatus').combobox("getValue");
			$('#Grid').datagrid('options').queryParams = params;
			$('#Grid').datagrid('reload');
		}
	</script>
</body>
</html>