
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
		<div data-options="region: 'west', collapsible:false" title="未选卡券"
		     style="width: 350px;">
			<table id="Grid_UnchoosedCards" class="easyui-datagrid"
			       ctrlSelect="true" striped="true" rownumbers="true"
			       pagination="false" fitColumns="true" loadMsg="正在加载数据，请稍等..."
			       data-options="fit:true, checkOnSelect:true, selectOnCheck:true, border: false">
				<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'name',width:120">卡券名称</th>
					<th data-options="field:'id',hidden:true,width:150">卡券代码</th>
				</tr>
				</thead>
			</table>
		</div>
		<div class="btnLink" data-options="region:'center', border: false">
			<a id="btnRight_ActSelectCard" href="javascript:void(0)"
			   class="easyui-linkbutton button-default"><i
					class="fa fa-angle-right fa-lg"></i></a> <a
				id="btnDoubleRight_ActUserSelectCard" href="javascript:void(0)"
				class="easyui-linkbutton button-default"><i
				class="fa fa-angle-double-right fa-lg"></i></a> <a
				id="btnDoubleLeft_ActSelectCard" href="javascript:void(0)"
				class="easyui-linkbutton button-default"><i
				class="fa fa-angle-double-left fa-lg"></i></a> <a
				id="btnLeft_ActSelectCard" href="javascript:void(0)"
				class="easyui-linkbutton button-default"><i
				class="fa fa-angle-left fa-lg"></i></a>
		</div>
		<div data-options="region: 'east', collapsible:false" title="已有卡券"
		     style="width: 350px">
			<table id="Grid_choosedCards" class="easyui-datagrid"
			       ctrlSelect="true" striped="true" rownumbers="true"
			       pagination="false" fitColumns="true" loadMsg="正在加载数据，请稍等..."
			       data-options="fit:true, checkOnSelect:true, selectOnCheck:true, border: false">
				<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'name',width:120">卡券名称</th>
					<th data-options="field:'id',hidden:true,width:150">卡券代码</th>
				</tr>
				</thead>
			</table>
		</div>

		<div data-options="region:'south',border:false"
		     style="text-align: right; padding: 5px;">
			<a id="btnSave_ActUserAccredit"
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
				url: '${ctx}/activity/activityDetails/activityCard',
				data: {
					activityId: activityId
				},
				type: 'POST',
				dataType: 'JSON',
				success: function (json) {

					// 设置当前显示的活动名称
					$("#name").html(json.activityName);
					$("#Grid_UnchoosedCards").datagrid();
					$("#Grid_choosedCards").datagrid();
					// 显示未选中的角色
					if(json && json.activityDetailsUnChooseCardList){
						$("#Grid_UnchoosedCards").datagrid('loadData', json.activityDetailsUnChooseCardList);
					}

					// 显示已经选中的角色
					if(json && json.activityDetailsChooseCardList){
						$("#Grid_choosedCards").datagrid('loadData', json.activityDetailsChooseCardList);
					}

				}
			});
		});

		//关联按钮保存
		$('#btnSave_ActUserAccredit').click(function () {
			$.messager.confirm("关联确认","确认要给该活动进行关联？",function(r){
				if(r){
					var allChoosedCards = $("#Grid_choosedCards").datagrid('getData');
					var allCards = [];
					for(var i=0;i<allChoosedCards.rows.length;i++){
						allCards.push(allChoosedCards.rows[i]);
					}
					var allCardId = "";
					for(var i = 0; i < allCards.length; i++){
						allCardId += allCards[i].id;
						if(i != allCards.length - 1){
							allCardId += ",";
						}
					}

					$.ajax({
						url: '${ctx}/activity/activityDetails/accreditCard',
						data: {
							activityId : activityId,
							allCardsId : allCardId
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

		//点击插入选择的N个卡券
		$("#btnRight_ActSelectCard").click(function(){

			var selectedCards = $("#Grid_UnchoosedCards").datagrid('getSelections');
			var allSelectedCards = [];
			//插入行
			for(var i=0;i<selectedCards.length;i++){
				allSelectedCards.push(selectedCards[i]);
				$("#Grid_choosedCards").datagrid('insertRow', {
					row:{
						name : selectedCards[i].name ,
						code : selectedCards[i].code,
						id : selectedCards[i].id
					}
				});

			}
			//删除行
			for(var j =0;j<allSelectedCards.length;j++){
				var index = $('#Grid_UnchoosedCards').datagrid('getRowIndex',allSelectedCards[j]);
				$('#Grid_UnchoosedCards').datagrid('deleteRow',index);
			}
		});

		//点击插入选择所有卡券
		$("#btnDoubleRight_ActUserSelectCard").click(function(){

			var allUnchoosedCards = $("#Grid_UnchoosedCards").datagrid('getData');
			var allCards = [];
			//插入所有行
			for(var i=0;i<allUnchoosedCards.rows.length;i++){
				allCards.push(allUnchoosedCards.rows[i]);
				$("#Grid_choosedCards").datagrid('insertRow', {
					row:{
						name : allUnchoosedCards.rows[i].name ,
						code : allUnchoosedCards.rows[i].code,
						id : allUnchoosedCards.rows[i].id
					}
				});
			}
			//删除所有行
			for(var j =0;j<allCards.length;j++){
				var index = $('#Grid_UnchoosedCards').datagrid('getRowIndex',allCards[j]);
				$('#Grid_UnchoosedCards').datagrid('deleteRow',index);
			}

		});

		//点击移除选择的N行
		$("#btnLeft_ActSelectCard").click(function(){

			var selectedCards = $("#Grid_choosedCards").datagrid('getSelections');
			var allSelectedCards = [];
			//插入行
			for(var i=0;i<selectedCards.length;i++){
				allSelectedCards.push(selectedCards[i]);
				$("#Grid_UnchoosedCards").datagrid('insertRow', {
					row:{
						name : selectedCards[i].name ,
						code : selectedCards[i].code,
						id : selectedCards[i].id
					}
				});

			}
			//删除行
			for(var j =0;j<allSelectedCards.length;j++){
				var index = $('#Grid_choosedCards').datagrid('getRowIndex',allSelectedCards[j]);
				$('#Grid_choosedCards').datagrid('deleteRow',index);
			}
		});

		//点击移除选择的所有卡券
		$("#btnDoubleLeft_ActSelectCard").click(function(){

			var allChoosedCards = $("#Grid_choosedCards").datagrid('getData');
			var allCards = [];
			//插入所有行
			for(var i=0;i<allChoosedCards.rows.length;i++){
				allCards.push(allChoosedCards.rows[i]);
				$("#Grid_UnchoosedCards").datagrid('insertRow', {
					row:{
						name : allChoosedCards.rows[i].name ,
						code : allChoosedCards.rows[i].code,
						id : allChoosedCards.rows[i].id
					}
				});
			}
			//删除所有行
			for(var j =0;j<allCards.length;j++){
				var index = $('#Grid_choosedCards').datagrid('getRowIndex',allCards[j]);
				$('#Grid_choosedCards').datagrid('deleteRow',index);
			}

		});

		// 给取消按钮添加点击事件
		$("#btnCancel").on('click', function(){
			hideDialog();
		});
	});

	// 验证是否已经选择过某一资源
	function checkResourcesChoosed(resourcesId){
		var choosed = $("#Grid_choosedCards").datagrid("getData");
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
		var choosed = $("#Grid_choosedCards").datagrid("getData");
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
		var unchoosed = $("#Grid_UnchoosedCards").datagrid("getData");
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