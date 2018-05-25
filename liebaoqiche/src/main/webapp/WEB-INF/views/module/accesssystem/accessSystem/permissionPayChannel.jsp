
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>SysUser</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<style>
		.payChannel{
			padding: 10px 15px 0;
    		font-size: 16px;
		}
		.payChannel-input{
			padding: 8px 30px;
			font-size: 14px;
		}
		.payChannel-input>span{
			margin-right:10px;
			display:inline-block;
		}
		.payChannel-input>span>label{
			float: left;
			width:116px;
			text-align:center;
		    padding: 8px 10px;
		    border: 1px solid #ccc;
		    cursor:pointer;
		}
		
		.payChannel-input>span.active>label{
			border: 1px solid #264dbe;
			color:#264dbe;
			position:relative;
		}
		
		.payChannel-input>span>label>b{
			position: absolute;
		    top: 0;
		    right: 0;
		    display: block;
		    width: 0;
		    height: 0;
		    border-top: 25px solid #264dbe;
		    border-left: 25px solid transparent;
		    display:none;
		}
		
		.payChannel-input>span>label>b>i{
			position: absolute;
		    right: 0;
		    bottom: 0;
		    margin: auto;
		    display: block;
		    width: 15px;
		    height: 15px;
		    color: #fff;
		    margin-bottom: 10px;
		    font-size: 10px;
		    font-weight: normal;
		}
		
		.payChannel-input>span.active>label>b{
			display:block;
		}
		
		.payChannel-input>span>input{
			display:none;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp"%>
<div style="height: 500px;margin:10px 20px;box-sizing:border-box;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north', collapsible:false" title="当前操作系统信息"
		     style="height: 80px; line-height: 40px; padding: 0 10px;">
			系统名称：<span id="name">${systemSignName}</span>
			<input type="hidden" name="systemSign" id="systemSign" value="${systemSign}">
			<input type="hidden" name="systemSignName" id="systemSignName" value="${systemSignName}">
		</div>
		<div data-options="region: 'west', collapsible:false" title="请选择支付类型">
			<c:forEach items="${treeModel}" var="tm">
				<div class="payChannel">${tm.text}</div>
				<div class="payChannel-input">
					<c:forEach items="${tm.children}" var="child">
						<span <c:if test="${child.checked==true}"> class="active" </c:if> >
							<label for="${child.id}">${child.text}<b><i>✔</i></b></label>
							<input type="checkbox" name="payTypeId" <c:if test="${child.checked==true}"> checked="checked"</c:if> value="${child.id}" id="${child.id}">
						</span>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; padding: 5px;">
			<a id="btnSave_SysUserAccredit" class="easyui-linkbutton button-success"><i class="fa fa-wrench fa-lg"></i>&nbsp;&nbsp;保存</a>
			<a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
		</div>

	</div></div>
<!-- </div> -->

<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
<script type="text/javascript">
	require(['jquery','common'], function($){
		var systemSign = $("#systemSign").val();
		var systemSignName = $("#systemSignName").val();

		//授权按钮保存
		$('#btnSave_SysUserAccredit').click(function () {
			$.messager.confirm("分配确认","确认要给该系统进行支付渠道分配？",function(r){
				if(r){
					var payTypeId = ''; 
					var payType = document.getElementsByName('payTypeId'); 
					for(var i = 0; i < payType.length; i++){ 
						if(payType[i].checked){
							payTypeId += payType[i].value+',';
						}
					} 
					$.ajax({
						url: '${ctx}/accesssystem/accessSystem/accredit',
						data: {
							systemSign : systemSign,
							systemSignName : systemSignName,
							payTypeId : payTypeId
						},
						type: 'post',
						dataType: 'json',
						success: function (json) {
							if (json && json.rtnCode == '00000000') {
								$.messager.alert('提示', "分配成功", "success",function(){
									hideDialog();
								});
							} else {
								$.messager.alert('提示', json.rtnMsg, "error");
							}
						}
					});
				}
			});
		});
		
		//选择支付渠道点击事件
		$(".payChannel-input>span>label").on('click', function(){
			_this = $(this).parent();
			if(_this.hasClass("active")){
				_this.removeClass("active");
			}else{
				_this.addClass("active");
			}
		})
		
		// 给取消按钮添加点击事件
		$("#btnCancel").on('click', function(){
			hideDialog();
		});
	});
</script>
</body>
</html>