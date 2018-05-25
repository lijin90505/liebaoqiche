<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>card</title>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'">
		<div class="datagrid-body" style=" overflow-x: hidden;">
			<table style="width: 100%;font-size:12px;" class="datagrid-btable detail-table">
				<tr>
					<td><div>卡券用途</div></td>
					<td><div>${card.name == ''|| card.name ==null?'':card.name}</div></td>
					<td colspan="2" rowspan="3" style="background: #fff;">
						<div class="personPic">
							<c:set var="userHeader" value="${ctxResources}/images/user_act.png"/>
							<c:if test="${card.imageUrl != null && card.imageUrl != ''}">
								<c:set var="userHeader" value="${card.imageUrl}"/>
							</c:if>
							<img id="photoPicker" src="${userHeader}" style="width: 150px; height: 90px; ">
						</div>
					</td>
				</tr>
				<tr>
					<td><div>生成券名称</div></td>
					<td><div>${card.buildName == ''|| card.buildName ==null?'':card.buildName}</div></td>
				</tr>
				<tr>
					<td><div>领取券名称</div></td>
					<td><div>${card.getName == '' || card.getName ==null?0:card.getName}</div></td>
				</tr>
				<tr>
					<td><div>卡券用途名称</div></td>
					<td><div>${card.useName == ''|| card.useName ==null?'':card.useName}</div></td>
					<td><div>最大生成数量</div></td>
					<td><div>${card.num == '' || card.num ==null?0:card.num}</div></td>
				</tr>
				<tr>
					<td><div>单次领取数量</div></td>
					<td><div>${card.numTimeMax == ''|| card.numTimeMax ==null?'':card.numTimeMax}</div></td>
					<td><div>领取次数上限</div></td>
					<td><div>${card.numVinMax == '' || card.numVinMax ==null?0:card.numVinMax}</div></td>
				</tr>
				<%-- <tr>
					<td><div>卡券生效时间</div></td>
					<td><div>${card.effectiveDate == ''|| card.effectiveDate ==null?'':card.effectiveDate}</div></td>
					<td><div>卡券截止时间</div></td>
					<td><div>${card.endDate == '' || card.endDate ==null?0:card.endDate}</div></td>
				</tr> --%>
				<tr>
					<td><div>卡券有效期</div></td>
					<td><div>${card.expiryDays == '' || card.expiryDays ==null?'永久有效':card.expiryDays}</div></td>
				</tr>
				<tr>
					<td><div>创建人</div></td>
					<td><div>${card.creater == '' || card.creater ==null?0:card.creater}</div></td>
					<td><div>创建时间</div></td>
					<td><div><fmt:formatDate value="${card.createTime == '' || card.createTime ==null?0:card.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</div></td>
				</tr>
				<tr>
					<td><div>修改人</div></td>
					<td><div>${card.modifier == '' || card.modifier ==null?0:card.modifier}</div></td>
					<td><div>修改时间</div></td>
					<td><div><fmt:formatDate value="${card.modifyTime == '' || card.modifyTime ==null?0:card.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</div></td>
				</tr>
				<tr>
					<td><div>卡券内容</div></td>
					<td colspan="3" class="remarks"><div>${card.content ==''||card.content ==null?'':card.content}</div></td>
				</tr>
				<tr>
					<td><div>备注</div></td>
					<td colspan="3" class="remarks"><div>${card.remarks ==''||card.remarks ==null?'':card.remarks}</div></td>
				</tr>
			</table>
		</div>
	</div>
	<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
		<a id="btnClose" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;关闭</a>
	</div>
</div>

<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
<script type="text/javascript">
	require(['jquery','common'], function($){
		// 给关闭按钮添加点击事件
		$("#btnClose").on('click', function(){
			hideDialog();
		});
	});
</script>
</body>
</html>