<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>CardOperation</title>
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
							    <input class="easyui-combobox" required="true" id="systemId" name="systemId" value="${cardOperation.systemId}" labelWidth="100" label="系统名称" style="width: 90%;"
							           data-options="
											        url:'${ctx}/accesssystem/accessSystem/accessSystems',
											        textField:'name',
											        valueField:'id',
											        width:120,
											        panelHeight:'300px',
											        editable:false,
											        prompt:'系统名称'">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
						    	<input class="easyui-textbox" id="dealerId" name="dealerId" maxlength="200" required="true" value="" labelWidth="100" label="经销商"
							           data-options="prompt:'经销商',
				    						validType:['length[1,14]','special']" style="width: 90%;">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
							     <input class="easyui-combobox" required="true" id="userId" name="userId" value="${cardOperation.userId}" labelWidth="100" label="用户姓名" style="width: 90%;height:32px;line-height:32px;"
							           data-options="
	    						 			url:'${ctx}/user/user/getUserListByRealName',
	    						 			method:'post',
									        textField:'realname',
									        valueField:'id',
									        width:120,
									        mode:'remote',
											editable:true,
											hasDownArrow:false,
											limitToList:true,
									        prompt:'输入姓名自动匹配',
									        onBeforeLoad: function(param){
												if(param == null || param.q == null || param.q.replace(/ /g, '') == ''){
													var value = $(this).combobox('getValue');
													if(value){
														param.id = value;
														return true;
													}			
													return false;
												}
											}" >
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							   <input class="easyui-combobox" id="carId" name="carId" required="true" value="" labelWidth="100" label="车架号" style="width: 90%;"
						       			data-options="
											        url:'${ctx}/user/user/carVins',
											        textField:'text',
											        valueField:'id',
											        width:120,
											        panelHeight:'300px',
											        editable:false,
											        prompt:'车架号'">
						    </td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-combobox" required="true" id="cardId" name="cardId" value="${cardOperation.cardId}" labelWidth="100" label="卡券名称" style="width: 90%;"
							           data-options="
											        url:'${ctx}/card/card/cards',
											        textField:'name',
											        valueField:'id',
											        width:120,
											        panelHeight:'300px',
											        editable:false,
											        prompt:'卡券名称'">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-numberbox" id="grantNum" name="grantNum" maxlength="200" required="true" value="${cardOperation.grantNum}" labelWidth="100" label="发放数量"
							           data-options="prompt:'发放数量',
				    						validType:['length[1,10]','special']" style="width: 90%;">
	    					</td>
	    					
						  <%--   <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-combobox" required="true" id="grantOrRecall" name="grantOrRecall" value="${cardOperation.grantOrRecall}" labelWidth="100" label="卡券操作类别" style="width: 90%;"
							           data-options="
											        url:'${ctx}/enumData/lieBao/EnumCardGrantOrRecall',
											        textField:'label',
											        width:160,
											        panelHeight:'auto',
											        editable:false,
											        prompt:'卡券操作类型'">
						    </td> --%>
	    				</tr>
	    				<%-- <tr>
	    				
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-numberbox" id="recallNum" name="recallNum" maxlength="255" value="${cardOperation.recallNum}" labelWidth="100" label="撤回数量"
							           data-options="prompt:'撤回数量',
				    						validType:['length[1,10]','special']" style="width: 90%;">
						    </td>
	    				</tr> --%>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
								<textarea class="easyui-textbox" name="remarks" maxlength="1200"
								          style="width: 95%; height: 80px;" labelWidth="100" label="备注"
								          data-options="validType:'length[1,200]',multiline:true,prompt:'备注',tipPosition:'bottom'">${user.remarks}</textarea>
						    </td>
					    </tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" required="true" maxlength="100" id="systemName" name="systemName" value="${cardOperation.systemName}" labelWidth="100" label="系统名称"  data-options="prompt:'系统名称'" style="width: 90%;">
						    </td>
						    <td>
							    <input class="" hidden="true" id="cardName" name="cardName" required="true" maxlength="100" value="${cardOperation.cardName}" labelWidth="100" label="卡券名称"  data-options="prompt:'卡券名称'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="userName" required="true" maxlength="20" name="userName" value="${cardOperation.userName}" labelWidth="100" label="用户名称"  data-options="prompt:'用户名称'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="systemId" name="systemId" value="${cardOperation.systemId}" labelWidth="100" label="系统标识"  data-options="prompt:'系统标识'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="userId" name="userId" value="${cardOperation.userId}" labelWidth="100" label="发放用户编号"  data-options="prompt:'发放用户编号'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="id" name="id" value="${cardOperation.id}" labelWidth="100" label="id" required="true" data-options="prompt:'id'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="isDelete" name="isDelete" value="${cardOperation.isDelete}" labelWidth="100" label="是否删除；0未删除，1删除"  data-options="prompt:'是否删除；0未删除，1删除'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="creater" name="creater" value="${cardOperation.creater}" labelWidth="100" label="创建人"  data-options="prompt:'创建人'" style="width: 90%;">
						    </td>
					    </tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="createTime" name="createTime" value="${cardOperation.createTime}" labelWidth="100" label="创建时间"  data-options="prompt:'创建时间'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="modifier" name="modifier" value="${cardOperation.modifier}" labelWidth="100" label="修改人"  data-options="prompt:'修改人'" style="width: 90%;">
						    </td>
					    </tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="modifyTime" name="modifyTime" value="${cardOperation.modifyTime}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
						    </td>
						    <td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="" hidden="true" id="version" name="version" value="${cardOperation.version}" labelWidth="100" label="版本"  data-options="prompt:'版本'" style="width: 90%;">
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
			//根据用户名选择用户车架号
			$('#userId').combobox({  
			    onChange: function(value) {
				var userId = $("#userId").textbox("getValue");
					if(userId.trim() != ''){
						
						$.ajax({
		                    url: '${ctx}/user/user/carVins',
		                    data: {
		                    	userId: userId
		                    },
		                    type: 'post',
		                    dataType: 'json',
		                    success: function (json) {
		                    	var userCarsList = json.userCarsList;
		                    	
		                    	var data,json;
								data = [];
		                    	for (var i = 0; i < userCarsList.length; i++) {
		                    		data.push({"id":userCarsList[i].id,"text":userCarsList[i].vinCode});
								}
		                    	$("#carId").combobox({editable:false});
								$("#carId").combobox({data:data});
		                    }		
		            	});
					}
			    }
			});
			
			
			// 给保存按钮添加点击事件
			$("#btnSave").on('click', function(){
				
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/card/cardOperation/create':'${ctx}/card/cardOperation/update',
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