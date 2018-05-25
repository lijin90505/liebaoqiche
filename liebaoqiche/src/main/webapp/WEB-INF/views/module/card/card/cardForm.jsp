<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
	<title>Card</title>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/include/loading.jsp" %>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'">
		<form id="DataForm" method="post">
			<table style="width: 100%;">
				<tbody>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-textbox" required="true" maxlength="100" id="name" name="name" value="${card.name}" labelWidth="100" label="卡券名称"
						       data-options="prompt:'卡券名称',
				    						validType:['length[1,14]','special']" style="width: 90%;">
					</td>
					<td style="width: 50px; padding: 5px;" rowspan="3">
						<input type="hidden" id="imageUrl" name="imageUrl" value="${card.imageUrl}">
						<div class="personPic">
							<c:set var="userHeader" value="${ctxResources}/images/user_act.png"/>
							<c:if test="${card.imageUrl != null && card.imageUrl != ''}">
								<c:set var="userHeader" value="${card.imageUrl}"/>
							</c:if>
							<img id="photoPicker" src="${userHeader}" style="width:150px;height: 90px;cursor: pointer;">
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="buildId" name="buildId" value="${card.buildId}" labelWidth="100" label="卡券生成形式" style="width: 90%;"
						       data-options="
									        url:'${ctx}/card/cardBuild/cardBuilds',
									        textField:'name',
									        valueField:'id',
									        width:120,
									        panelHeight:'280px',
									        editable:false,
									        prompt:'卡券生成形式'">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="getId" name="getId" value="${card.getId}" labelWidth="100" label="卡券领取形式" style="width: 90%;"
						       data-options="
									        url:'${ctx}/card/cardGet/cardGets',
									        textField:'name',
									        valueField:'id',
									        width:120,
									        panelHeight:'280px',
									        editable:false,
									        prompt:'卡券领取形式'">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" required="true" id="useId" name="useId" value="${card.useId}" labelWidth="100" label="卡券用途形式" style="width: 90%;"
						       data-options="
									        url:'${ctx}/card/cardUse/cardUses',
									        textField:'name',
									        valueField:'id',
									        width:120,
									        panelHeight:'280px',
									        editable:false,
									        prompt:'卡券用途形式'">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" maxlength="100" id="num" name="num" value="${card.num}" labelWidth="100" label="最大生成数量"
						       data-options="prompt:'最大生成数量',
				    						validType:['length[1,10]','special']" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" required="true" maxlength="100" id="numVinMax" name="numVinMax" value="${card.numVinMax}" labelWidth="100" label="单次领取数量"
						       data-options="prompt:'单次领取数量',
				    						validType:['length[1,10]','special']" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" maxlength="100" id="numTimeMax" name="numTimeMax" value="${card.numTimeMax}" labelWidth="100" label="领取次数上限"
						       data-options="prompt:'领取次数上限',
				    						validType:['length[1,10]','special']" style="width: 90%;">
					</td>
				</tr>
				<%-- <tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" id="effectiveDate" name="effectiveDate" editable="false" value="${card.effectiveDate}" labelWidth="100" label="卡券生效日期" data-options="prompt:'卡券生效日期'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-datebox" id="endDate" name="endDate" editable="false" value="${card.endDate}" labelWidth="100" label="卡券截止日期" data-options="prompt:'卡券截止日期'" style="width: 90%;">
					</td>
				</tr> --%>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-numberbox" id="expiryDays" name="expiryDays" maxlength="100" value="${card.expiryDays}" labelWidth="100" label="卡券有效期"
						       data-options="prompt:'输入值为天数',
				    						validType:['length[1,10]','special']" style="width: 90%;">
					</td>
					<%-- <td style="width: 50%; padding: 5px; text-align: center;">
						<input class="easyui-combobox" id="state" name="state" labelWidth="100"  value="${card.state}" label="卡券操作类别" style="width: 90%;"
						       data-options="
											        url:'${ctx}/enumData/lieBao/EnumsCouponOpenStatus',
											        textField:'label',
											        panelHeight:'auto',
											        editable:false,
											        prompt:'状态'">
					</td> --%>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
						<textarea class="easyui-textbox" id="content" name="content" maxlength="200"
						          style="width: 95%; height: 80px;" labelWidth="100" label="卡券内容"
						          data-options="validType:'length[1,200]',multiline:true,prompt:'卡券内容'">${card.content}</textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;" colspan="2">
						<textarea class="easyui-textbox" name="remarks" maxlength="1200"
						          style="width: 95%; height: 80px;" labelWidth="100" label="备注"
						          data-options="validType:'length[1,200]',multiline:true,prompt:'备注',tipPosition:'bottom'">${card.remarks}</textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="id" name="id" value="${card.id}" labelWidth="100" label="id" required="true" data-options="prompt:'id'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="isDelete" name="isDelete" value="${card.isDelete}" labelWidth="100" label="是否删除；0未删除，1删除" data-options="prompt:'是否删除；0未删除，1删除'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="creater" name="creater" value="${card.creater}" labelWidth="100" label="创建人" data-options="prompt:'创建人'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="createTime" name="createTime" value="${card.createTime}" labelWidth="100" label="创建时间" data-options="prompt:'创建时间'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="modifier" name="modifier" value="${card.modifier}" labelWidth="100" label="修改人" data-options="prompt:'修改人'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="modifyTime" name="modifyTime" value="${card.modifyTime}" labelWidth="100" label="修改时间" data-options="prompt:'修改时间'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="buildName" name="buildName" value="${card.buildName}" labelWidth="100" label="生成券名称" data-options="prompt:'生成券名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="getName" name="getName" value="${card.getName}" labelWidth="100" label="领取券名称" data-options="prompt:'领取券名称'" style="width: 90%;">
					</td>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="useName" name="useName" value="${card.useName}" labelWidth="100" label="卡券用途名称" data-options="prompt:'卡券用途名称'" style="width: 90%;">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; padding: 5px; text-align: center;">
						<input class="" hidden="true" id="version" name="version" value="${card.version}" labelWidth="100" label="版本" data-options="prompt:'版本'" style="width: 90%;">
					</td>
				</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div data-options="region:'south',border:false" style="text-align:right; padding:10px;">
		<a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;">
			<i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存
		</a>
		<a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;">
			<i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消
		</a>
	</div>
