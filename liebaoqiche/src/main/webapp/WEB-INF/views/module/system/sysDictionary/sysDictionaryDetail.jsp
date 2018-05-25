<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysDictionary</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<div class="datagrid-body" style=" overflow-x: hidden;">
	    		<table style="width: 100%;font-size:12px;" class="datagrid-btable detail-table">
    				<tr>
    					<td><div>字典名称</div></td>
						<td><div>${sysDictionary.name == ''|| sysDictionary.name ==null?'':sysDictionary.name}</div></td>
						<td><div>字典代码</div></td>
						<td><div>${sysDictionary.code =='' || sysDictionary.code ==null?'':sysDictionary.code}</div></td>
    				</tr>
    				<tr>
    					<td><div>字典分类</div></td>
						<td><div>${sysDictionary.type ==''|| sysDictionary.type ==null?'':sysDictionary.type}</div></td>
						<td><div>PARENT</div></td>
						<td><div>${sysDictionary.parent== '' || sysDictionary.parent==null?'':sysDictionary.parent}</div></td>
    				</tr>
    				<tr>
    					<td><div>排序号</div></td>
    					<td><div>${sysDictionary.orderNo == '' || sysDictionary.orderNo ==null?0:sysDictionary.orderNo}</div></td>
    					<td><div>是否删除</div></td>
    					<td><div>${sysDictionary.isDeleteName}</div></td>
    				</tr>
    				<tr>
    					<td><div>备注</div></td>
    					<td colspan="3" class="remarks"><div>${sysDictionary.remarks ==''||sysDictionary.remarks ==null?'':sysDictionary.remarks}</div></td>
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