
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title></title>
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
		<div data-options="region: 'west', collapsible:false" title="未选经验值"
		     style="width: 350px;">
			<table id="Grid_UnchoosedExperiences" class="easyui-datagrid"
			       ctrlSelect="true" striped="true" rownumbers="true"
			       pagination="false" fitColumns="true" loadMsg="正在加载数据，请稍等..."
			       data-options="fit:true, checkOnSelect:true, selectOnCheck:true, border: false">
				<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'name',width:120">经验值名称</th>
					<th data-options="field:'exp',width:120">经验值</th>
					<th data-options="field:'id',hidden:true,width:150">经验值代码</th>
				</tr>
				</thead>
			</table>
		</div>
		<div class="btnLink" data-options="region:'center', border: false">
			<a id="btnRight_ActSelectExperience" href="javascript:void(0)"
			   class="easyui-linkbutton button-default"><i
					class="fa fa-angle-right fa-lg"></i></a> <a
				id="btnDoubleRight_ActSelectExperience" href="javascript:void(0)"
				class="easyui-linkbutton button-default"><i
				class="fa fa-angle-double-right fa-lg"></i></a> <a
				id="btnDoubleLeft_ActSelectExperience" href="javascript:void(0)"
				class="easyui-linkbutton button-default"><i
				class="fa fa-angle-double-left fa-lg"></i></a> <a
				id="btnLeft_ActSelectExperience" href="javascript:void(0)"
				class="easyui-linkbutton button-default"><i
				class="fa fa-angle-left fa-lg"></i></a>
		</div>
		<div data-options="region: 'east', collapsible:false" title="已有经验值"
		     style="width: 350px">
			<table id="Grid_choosedExperiences" class="easyui-datagrid"
			       ctrlSelect="true" striped="true" rownumbers="true"
			       pagination="false" fitColumns="true" loadMsg="正在加载数据，请稍等..."
			       data-options="fit:true, checkOnSelect:true, selectOnCheck:true, border: false">
				<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'name',width:120">经验值名称</th>
					<th data-options="field:'exp',width:120">经验值</th>
					<th data-options="field:'id',hidden:true,width:150">经验值代码</th>
				</tr>
				</thead>
			</table>
		</div>

		<div data-options="region:'south',border:false"
		     style="text-align: right; padding: 5px;">
			<a id="btnSave_SysUserAccredit"
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
			// 加载活动授权信息
			$.ajax({
				url: '${ctx}/activity/activityDetails/activityExperience',
				data: {
					activityId: activityId
				},
				type: 'POST',
				dataType: 'JSON',
				success: function (json) {

					// 设置当前显示的活动名称
					$("#name").html(json.activityName);
					$("#Grid_UnchoosedExperiences").datagrid();
					$("#Grid_choosedExperiences").datagrid();
					// 显示未选中的经验值
					if(json && json.activityDetailsUnChooseExperienceList){
						$("#Grid_UnchoosedExperiences").datagrid('loadData', json.activityDetailsUnChooseExperienceList);
					}

					// 显示已经选中的经验值
					if(json && json.activityDetailsChooseExperienceList){
						$("#Grid_choosedExperiences").datagrid('loadData', json.activityDetailsChooseExperienceList);
					}

				}
			});
		});

		//授权按钮保存
		$('#btnSave_SysUserAccredit').click(function () {
			var allChoosedExperiences = $("#Grid_choosedExperiences").datagrid('getData');
			var rowsNum =allChoosedExperiences.total;
			if(allChoosedExperiences != null && rowsNum > 1){
				$.messager.alert('提示', "只能选择一条记录", "info");
			}else{
				$.messager.confirm("关联确认","确认要给该系统进行关联？",function(r){
					if(r){
						var allExperiences = [];
						for(var i=0;i<allChoosedExperiences.rows.length;i++){
							allExperiences.push(allChoosedExperiences.rows[i]);
						}
						var allExperienceId = "";
						for(var i = 0; i < allExperiences.length; i++){
							allExperienceId += allExperiences[i].id;
							if(i != allExperiences.length - 1){
								allExperienceId += ",";
							}
						}
	
						$.ajax({
							url: '${ctx}/activity/activityDetails/accreditExperience',
							data: {
								activityId : activityId,
								allExperiencesId : allExperienceId
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
			}
			
		});

		//点击插入选择的N个经验值
		$("#btnRight_ActSelectExperience").click(function(){

			var selectedExperiences = $("#Grid_UnchoosedExperiences").datagrid('getSelections');
			var allSelectedExperiences = [];
			//插入行
			for(var i=0;i<selectedExperiences.length;i++){
				allSelectedExperiences.push(selectedExperiences[i]);
				$("#Grid_choosedExperiences").datagrid('insertRow', {
					row:{
						name : selectedExperiences[i].name ,
						exp : selectedExperiences[i].exp ,
						code : selectedExperiences[i].code,
						id : selectedExperiences[i].id
					}
				});

			}
			//删除行
			for(var j =0;j<allSelectedExperiences.length;j++){
				var index = $('#Grid_UnchoosedExperiences').datagrid('getRowIndex',allSelectedExperiences[j]);
				$('#Grid_UnchoosedExperiences').datagrid('deleteRow',index);
			}
		});

		//点击插入选择所有经验值
		$("#btnDoubleRight_ActSelectExperience").click(function(){

			var allUnchoosedExperiences = $("#Grid_UnchoosedExperiences").datagrid('getData');
			var allExperiences = [];
			//插入所有行
			for(var i=0;i<allUnchoosedExperiences.rows.length;i++){
				allExperiences.push(allUnchoosedExperiences.rows[i]);
				$("#Grid_choosedExperiences").datagrid('insertRow', {
					row:{
						name : allUnchoosedExperiences.rows[i].name ,
						exp : allUnchoosedExperiences.rows[i].exp ,
						code : allUnchoosedExperiences.rows[i].code,
						id : allUnchoosedExperiences.rows[i].id
					}
				});
			}
			//删除所有行
			for(var j =0;j<allExperiences.length;j++){
				var index = $('#Grid_UnchoosedExperiences').datagrid('getRowIndex',allExperiences[j]);
				$('#Grid_UnchoosedExperiences').datagrid('deleteRow',index);
			}

		});

		//点击移除选择的N行
		$("#btnLeft_ActSelectExperience").click(function(){

			var selectedExperiences = $("#Grid_choosedExperiences").datagrid('getSelections');
			var allSelectedExperiences = [];
			//插入行
			for(var i=0;i<selectedExperiences.length;i++){
				allSelectedExperiences.push(selectedExperiences[i]);
				$("#Grid_UnchoosedExperiences").datagrid('insertRow', {
					row:{
						name : selectedExperiences[i].name ,
						exp : selectedExperiences[i].exp ,
						code : selectedExperiences[i].code,
						id : selectedExperiences[i].id
					}
				});

			}
			//删除行
			for(var j =0;j<allSelectedExperiences.length;j++){
				var index = $('#Grid_choosedExperiences').datagrid('getRowIndex',allSelectedExperiences[j]);
				$('#Grid_choosedExperiences').datagrid('deleteRow',index);
			}
		});

		//点击移除选择的所有经验值
		$("#btnDoubleLeft_ActSelectExperience").click(function(){

			var allChoosedExperiences = $("#Grid_choosedExperiences").datagrid('getData');
			var allExperiences = [];
			//插入所有行
			for(var i=0;i<allChoosedExperiences.rows.length;i++){
				allExperiences.push(allChoosedExperiences.rows[i]);
				$("#Grid_UnchoosedExperiences").datagrid('insertRow', {
					row:{
						name : allChoosedExperiences.rows[i].name ,
						exp : allChoosedExperiences.rows[i].exp ,
						code : allChoosedExperiences.rows[i].code,
						id : allChoosedExperiences.rows[i].id
					}
				});
			}
			//删除所有行
			for(var j =0;j<allExperiences.length;j++){
				var index = $('#Grid_choosedExperiences').datagrid('getRowIndex',allExperiences[j]);
				$('#Grid_choosedExperiences').datagrid('deleteRow',index);
			}

		});

		// 给取消按钮添加点击事件
		$("#btnCancel").on('click', function(){
			hideDialog();
		});
	});

	// 验证是否已经选择过某一资源
	function checkResourcesChoosed(resourcesId){
		var choosed = $("#Grid_choosedExperiences").datagrid("getData");
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
		var choosed = $("#Grid_choosedExperiences").datagrid("getData");
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
		var unchoosed = $("#Grid_UnchoosedExperiences").datagrid("getData");
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