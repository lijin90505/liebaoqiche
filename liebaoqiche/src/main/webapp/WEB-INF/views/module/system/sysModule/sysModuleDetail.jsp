<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysModule</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<div class="datagrid-body" style=" overflow-x: hidden;">
				<table style="width: 100%;font-size:12px;" class="datagrid-btable detail-table">
					<tr>
						<td><div>模块名称</div></td>
						<td><div>${sysModule.name ==''|| sysModule.name ==null?'':sysModule.name}</div></td>
						<td><div>模块代码</div></td>
						<td><div>${sysModule.code ==''|| sysModule.code ==null?'':sysModule.code}</div></td>
					</tr>
					<tr>
<!-- 						<td><div>模块类型</div></td> -->
<%-- 						<td><div>${sysModule.type ==''|| sysModule.type ==null?'无':sysModule.typeName}</div></td> --%>
						<td><div>是否删除</div></td>
						<td><div>${sysModule.isDeleteName ==''|| sysModule.isDeleteName  ==null?'':sysModule.isDeleteName }</div></td>
						<td><div>模块地址</div></td>
						<td><div>${sysModule.path ==''|| sysModule.path ==null?'':sysModule.path}</div></td>
					</tr>
					<tr>
						<%-- <td><div>上级模块</div></td>
						<td><div>${sysModule.parentName}</div></td> --%>
						<td><div>模块图标</div></td>
						<td><div><i class="fa ${sysModule.icon ==''|| sysModule.icon ==null?'':sysModule.icon} fa-lg"></i></div></td>
						<td><div>排序号</div></td>
						<td><div>${sysModule.orderNo  ==''|| sysModule.orderNo ==null?'':sysModule.orderNo}</div></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td><div>是否删除</div></td> -->
<%-- 						<td colspan="3"><div>${sysModule.isDeleteName ==''|| sysModule.isDeleteName  ==null?'无':sysModule.isDeleteName }</div></td> --%>
<!-- 					</tr> -->
					<tr>
						<td><div>备注</div></td>
						<td class="remarks" colspan="3"><div>${sysModule.remarks ==''|| sysModule.remarks  ==null?'':sysModule.remarks}</div></td>
					</tr>
				</table>
			</div>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
            <a id="btnClose" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;关闭</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给关闭按钮添加点击事件
			$("#btnClose").on('click', function(){
				hideDialog();
			});
		});
	</script>
</body>
</html>