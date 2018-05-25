<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>ThreePartyRecon</title>
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
				data-options="url:'${ctx}/recon/threePartyRecon/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'orderId'">订单号</th>
			            <th data-options="field:'transactionId'">支付系统流水号</th>
			            <th data-options="field:'renconTime'">对账日期</th>
			            <th data-options="field:'billType'">账单类型</th>
			            <th data-options="field:'tradeAmount'">交易金额</th>
			            <th data-options="field:'tradeTime'">交易时间</th>
			            <!-- <th data-options="field:'tradeType'">支付类型</th> -->
			            <th data-options="field:'tradeState'">支付状态</th>
			            <th data-options="field:'reconState'">对账状态</th>
			            <th data-options="field:'failMessage'">对账失败原因</th>
			            <th data-options="field:'creater'">创建人</th>
			            <th data-options="field:'createTime'">创建时间</th>
			            <th data-options="field:'modifier'">修改人</th>
			            <th data-options="field:'modifyTime'">修改时间</th>
			            <th data-options="field:'remarks'">备注</th>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
					<form id="searchForm">
						<shiro:hasPermission name="threePartyRecon:query">
							<input class="easyui-textbox" id="orderId" name="orderId" data-options="prompt:'订单号'" size="32">
							<input class="easyui-datebox" id="tradeTime" editable="false" name="tradeTime" data-options="prompt:'交易时间'" size="17">
				        	<input class="easyui-datebox" editable="false" id="renconTime" name="renconTime" data-options="prompt:'对账日期'" size="17">
				        	<a id="btnSearch" href="javascript:void(0)" class="easyui-linkbutton button-primary"><i class="fa fa-search fa-lg"></i>&nbsp;&nbsp;查询</a>
				    		<a href="javascript:void(0)" id="reset_btn" class="easyui-linkbutton reset l-btn l-btn-small" plain="true" ><i class="fa fa-repeat fa-lg"></i>&nbsp;&nbsp;重置</a>
				    	</shiro:hasPermission>
						<div class="pull-right">
					    	<shiro:hasPermission name="threePartyRecon:recon">
								<a id="recon" href="javascript:void(0)" class="easyui-linkbutton button-success">
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
			
			$("#recon").on('click', function(){
				var ss = $("#renconTime").val();
				if(ss==null || ss==''){
					alert("请输入对账日期！");
					return;
				}
				$.ajax({
					url: '${ctx}/recon/threePartyRecon/recon?billDate='+ss,
					data: {	},
					type: 'post',
					dataType: 'json',
					success: function (json) {
						$.messager.alert('提示', "操作成功！", "success");
                        $('#Grid').datagrid('reload');
					}
				});
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
					window.location.href = '${ctx}/recon/threePartyRecon/edit?id=' + selected[0].id;
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
	                            url: '${ctx}/recon/threePartyRecon/delete',
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
			
			// 清空查询表单，重载表格数据
			$('#reset_btn').click(function () {
				$('#searchForm').form('reset').submit();
			});
			
			// 给查询按钮添加点击事件
			$("#btnSearch").on('click', function(){
				if($('#searchForm').form('enableValidation').form('validate')){
					reload();
				}
			});
			
			function reload(){
				var params = $('#Grid').datagrid('options').queryParams;
				
				var orderId = $('#orderId').val();
				if(orderId!=null && orderId!=''){
					params.orderId = orderId;
				}
				var tradeTime = $('#tradeTime').val();
				if(tradeTime!=null && tradeTime!=''){
					params.tradeTime = tradeTime;
				}
				
				var renconTime = $('#renconTime').val();
				if(renconTime!=null && renconTime!=''){
					params.renconTime = renconTime;
				}
				
				$('#Grid').datagrid('options').queryParams = params;
				$('#Grid').datagrid('reload');
			}
		});
	</script>
</body>
</html>