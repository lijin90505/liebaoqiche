<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysExpRule</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
    		<table style="width: 100%;">
    			<tbody>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						主键UUID
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						经验值累积规则ID
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.expRuleId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						接入系统标识
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.outSystemId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						接入系统名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.outSystemName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						记录时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.createTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.modifyTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人ID
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.createUserId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.createUserName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人ID
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.modifyUserId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人名称
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${sysExpRule.modifyUserName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						<label class="label-top">备注:</label>
    						<input class="easyui-textbox" name="remarks" style="width:99.5%; height:80px;" data-options="multiline:true">
    					</td>
    				</tr>
    			</tbody>
    		</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
            <a id="btnCancel_SysExpRule" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_SysExpRule").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>