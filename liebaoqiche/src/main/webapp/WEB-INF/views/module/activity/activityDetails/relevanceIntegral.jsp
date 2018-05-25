
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysUser</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp"%>
<div style="height: 500px;margin:10px 20px;box-sizing:border-box;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north', collapsible:false" title="当前操作活动信息"
		     style="height: 80px; line-height: 40px; padding: 0 10px;">
			活动名称：<span id="name"></span>
		</div>
		<div data-options="region: 'west', collapsible:false" title="未选积分"
		     style="width: 350px;">
			<table id="Grid_UnchoosedIntegrals" class="easyui-datagrid"
			       ctrlSelect="true" striped="true" rownumbers="true"
			       pagination="false" fitColumns="true" loadMsg="正在加载数据，请稍等..."
			       data-options="fit:true, checkOnSelect:true, selectOnCheck:true, border: false">
				<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'name',width:120">积分名称</th>
					<th data-options="field:'integral',width:120">积分</th>
					<th data-options="field:'id',hidden:true,width:150">积分代码</th>
				</tr>
				</thead>
			</table>
		</div>
		<div class="btnLink" data-options="region:'center', border: false">
			<a id="btnRight_ActSelectIntegral" href="javascript:void(0)"
			   class="easyui-linkbutton button-default"><i
					class="fa fa-angle-right fa-lg"></i></a> <a
				id="btnDoubleRight_ActUserSelectIntegral" href="javascript:void(0)"
				class="easyui-linkbutton button-default"><i
				class="fa fa-angle-double-right fa-lg"></i></a> <a
				id="btnDoubleLeft_ActUserSelectIntegral" href="javascript:void(0)"
				class="easyui-linkbutton button-default"><i
				class="fa fa-angle-double-left fa-lg"></i></a> <a
				id="btnLeft_ActUserSelectIntegral" href="javascript:void(0)"
				class="easyui-linkbutton button-default"><i
				class="fa fa-angle-left fa-lg"></i></a>
		</div>
		<div data-options="region: 'east', collapsible:false" title="已有积分"
		     style="width: 350px">
			<table id="Grid_choosedIntegrals" class="easyui-datagrid"
			       ctrlSelect="true" striped="true" rownumbers="true"
			       pagination="false" fitColumns="true" loadMsg="正在加载数据，请稍等..."
			       data-options="fit:true, checkOnSelect:true, selectOnCheck:true, border: false">
				<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'name',width:120">积分名称</th>
					<th data-options="field:'integral',width:120">积分</th>
					<th data-options="field:'id',hidden:true,width:150">积分代码</th>
				</tr>
				</thead>
			</table>
		</div>

		<div data-options="region:'south',border:false"
		     style="text-align: right; padding: 5px;">
			<a id="btnSave_IntegralAccredit"
			   class="easyui-linkbutton button-success"><i
					class="fa fa-wrench fa-lg"></i>&nbsp;&nbsp;保存</a>
			<a id="btnCancel" href="javascript:void(0)"
			   class="easyui-linkbutton button-warning" style="width: 80px;"><i
					class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
		</div>

	</div></div>
<!-- </div> -->

