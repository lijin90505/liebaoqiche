<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>OutSystemLocalRecon</title>
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
    						${outSystemLocalRecon.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						订单号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.orderId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						支付系统流水号
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.transactionId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						对账类型;00微信;01支付宝;02银联
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.renconType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						对账日期:20180424
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.renconTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						账单类型;00支付成功;01退款
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.billType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						交易金额
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.tradeAmount}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						交易时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.tradeTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						支付类型
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.tradeType}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						支付状态
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.tradeState}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						对账状态;00成功；01失败
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.reconState}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						对账失败原因
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.failMessage}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.creater}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						创建时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.createTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改人
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.modifier}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						修改时间
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.modifyTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						备注
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${outSystemLocalRecon.remarks}
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
            <a id="btnCancel_OutSystemLocalRecon" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_OutSystemLocalRecon").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>