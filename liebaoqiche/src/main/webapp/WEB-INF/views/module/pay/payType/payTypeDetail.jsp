<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>PayType</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
    		<table style="width: 100%;font-size:12px;" class="datagrid-btable detail-table">
   				<tr>
					<td><div>支付渠道名称</div></td>
					<td><div>${payType.payChannelId == ''|| payType.payChannelId ==null?'':payType.payChannelId}</div></td>
				</tr>
   				<tr>
					<td><div>支付类型编码</div></td>
					<td><div>${payType.payType == ''|| payType.payType ==null?'':payType.payType}</div></td>
					<td><div>支付类型名称</div></td>
					<td><div>${payType.payName == '' || payType.payName ==null?'':payType.payName}</div></td>
				</tr>
				<tr>
					<td><div>创建人</div></td>
					<td><div>${payType.createBy == '' || payType.createBy ==null?'':payType.createBy}</div></td>
					<td><div>创建时间</div></td>
					<td><div><fmt:formatDate value="${payType.createDate == '' || payType.createDate ==null?'':payType.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></div></td>
				</tr>
				<tr>
					<td><div>修改人</div></td>
					<td><div>${payType.updateBy == '' || payType.updateBy ==null?'':payType.createBy}</div></td>
					<td><div>修改时间</div></td>
					<td><div><fmt:formatDate value="${payType.updateDate == '' || payType.updateDate ==null?'':payType.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" /></div></td>
				</tr>
				<tr>
					<td><div>备注</div></td>
					<td colspan="3" class="remarks"><div>${payType.remarks ==''|| payType.remarks ==null?'':payType.remarks}</div></td>
				</tr>
    		</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
        	 <a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				hideDialog();
			});
		});
	</script>
</body>
</html>