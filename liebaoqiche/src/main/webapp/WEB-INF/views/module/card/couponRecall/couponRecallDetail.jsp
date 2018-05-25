<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>CouponRecall</title>
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
    						id
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.id}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						coupon_name
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.couponName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						recall_num
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.recallNum}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						recall_user_id
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.recallUserId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						recall_username
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.recallUsername}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						sign_id
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.signId}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						sign_name
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.signName}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						creater
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.creater}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						create_time
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.createTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						modifier
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.modifier}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						modify_time
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.modifyTime}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						version
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.version}
    					</td>
    				</tr>
    				<tr>
    					<td style="width: 50%; padding: 5px;">
    						remark
    					</td>
    					<td style="width: 50%; padding: 5px;">
    						${couponRecall.remark}
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
            <a id="btnCancel_CouponRecall" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
        </div>
   	</div>
    
    <!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
	<script type="text/javascript">
		require(['jquery','common'], function($){
			// 给保存按钮添加点击事件
			$("#btnCancel_CouponRecall").on('click', function(){
				history.go(-1);
			});
		});
	</script>
</body>
</html>