</div>

<div id="CropperDialog" class="easyui-dialog" closed="true"
     modal="true" title="图片裁剪"
     style="width: 760px; height: 450px;padding: 0 20px;">
	<div class="easyui-layout" data-options="fit:true" style="paddign:20px;">
		<div data-options="region:'north'" style="height: 50px; padding: 5px;border:none;">
			<form id="cropperUploadForm" action="${ctx }/card/card/uploadImage" enctype="multipart/form-data">
				<div class="user_updownload">
					<span class="user_updownload_btn">选择文件</span>
					<input class="user_updownload_file" id="cropperUpload" type="file"
					       accept="image/jpeg,image/png,image/gif,image/x-icon">
				</div>
			</form>
		</div>
		<div data-options="region:'east'" style="width: 150px;border:none;">
			<div id="cropperPreview" style="background:#f5fcff;border-radius:8px;width: 120px; height: 120px;margin-left:30px;"></div>
		</div>
		<div data-options="region:'center'" style="overflow: hidden;border:none;border-radius:8px;background:#f5fcff">
			<c:choose>
				<c:when test="${card.imageUrl != null && card.imageUrl != ''}">
					<img id="cropperImage" alt="" src="${userHeader}">
				</c:when>
				<c:otherwise>
					<img id="cropperImage" alt="" src="">
				</c:otherwise>
			</c:choose>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right; padding:5px;">
			<a id="cropperSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;">
				<i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存
			</a>
			<a id="cropperCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;">
				<i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消
			</a>
		</div>
	</div>
</div>

