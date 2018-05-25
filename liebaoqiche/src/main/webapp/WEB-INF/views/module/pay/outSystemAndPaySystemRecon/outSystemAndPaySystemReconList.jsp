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
				data-options="url:'${ctx}/pay/outSystemAndPaySystemRecon/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'orderId'">订单号</th>
			            <th data-options="field:'orderAmount'">订单金额</th>
			            <th data-options="field:'osOrderAmount'">接入系统金额</th>
			            <th data-options="field:'psOrderAmount'">支付系统金额</th>
			            <th data-options="field:'payType'">支付方式</th>
			            <th data-options="field:'orderStatus'">订单支付状态</th>
			            <th data-options="field:'osOrderStatus'">接入系统支付状态</th>
			            <th data-options="field:'psOrderStatus'">支付系统支付状态</th>
			            <th data-options="field:'payTime'">订单支付时间</th>
			            <th data-options="field:'osPayTime'">接入系统支付时间</th>
			            <th data-options="field:'psPayTime'">支付系统支付时间</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<div class="pull-left">
					<shiro:hasPermission name="outSystemOrder:query">
			        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
			    	</shiro:hasPermission>
			    </div>
		    </div>
		</div>
	</div>
	
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			
			// 给查询按钮添加点击事件
			$("#btnSearch").on('click', function(){
				
			});
		});
	</script>
</body>
</html>