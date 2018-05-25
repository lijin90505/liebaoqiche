<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SystemCoupon</title>
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
				data-options="url:'${ctx}/card/systemCoupon/list',fit:true, fitColumns:true, checkOnSelect:true, selectOnCheck:true, border: false">
			    <thead>
			        <tr>
			            <th data-options="field:'ck',checkbox:true"></th>
			            <th data-options="field:'id',hidden:true">id</th>
			            <th data-options="field:'isDelete',hidden:true">是否删除；0未删除，1删除</th>
			            <th data-options="field:'couponId',hidden:true">卡券编号</th>
			            <th data-options="field:'accessSystemId',hidden:true">接入系统标识</th>
			            <th data-options="field:'accessSystemName'">系统名称</th>
			            <th data-options="field:'couponUsedRecordId',hidden:true">卡券使用记录编号</th>
			            <th data-options="field:'couponName'">卡券名称</th>
			            <th data-options="field:'couponContent'">卡券内容</th>
			            <th data-options="field:'startTime'">卡券开始时间</th>
			            <th data-options="field:'endTime'">卡券截止时间</th>
			            <th data-options="field:'couponCheckCode',hidden:true">卡券识别码</th>
			            <th data-options="field:'couponStatusDesc'">卡券状态</th>
			            <th data-options="field:'editStatusDesc'">卡券编辑状态</th>
			            <th data-options="field:'conponNum'">卡券预发数量</th>
			            <th data-options="field:'getCouponNum'">卡券领取数量</th>
			            <th data-options="field:'couponUsedNum'">卡券使用数量</th>
			            <th data-options="field:'maxGetConpouNum'">卡券最大领取数量</th>
			            <th data-options="field:'conpouSurplusNum'">卡券剩余数量</th>
			            <th data-options="field:'isAppointments'">是否需要预约</th>
			            <th data-options="field:'isAppointmentsDesc'">是否需要预约</th>
			            <th data-options="field:'mininumConsumption'">最低消费金额</th>
			            <th data-options="field:'singleUseRefund'">是否单次限用</th>
			            <th data-options="field:'singleUseRefundDesc'">是否单次限用</th>
			            <th data-options="field:'couponUrl'">卡券url</th>
			            <th data-options="field:'pictureUrl'">图片url</th>
			            <%--<th data-options="field:'systemSign'">系统标识编号</th>--%>
			            <th data-options="field:'systemSignName'">系统名称</th>
			            <%--<th data-options="field:'creater'">创建人</th>--%>
			            <%--<th data-options="field:'createTime'">创建时间</th>--%>
			            <%--<th data-options="field:'modifier'">修改人</th>--%>
			            <%--<th data-options="field:'modifyTime'">修改时间</th>--%>
			            <%--<th data-options="field:'version'">版本</th>--%>
			            <%--<th data-options="field:'remarks'">备注</th>--%>
			        </tr>
			    </thead>
			</table>
			<div id="Grid_Toolbar">
				<form id="searchForm">
					<shiro:hasPermission name="systemCoupon:query">
						<input class="easyui-textbox" name="couponName" data-options="prompt:'卡券名称'" size="25" style="width: 160px">
						<input class="easyui-combobox" id="couponStatus" name="couponStatus"
						       data-options="
									        url:'${ctx}/enumData/lieBao/EnumsCouponOpenStatus',
									        textField:'label',
									        width:160,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'卡券状态'">
						<input class="easyui-combobox" id="systemSign" name="systemSign"  label=""
						       data-options="
									        url:'${ctx}/accesssystem/accessSystem/accessSystems',
									        textField:'accessSystemName',
									        valueField:'id',
									        width:160,
									        panelHeight:'auto',
									        editable:false,
									        prompt:'系统名称'">
						<input class="easyui-datebox" id="startTime" name="startTime" labelWidth="100" data-options="prompt:'积分生效时间'" style="width: 160px">
						<input class="easyui-datebox" id="endTime" name="endTime" labelWidth="100" data-options="prompt:'积分失效时间'" style="width: 160px">
						<button id="btnSearch" class="easyui-splitbutton button-primary" data-options="menu:'#search_menu'">
							<i class="fa fa-search fa-lg"></i> 查询
						</button>
						<div id="search_menu" style="padding: 0;">
							<div id="reset_btn" data-options="iconCls:'fa fa-refresh fa-lg fa-fw'">清空查询</div>
						</div>
					</shiro:hasPermission>

					<div class="pull-right">
						<shiro:hasPermission name="systemCoupon:create">
					        <a id="btnCreate" href="javascript:void(0)" class="easyui-linkbutton button-success"><i class="fa fa-plus-circle fa-lg"></i>&nbsp;&nbsp;新增</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="systemCoupon:update">
					        <a id="btnUpdate" href="javascript:void(0)" class="easyui-linkbutton button-default"><i class="fa fa-pencil fa-lg"></i>&nbsp;&nbsp;修改</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="systemCoupon:delete">
					        <a id="btnDelete" href="javascript:void(0)" class="easyui-linkbutton button-danger"><i class="fa fa-minus-circle fa-lg"></i>&nbsp;&nbsp;删除</a>
						</shiro:hasPermission>

				    </div>
				</form>
		    </div>
		</div>
	</div>

    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给新增按钮添加点击事件
			$("#btnCreate").on('click', function(){
				showDialog('新增', '${ctx}/card/systemCoupon/add', 800, 500, function () {
					$('#Grid').datagrid('reload');
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
					showDialog('编辑', '${ctx}/card/systemCoupon/edit?id=' + selected[0].id, 800, 500, function () {
						$('#Grid').datagrid('reload');
					});
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
	                            url: '${ctx}/card/systemCoupon/delete',
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

			// 表单提交，获取查询条件重载表格数据
			$('#searchForm').submit(function () {
				$('#Grid').datagrid('reload', $('#searchForm').serializeObject());
				return false;
			});

			// 清空查询表单，重载表格数据
			$('#reset_btn').click(function () {
				$('#searchForm').form('reset').submit();
			});
		});
	</script>
</body>
</html>