<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->
<link href="${ctxResources }/js/cropper/cropper.css" rel="stylesheet">
<script type="text/javascript">
	require(['jquery', 'cropper', 'common'], function ($) {
		var cropperImage = $("#cropperImage");

		// 初始化图片裁剪工具
		cropperImage.cropper({
			aspectRatio: 1,
			autoCropArea: 0.8,
			checkImageOrigin: true,
			viewMode: 1,
			ready: function (e) {
				var $clone = $(this).clone().removeClass('cropper-hidden');

				$clone.css({
					display: 'block',
					width: '100%',
					minWidth: 0,
					minHeight: 0,
					maxWidth: 'none',
					maxHeight: 'none'
				});

				$("#cropperPreview").css({
					width: '120px',
					height: '120px',
					overflow: 'hidden'
				}).html($clone);
			},
			crop: function (e) {
				var imageData = $(this).cropper('getImageData');
				var previewAspectRatio = e.width / e.height;

				var $preview = $("#cropperPreview");
				var previewWidth = $preview.width();
				var previewHeight = previewWidth / previewAspectRatio;
				var imageScaledRatio = e.width / previewWidth;

				$preview.height(previewHeight).find('img').css({
					width: imageData.naturalWidth / imageScaledRatio,
					height: imageData.naturalHeight / imageScaledRatio,
					marginLeft: -e.x / imageScaledRatio,
					marginTop: -e.y / imageScaledRatio
				});
			}
		});

		$("#cropperUpload").on("change", function () {
			if ($(this).val() != "") {
				var formData = new FormData();
				var imgSize = document.getElementById('cropperUpload').files[0].size;
				if (imgSize >1024*1024*1){
					$.messager.alert('提示', "图片大小不可大于1M", "info");
					$("#cropperSave").linkbutton('disable');
				}else {
					$("#cropperSave").linkbutton('enable');
				}
				formData.append('image', document.getElementById('cropperUpload').files[0]);
				formData.append('type', 'AVATAR');

				$.ajax({
					url: '${ctx}/card/card/uploadImage',
					type: 'POST',
					data: formData,
					dataType: 'json',
					cache: false,
					contentType: false,
					processData: false,
					success: function (json) {
						if (json.rtnCode != '00000000') {
							$.messager.alert('提示', json.message, 'error');
						} else {
							$("#cropperPreview").html('');
							$('#cropperImage').cropper('replace', json.rtnData);
						}
					}
				});
			}
		});

		$("#photoPicker").on("click", function () {
			$("#CropperDialog").dialog('open');
		});

		$("#cropperSave").on("click", function () {
			var croppedCanvas = cropperImage.cropper('getCroppedCanvas');
			$("#photoPicker").attr("src", croppedCanvas.toDataURL());
			$("#CropperDialog").dialog('close');
		});

		$("#cropperCancel").on("click", function () {
			$("#CropperDialog").dialog('close');
		});

		// 给保存按钮添加点击事件
		$("#btnSave").on('click', function () {
			// 若用户修改过图片，将新的图片数据放入到表单隐藏域中
			if ($("#photoPicker").attr("src").indexOf("data:image") != -1) {
				$("#imageUrl").val($("#photoPicker").attr("src"));
			}

			/* var effectiveDate = $("#effectiveDate").val().replace(/\-/g, "\/");
			var endDate = $("#endDate").val().replace(/\-/g, "\/"); */
			/* if (endDate >= effectiveDate) { */
				var imageUrl = $("#imageUrl");
				$("#DataForm").form('submit', {
					url: $("#id").val() == '' ? '${ctx}/card/card/create' : '${ctx}/card/card/update',
					onSubmit: function () {
						var flag = $(this).form('enableValidation').form('validate');
						if(flag){
							showMaskLayer();
						}
						return flag;
					},
					success: function (data) {
						hideMaskLayer();
						var json = $.parseJSON(data);
						if (json && json.rtnCode == '00000000') {
							$.messager.alert('提示', "保存成功", "success",function(){
								$("#btnSave").linkbutton('enable');
								hideDialog();
							});
						} else {
							$.messager.alert('提示', json.rtnMsg, "error",function(){
								$("#btnSave").linkbutton('enable');
							});
						}
					},
					error: function () {
						$("#btnSave").linkbutton('enable');
					}
				});
			/* } else {
				$.messager.alert('提示', "截止时间不可小于生效时间", "error");
				$("#btnSave").linkbutton('enable');
			} */
		});

		// 给保存按钮添加点击事件
		$("#btnCancel").on('click', function () {
			hideDialog();
		});

		//头像上传
		$("#DataForm").on('change', "#avatar-file", function () {
			var formData = new FormData();
			formData.append('file', this.files.item(0));
			formData.append('type', "AVATAR");
			$.ajax({
				url: '${ctx}/system/sysUser/uploadPic',
				type: 'POST',
				data: formData,
				cache: false,
				contentType: false,
				processData: false,
				success: function (data) {
					json = eval('(' + data + ')');
					if (json.code == '000002') {
						$.messager.alert('提示', json.message, "error");
					}
					$("#imghead").attr("src", json.path);
					$("#photo").val(json.path);
				}
			});
		});
	});
</script>
</body>
</html>