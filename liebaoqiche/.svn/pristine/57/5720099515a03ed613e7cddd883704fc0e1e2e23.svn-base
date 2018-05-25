<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>CardBuild</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
	    	<form id="DataForm" method="post">
	    		<table style="width: 100%;">
	    			<tbody>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="name" name="name" maxlength="200" required="true" value="${cardBuild.name}" labelWidth="100" label="卡券形式"
							           data-options="prompt:'卡券形式',
				    						validType:['length[1,14]','special']" style="width: 90%;">
	    					</td>
	    				</tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
								<textarea class="easyui-textbox" name="remarks" maxlength="1200"
						                   style="width: 95%; height: 80px;" labelWidth="100" label="备注"
						                   data-options="validType:'length[1,200]',multiline:true,prompt:'备注',tipPosition:'bottom'">${cardBuild.remarks}</textarea>
						    </td>
					    </tr>
	    				<tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="id" name="id" value="${cardBuild.id}" labelWidth="100" label="id" required="true" data-options="prompt:'id'" style="width: 90%;">
						    </td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="isDelete" name="isDelete" value="${cardBuild.isDelete}" labelWidth="100" label="是否删除；0未删除，1删除"  data-options="prompt:'是否删除；0未删除，1删除'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="creater" name="creater" value="${cardBuild.creater}" labelWidth="100" label="创建人"  data-options="prompt:'创建人'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="createTime" name="createTime" value="${cardBuild.createTime}" labelWidth="100" label="创建时间"  data-options="prompt:'创建时间'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="modifier" name="modifier" value="${cardBuild.modifier}" labelWidth="100" label="修改人"  data-options="prompt:'修改人'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="modifyTime" name="modifyTime" value="${cardBuild.modifyTime}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="version" name="version" value="${cardBuild.version}" labelWidth="100" label="版本"  data-options="prompt:'版本'" style="width: 90%;">
	    					</td>
	    				</tr>
	    			</tbody>
	    		</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
            <a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;"><i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存</a>
            <a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnSave").on('click', function(){
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/card/cardBuild/create':'${ctx}/card/cardBuild/update',
					onSubmit:function(){
						var flag = $(this).form('enableValidation').form('validate');
						if(flag){
							showMaskLayer();
						}
						return flag;
					},
					success: function(data){
						hideMaskLayer();
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success",function(){
								$("#btnSave").linkbutton('enable');
								hideDialog();
							});
						}else{
							$.messager.alert('提示', json.rtnMsg, "error",function(){
								$("#btnSave").linkbutton('enable');
							});
						}
					},
					error: function(){
						$("#btnSave").linkbutton('enable');
					}
				});
			});
			
			// 给保存按钮添加点击事件
			$("#btnCancel").on('click', function(){
				hideDialog();
			});
		});
	</script>
</body>
</html>