<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
<script type="text/javascript">
	require(['jquery','common'], function($){
		var activityId = location.search.replace("?id=","");
		$(function(){
			// 加载角色授权信息
			$.ajax({
				url: '${ctx}/activity/activityDetails/activityIntegral',
				data: {
					activityId: activityId
				},
				type: 'POST',
				dataType: 'JSON',
				success: function (json) {

					// 设置当前显示的活动名称
					$("#name").html(json.activityName);
					$("#Grid_UnchoosedIntegrals").datagrid();
					$("#Grid_choosedIntegrals").datagrid();
					// 显示未选中的积分
					if(json && json.activityDetailsUnChooseIntegralList){
						$("#Grid_UnchoosedIntegrals").datagrid('loadData', json.activityDetailsUnChooseIntegralList);
					}

					// 显示已经选中的积分
					if(json && json.activityDetailsChooseIntegralList){
						$("#Grid_choosedIntegrals").datagrid('loadData', json.activityDetailsChooseIntegralList);
					}

				}
			});
		});

		//授权按钮保存
		$('#btnSave_IntegralAccredit').click(function () {
			$.messager.confirm("关联确认","确认要给该系统进行关联？",function(r){
				if(r){
					var allChoosedIntegrals = $("#Grid_choosedIntegrals").datagrid('getData');
					var allIntegrals = [];
					for(var i=0;i<allChoosedIntegrals.rows.length;i++){
						allIntegrals.push(allChoosedIntegrals.rows[i]);
					}
					var allIntegralId = "";
					for(var i = 0; i < allIntegrals.length; i++){
						allIntegralId += allIntegrals[i].id;
						if(i != allIntegrals.length - 1){
							allIntegralId += ",";
						}
					}

					$.ajax({
						url: '${ctx}/activity/activityDetails/accreditIntegral',
						data: {
							activityId : activityId,
							allIntegralsId : allIntegralId
						},
						type: 'post',
						dataType: 'json',
						success: function (json) {
							if (json && json.rtnCode == '00000000') {
								$.messager.alert('提示', "关联成功", "success",function(){
									hideDialog();
								});
							} else {
								$.messager.alert('提示', json.rtnMsg, "error");
							}
						}
					});
				}
			});
		});

		//点击插入选择的N个积分
		$("#btnRight_ActSelectIntegral").click(function(){

			var selectedIntegrals = $("#Grid_UnchoosedIntegrals").datagrid('getSelections');
			var allSelectedIntegrals = [];
			//插入行
			for(var i=0;i<selectedIntegrals.length;i++){
				allSelectedIntegrals.push(selectedIntegrals[i]);
				$("#Grid_choosedIntegrals").datagrid('insertRow', {
					row:{
						name : selectedIntegrals[i].name ,
						integral : selectedIntegrals[i].integral ,
						code : selectedIntegrals[i].code,
						id : selectedIntegrals[i].id
					}
				});

			}
			//删除行
			for(var j =0;j<allSelectedIntegrals.length;j++){
				var index = $('#Grid_UnchoosedIntegrals').datagrid('getRowIndex',allSelectedIntegrals[j]);
				$('#Grid_UnchoosedIntegrals').datagrid('deleteRow',index);
			}
		});

		//点击插入选择所有积分
		$("#btnDoubleRight_ActUserSelectIntegral").click(function(){

			var allUnchoosedIntegrals = $("#Grid_UnchoosedIntegrals").datagrid('getData');
			var allIntegrals = [];
			//插入所有行
			for(var i=0;i<allUnchoosedIntegrals.rows.length;i++){
				allIntegrals.push(allUnchoosedIntegrals.rows[i]);
				$("#Grid_choosedIntegrals").datagrid('insertRow', {
					row:{
						name : allUnchoosedIntegrals.rows[i].name ,
						integral : allUnchoosedIntegrals.rows[i].integral ,
						code : allUnchoosedIntegrals.rows[i].code,
						id : allUnchoosedIntegrals.rows[i].id
					}
				});
			}
			//删除所有行
			for(var j =0;j<allIntegrals.length;j++){
				var index = $('#Grid_UnchoosedIntegrals').datagrid('getRowIndex',allIntegrals[j]);
				$('#Grid_UnchoosedIntegrals').datagrid('deleteRow',index);
			}

		});

		//点击移除选择的N行
		$("#btnLeft_ActUserSelectIntegral").click(function(){

			var selectedIntegrals = $("#Grid_choosedIntegrals").datagrid('getSelections');
			var allSelectedIntegrals = [];
			//插入行
			for(var i=0;i<selectedIntegrals.length;i++){
				allSelectedIntegrals.push(selectedIntegrals[i]);
				$("#Grid_UnchoosedIntegrals").datagrid('insertRow', {
					row:{
						name : selectedIntegrals[i].name ,
						integral : selectedIntegrals[i].integral ,
						code : selectedIntegrals[i].code,
						id : selectedIntegrals[i].id
					}
				});

			}
			//删除行
			for(var j =0;j<allSelectedIntegrals.length;j++){
				var index = $('#Grid_choosedIntegrals').datagrid('getRowIndex',allSelectedIntegrals[j]);
				$('#Grid_choosedIntegrals').datagrid('deleteRow',index);
			}
		});

		//点击移除选择的所有积分
		$("#btnDoubleLeft_ActUserSelectIntegral").click(function(){

			var allChoosedIntegrals = $("#Grid_choosedIntegrals").datagrid('getData');
			var allIntegrals = [];
			//插入所有行
			for(var i=0;i<allChoosedIntegrals.rows.length;i++){
				allIntegrals.push(allChoosedIntegrals.rows[i]);
				$("#Grid_UnchoosedIntegrals").datagrid('insertRow', {
					row:{
						name : allChoosedIntegrals.rows[i].name ,
						integral : allChoosedIntegrals.rows[i].integral ,
						code : allChoosedIntegrals.rows[i].code,
						id : allChoosedIntegrals.rows[i].id
					}
				});
			}
			//删除所有行
			for(var j =0;j<allIntegrals.length;j++){
				var index = $('#Grid_choosedIntegrals').datagrid('getRowIndex',allIntegrals[j]);
				$('#Grid_choosedIntegrals').datagrid('deleteRow',index);
			}

		});

		// 给取消按钮添加点击事件
		$("#btnCancel").on('click', function(){
			hideDialog();
		});
	});

	// 验证是否已经选择过某一资源
	function checkResourcesChoosed(resourcesId){
		var choosed = $("#Grid_choosedIntegrals").datagrid("getData");
		//alert(choosed.rows.length);
		var isExist = false;
		for(var j = 0; j < choosed.rows.length; j++){
			//alert(choosed.rows[j].id);
			if(resourcesId == choosed.rows[j].id){
				isExist = true;
				break;
			}
		}
		if(isExist){
			return true;
		}
		return false;
	}
	// 获取指定资源在已选择资源中的下标
	function getChoosedIndex(resourcesId){
		var choosed = $("#Grid_choosedIntegrals").datagrid("getData");
		for(var j = 0; j < choosed.rows.length; j++){
			if(resourcesId == choosed.rows[j].id){
				index = j;
				break;
			}
		}
		return index;
	}
	//为选择资源的下标
	function getUnchoosedIndex(resourcesId){
		var index = -1;
		var unchoosed = $("#Grid_UnchoosedIntegrals").datagrid("getData");
		for(var j = 0; j < unchoosed.rows.length; j++){
			if(resourcesId == unchoosed.rows[j].id){
				index = j;
				break;
			}
		}
		return index;
	}
</script>
</body>
</html>