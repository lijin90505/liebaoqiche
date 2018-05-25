<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title></title>
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
	    						<input type="hidden" name="id" id="id" value="${payChannel.id}">
	    						<input class="easyui-textbox" maxlength="100" required="true" id="payChannelName" name="payChannelName" value="${payChannel.payChannelName}" labelWidth="100" label="类型名称"
							           data-options="prompt:'类型名称',required:true,validType:['payChannelName','checkName','length[2,50]'],tipPosition:'top'" style="width: 90%;">
	    					</td>
    					</tr>
					    <tr>
						    <td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
							<textarea class="easyui-textbox" name="remarks" maxlength="1200"
							          style="width: 95%; height: 80px;" labelWidth="100" label="备注"
							          data-options="validType:'length[1,150]',multiline:true,prompt:'备注',tipPosition:'bottom'">${payChannel.remarks}</textarea>
						    </td>
					    </tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="creater" name="creater" value="${payChannel.creater}" labelWidth="100" label="创建人"  data-options="prompt:'创建人'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="createTime" name="createTime" value="${payChannel.createTime}" labelWidth="100" label="创建时间"  data-options="prompt:'创建时间'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="modifier" name="modifier" value="${payChannel.modifier}" labelWidth="100" label="修改人"  data-options="prompt:'修改人'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input class="" hidden="true" id="modifyTime" name="modifyTime" value="${payChannel.modifyTime}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
	    					</td>
	    				</tr>
    				 	<%-- <tr> 
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input hidden="true" class="easyui-textbox" id="creater" name="creater" value="${payChannel.creater}" labelWidth="100" label="创建人"  data-options="prompt:'创建人'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input hidden="true"  class="easyui-datetimebox" id="createTime" name="createTime" value="${payChannel.createTime}" labelWidth="100" label="创建时间"  data-options="prompt:'创建时间'" style="width: 90%;">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input hidden="true" class="easyui-textbox" id="updateBy" name="modifier" value="${payChannel.modifier}" labelWidth="100" label="修改人"  data-options="prompt:'修改人'" style="width: 90%;">
	    					</td>
	    					<td style="width: 50%; padding: 5px; text-align: center;">
	    						<input hidden="true"  class="easyui-datetimebox" id="updateDate" name="modifyTime" value="${payChannel.modifyTime}" labelWidth="100" label="修改时间"  data-options="prompt:'修改时间'" style="width: 90%;">
	    					</td>
	    				</tr>  --%>
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
						url:$("#id").val() == ''?'${ctx}/pay/payChannel/create':'${ctx}/pay/payChannel/update',
						onSubmit:function(){
							return $(this).form('enableValidation').form('validate');
						},
						success: function(data){
							var json = $.parseJSON(data);
							if(json.rtnCode == '00000000'){
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
			$("#btnCancel").on('click', function () {
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
		                 return /[@#\$%\^&\*]+/g.test(value);
		            },
		            message : '格式错误！'		           
		        },
		        payChannelName:{
	            	validator : function(value) {
		                return /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/.test(value);
		            },
		            message : '格式错误！'
		        },
		       	checkName:{
		        	validator : function(value) {
		                var haha = "";
		                $.ajax({
		                    type : 'post',
		                    async : false,
		                    url : '${ctx}/pay/payChannel/findByName',
		                    data : {
		                        "name" : value
		                    },
		                    success : function(data) {
		                        haha = data;
		                    }
		                });
		               	haha = eval(haha);
		                return haha;
		            },
		            message : '此名称已经被占用啦！'
		        }
			});
		});
	</script>
</body>
</html>