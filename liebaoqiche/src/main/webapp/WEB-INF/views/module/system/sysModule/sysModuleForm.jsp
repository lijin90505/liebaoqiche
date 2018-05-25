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
	    	<form id="DataForm" method="post">
	    		<input type="hidden" id="id" name="id" value="${sysModule.id}">
	    		<input type="hidden" id="parent" name="parent" value="${sysModule.parent}">
	    		<input type="hidden" id="parentKey" name="parentKey" value="${sysModule.parentKey}">
	    		<table style="width: 100%;">
	    			<tbody>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-textbox" id="name" name="name" value="${sysModule.name}" labelWidth="100" label="模块名称" required="true" data-options="validType:['length[1,50]','special','menuName'],prompt:'模块名称'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-numberbox" id="orderNo" name="orderNo" value="${sysModule.orderNo}" labelWidth="100" label="排序号" required="true" data-options="validType:'length[1,10]',prompt:'排序号'" style="width: 90%;">
	    						<input type="hidden" name="type" value="2">
	    					</td>
<!-- 	    					<td style="width: 50%; padding: 5px;"> -->
<%-- 	    						<input class="easyui-combobox" id="type" value="${sysModule.type}" name="type" labelWidth="100" label="模块类型"  required="true" style="width: 90%;" --%>
<%-- 										data-options=" --%>
<%-- 												url:'${ctx}/enumData/moduleType', --%>
<!-- 												method:'post', -->
<!-- 												valueField:'value', -->
<!-- 												textField:'label', -->
<!-- 												panelHeight:'auto', -->
<!-- 												editable:false, -->
<!-- 												prompt:'模块类型' -->
<%-- 										"> --%>
<!-- 	    					</td> -->
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-textbox" id="path" name="path" value="${sysModule.path}" labelWidth="100" label="模块地址"  data-options="validType:['length[0,50]','path'],prompt:'模块地址'" style="width: 90%;">
	    					</td>
	    					<%-- <td style="width: 50%; padding: 5px;">
	    						<input class="easyui-combobox" id="parent" name="parent" value="${sysModule.parent}" labelWidth="100" label="上级模块" style="width: 100%;"
									data-options="valueField:'id',textField:'text',prompt:'上级模块'">
	    					</td> --%>
	    					<td style="width: 50%; padding: 5px;">
	    						<select id="icon" name="icon" labelWidth="100" value="${sysModule.icon}" label="模块图标" data-options="validType:'length[0,50]',prompt:'模块图标'" style="width: 80%; height: 32px;"></select>
	    						<span id="iconShow" class="fa ${sysModule.icon} fa-lg" style="line-height: 24px;"></span>
	    						<div id="menuIcon" style="height: 100%;">
	    							<%@ include file="/WEB-INF/views/common/chooseIcon.jsp"%>
	    						</div>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px;">
	    						<input class="easyui-textbox" id="code" name="code" value="${sysModule.code}" labelWidth="100" label="模块代码"  data-options="validType:['length[0,50]','special'],prompt:'模块代码'" style="width: 90%;">
	    					</td>
	    				</tr>
    					<c:if test="${sysModule != null && sysModule.id != null}">
    						<tr>
	    						<td colspan="2" class="remarks" style="padding: 5px;">
	    							<input class="easyui-combobox" id="isDelete" value="${sysModule.isDelete}" name="isDelete" labelWidth="100" label="是否删除"  required="true" style="width: 95%;"
										data-options="
												url:'${ctx}/enumData/isDelete',
												method:'post',
												valueField:'value',
												textField:'label',
												panelHeight:'auto',
												editable:false,
												prompt:'是否删除'
										">
		    					</td>
	    					</tr>
    					</c:if>
	    				<tr>
	    					<td colspan="2" class="remarks" style="padding: 5px;">
	    						<input class="easyui-textbox" name="remarks" value="${sysModule.remarks}" style="width:95%; height:80px;" labelWidth="100" label="备注"  data-options="validType:'length[0,150]',prompt:'备注',tipPosition:'top'" multiline="true">
	    					</td>
	    				</tr>
	    			</tbody>
	    		</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:left; padding:5px 10px;">
            <a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;"><i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存</a>
            <a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			
			// 将图标按钮内容加入到combo的panel中, 并绑定点击时间
			$('#icon').combo({ editable:false, panelWidth: 280 });
			$("#menuIcon").appendTo($("#icon").combo("panel"));
			$("#menuIcon i").on("click", function(){
				var v = $(this).attr("class").replace("fa ","").replace(" fa-lg","");
				$('#iconShow').attr("class", "fa " + v + " fa-lg");
				$('#icon').combo("setValue", v).combo("setText", v).combo("hidePanel");
			});
			
			// 给保存按钮添加点击事件
			$("#btnSave").on('click', function(){
				
				$("#DataForm").form('submit',{
					url:$("#id").val() == ''?'${ctx}/system/sysModule/create':'${ctx}/system/sysModule/update',
					onSubmit:function(){
						if($(this).form('enableValidation').form('validate')){
							$("#btnSave").linkbutton('disable');
							return true;
						}
						return false;
					},
					success: function(data){
						var json = $.parseJSON(data);
						if(json && json.rtnCode == '00000000'){
							$.messager.alert('提示', "保存成功", "success",function(){
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
			
			// 给取消按钮添加点击事件
			$("#btnCancel").on('click', function(){
				hideDialog();
			});
			
			//拓展地址验证
			$.extend($.fn.validatebox.defaults.rules, {  
				path: {    
			        validator: function(value){    
			            return  /^[/][a-zA-Z|/]*$/.test(value);   
			        },    
			        message: '格式不正确，模块地址必须以/开头，并只能输入英文字符'   
			    },
			    menuName :{
			    	validator: function(value){ 
			    		var flag="true";
			    		var nametemp = '${sysModule.name}';
			    		if(value != nametemp) {
                    	$.ajax({
                   		async : false,
                   		cache : false,
                        type : 'post',
                        url : '${ctx}/system/sysModule/validName',   
                        data : {      
                        	parent:'${sysModule.parent}',
                        	name:value,
                        	id:'${sysModule.id}'
                        },
                        success : function(data) {
                        	flag=data;
                        },
   				});
			    		}
                    	return flag;
			    	},
			    	message: '该名称已存在，请重新输入' 
			    } 
			});
		});
	</script>
</body>
</html>