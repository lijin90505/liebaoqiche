<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>UserExperienceEdit</title>
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
						    	<input class="easyui-combobox" id="userId" name="userId" required="true" labelWidth="100" label="用户姓名" style="width: 90%;height:30px;"
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
							   <input class="easyui-combobox" id="carId" name="vinNo" value="" required="true" labelWidth="100" label="车架号" style="width: 90%;"
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
							    <input class="easyui-combobox" id="type" name="type" required="true" labelWidth="100" label="类型" style="width:90%;"
					       					data-options="
											        url:'${ctx}/enumData/lieBao/pointRuleType',
											        textField:'label',
											        panelHeight:'auto',
											        editable:false,
											        prompt:'经验值类型'">
						    </td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
							    <input class="easyui-numberbox" maxlength="11" required="true" id="consumeNum" name="consumeNum"  labelWidth="100" label="经验值"
				    						data-options="prompt:'经验值',
				    						validType:['length[1,10]']" style="width: 90%;">
						    </td>
	    				</tr>
	    				<!-- <tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
	    													<textarea class="easyui-textbox" name="remarks"
									style="width: 95%; height: 80px;" labelWidth="70" label="备注"
									data-options="validType:'length[1,300]',prompt:'备注'"></textarea>
	    					</td>
	    				</tr> -->
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
		                    		data.push({"id":userCarsList[i].vinCode,"text":userCarsList[i].vinCode});
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
				var num=$('#consumeNum').val();
				if(num<0){
					$.messager.alert('提示', "经验值不能为负数！", "info");
					return;
				}
				
				$("#btnSave").linkbutton('disable');
			
				$("#DataForm").form('submit',{
					url:'${ctx}/experience/userExperience/operation',
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
							$.messager.alert('提示', "操作成功", "success",function(){
								$("#btnSave").linkbutton('enable');
								hideDialog(); 
							});
						}else{
							$.messager.alert('提示', json.rtnMsg, "error");
							$("#btnSave").linkbutton('enable');
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