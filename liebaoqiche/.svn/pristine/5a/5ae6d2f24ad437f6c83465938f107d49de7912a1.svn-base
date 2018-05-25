<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>UserCars</title>
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
	    						<input type="hidden" id="id" name="id" value="${userCars.id}">
	    						
	    						<c:choose>
	    							<c:when test="${userCars.userId!=null}">
	    							<input class="easyui-textbox" type="hidden" id="userId" name="userId" value="${userCars.userId}">
	    							<input class="easyui-textbox" required="true" id="username" name="username" value="${userCars.username}" labelWidth="100" label="用户名" 
	    									style="width: 90%;" editable="false">
	    							</c:when>
	    							<c:otherwise>
	    								<input class="easyui-combobox" required="true" id="userId" name="userId" value="${userCars.userId}" labelWidth="100" label="用户名" style="width: 90%;"
	    									data-options="
	    						 			url:'${ctx}/user/user/getUserList',
	    						 			method:'post',
									        textField:'username',
									        valueField:'id',
									        width:120,
									        mode:'remote',
											editable:true,
											hasDownArrow:false,
											limitToList:true,
									        prompt:'输入用户名自动匹配',
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
	    							</c:otherwise>
	    						</c:choose>
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="model" name="model" value="${userCars.model}" labelWidth="100" label="汽车型号"  data-options="prompt:'汽车型号',required:true,validType:['remarks','length[2,50]']"  style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td labelWidth="100" style="width: 50%; padding: 5px; text-align: center;">
	                        	<select id="type" name="type" class="easyui-combobox" required="true" data-options="required:true,valueField:'id', textField:'text', panelHeight:'auto',prompt:'汽车类型'" style="width: 90%;height:32px;" label="汽车类型" labelWidth="100">
	    							<option value="01" <c:if test="${userCars.type=='01'}">selected="selected"</c:if>>小型车</option>
	    							<option value="02" <c:if test="${userCars.type=='02'}">selected="selected"</c:if>>中型车</option>
	    							<option value="03" <c:if test="${userCars.type=='03'}">selected="selected"</c:if>>SUV</option>
								</select>
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="simNo" name="simNo" value="${userCars.simNo}" labelWidth="100" label="车载SIM卡号"  data-options="prompt:'车载SIM卡号',required:true,validType:['remarks','length[2,30]']" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox" id="iccid" name="iccid" value="${userCars.iccid}" labelWidth="100" label="ICCID"  data-options="prompt:'ICCID',required:true,validType:['remarks','length[2,25]']" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<c:choose>
	    							<c:when test="${userCars.engineNo!=null}">
			    						<input class="easyui-textbox" editable="false" id="engineNo" name="engineNo" value="${userCars.engineNo}" labelWidth="100" label="发动机编号"  data-options="prompt:'发动机编号',required:true,validType:['remarks','length[2,25]']" style="width: 90%;">
	    							</c:when>
	    							<c:otherwise>
			    						<input class="easyui-textbox" id="engineNo" name="engineNo" value="${userCars.engineNo}" labelWidth="100" label="发动机编号"  data-options="prompt:'发动机编号',required:true,validType:['remarks','length[2,25]']" style="width: 90%;">
	    							</c:otherwise>
	    						</c:choose>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<c:choose>
	    							<c:when test="${userCars.vinCode!=null}">
			    						<input class="easyui-textbox" editable="false" id="vinCode" name="vinCode" value="${userCars.vinCode}" labelWidth="100" label="车辆识别码"  data-options="prompt:'车辆识别码',required:true,validType:['remarks','length[2,25]']" style="width: 90%;">
	    							</c:when>
	    							<c:otherwise>
			    						<input class="easyui-textbox" id="vinCode" name="vinCode" value="${userCars.vinCode}" labelWidth="100" label="车辆识别码"  data-options="prompt:'车辆识别码',required:true,validType:['remarks','length[2,25]']" style="width: 90%;">
	    							</c:otherwise>
	    						</c:choose>
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox"  id="licensePlate" name="licensePlate" value="${userCars.licensePlate}" labelWidth="100" label="汽车牌照"  data-options="prompt:'汽车牌照',required:true,validType:['licensePlate','length[7,8]']" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<c:choose>
	    							<c:when test="${userCars.prodDate!=null}">
	    								<input class="easyui-datebox" id="prodDate" name="prodDate" value="${userCars.prodDate}" labelWidth="100" label="生产日期"  data-options="prompt:'生产日期',required:true" style="width: 90%;height: 30px" readonly="readonly">
	    							</c:when>
	    							<c:otherwise>
	    								<input class="easyui-datebox" id="prodDate" name="prodDate" value="${userCars.prodDate}" labelWidth="100" label="生产日期"  data-options="prompt:'生产日期',required:true" style="width: 90%;height: 30px">
	    							</c:otherwise>
	    						</c:choose>
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="easyui-textbox"  id="color" name="color" value="${userCars.color}" labelWidth="100" label="汽车颜色"  data-options="prompt:'汽车颜色',required:true,validType:['length[2,6]']" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
							<%-- <td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
								<textarea class="easyui-textbox" name="remarks" maxlength="200"
								          style="width: 95%; height: 80px;" labelWidth="100" label="备注"
								          data-options="validType:'length[1,200]',multiline:true,prompt:'备注',tipPosition:'bottom'">${userCars.remarks}</textarea>
							</td> --%>
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
				
				$("#btnSave").linkbutton('disable');
				
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/user/userCars/create':'${ctx}/user/userCars/update',
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
			
			$.extend($.fn.validatebox.defaults.rules, {
			    integer : {// 验证整数
		            validator : function(value) {
		                return /^[1-9]\d*$/i.test(value);
		            },
		            message : '无效的格式，请确认后输入！'
		        },
		        remarks : {// 验证备注
		        	validator : function(value) {
		        		 var canMatch=  /[@#\$%\^&\*]+/g.test(value);
		                 return !canMatch;
		            },
		            message : '这个不太友好，请检查后再输入吧。'		           
		        },
	        	checkName : {
					validator : function(value) {
						var userName = $("#username").val();
						var url = '${ctx}/user/user/checkName?username='+encodeURI(encodeURI(userName));
						var ret = $.ajax({url:url,async:false,cache:false,type:"post"}).responseText;
						return ret=='true';
					},
					message : '该用户名已存在'
				},
				licensePlate:{
					validator : function(value) {
						var xreg=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}(([0-9]{5}[DF]$)|([DF][A-HJ-NP-Z0-9][0-9]{4}$))/;
						var creg=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1}$/;
						if(value.length == 7){//普通蓝牌
							return creg.test(value);
						} else if(value.length == 8){//新能源
							return xreg.test(value);
						} else{
					 		return false;
					 	} 
					},
					message : '格式不正确！'
				}
			});
			
			$('#prodDate').datebox().datebox('calendar').calendar({
				validator: function(date){
					var now = new Date();
                    return date <= now;
				}
			});
		});
	</script>
</body>
</html>