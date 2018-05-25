<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>PayInfoConfig</title>
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
    						主键
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						微信公众号appid
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.appid}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.merchantId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户号code，定义好后不可更改，与商户号对应
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.merchantCode}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						商户号密钥
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.merchantKey}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						证书路径
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.keyStoreFile}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						证书密码
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.keyStorePassword}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						请求url
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.requestUrl}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						支付方式
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.tradeType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						回调地址，微信公众号不能带参数
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.notifyUrl}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						前置通知
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.backUrl}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						后置通知
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.frontUrl}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						公钥
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.publicKey}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						私钥
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.privateKey}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						是否删除；0未删除，1删除
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.isDelete}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.createBy}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.createDate}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.updateBy}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.updateDate}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						备注
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${payInfoConfig.remarks}
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
            <a id="btnCancel_PayInfoConfig" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_PayInfoConfig").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>