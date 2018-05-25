<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
<title>SysUser</title>
<style>
	input{
		height:30px!important;
		line-height:30px!important;
	}
</style>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<form id="DataForm" method="post" enctype="multipart/form-data">
				<input type="hidden" id="id" name="id" value="${sysUser.id}">
				<input type="hidden" id="photoData" name="photoData">
				<table style="width: 100%;">
					<tbody>
		    		  	<tr>
		    		  		<td style="width: 33%; padding: 5px; text-align: center;">
								<input class="easyui-textbox" id="realname" name="realname"
									value="${sysUser.realname}" labelWidth="70" label="真实姓名"
									placeholder="真实姓名" required="true"
									data-options="validType:['length[1,16]','special'],prompt:'真实姓名'"
									style="width: 90%;">
							</td>
							<td style="width: 33%; padding: 5px;" rowspan="4">
								<div class="personPic" style="width: 120px;text-align:center;">
									<c:set var="userHeader" value="${ctxResources}/images/user_photo.png" />
									<c:if test="${sysUser.photo != null && sysUser.photo != ''}">
										<c:set var="userHeader" value="${sysUser.photo}" />
									</c:if>
									<img id="photoPicker" src="${userHeader}" style=" border: 1px solid #ccc; width: 90px; height: 90px; cursor: pointer;"><br>
									点击设置头像
								</div>
							</td>
		    		  	</tr>
		    		  	<tr>
		    		  		<td style="width: 33%; padding: 5px; text-align: center;">
			    		  		<select class="easyui-combobox" id="sex" name="sex" value=""
									labelWidth="70" label="性别" placeholder="性别" required="true"
									data-options="url:'${ctx}/enumData/userSex',
										method:'post',
										onLoadSuccess:function(data){ 
											if($('#id').val() == '')
											$('#sex').combobox('setValue',0);
										},
										value:'${sysUser.sex}',
										textField:'label',
										panelHeight:'auto',
										editable:false" style="width: 90%;">
								</select>
							</td>
						</tr>	
		    		  	<tr>
		    		  		<td style="width: 34%; padding: 5px; text-align: center;">
								<input class="easyui-datebox" id="birthday" name="birthday"
									labelWidth="70" label="生日" 
									placeholder="生日" data-options="prompt:'生日',editable:false, value:'${sysUser.birthdayStr}'"
									style="width: 90%;" validtype="birthday"
									invalidMessage="生日日期不能超过当前日期">
							</td>
		    		  	</tr>
		    		  	<tr>
		    		  		<td style="width: 33%; padding: 5px; text-align: center;">
								<input class="easyui-textbox" id="cardNo" name="cardNo"
									value="${sysUser.cardNo}" labelWidth="70" label="身份证号"
									placeholder="身份证号" data-options="prompt:'身份证号'"
									style="width: 90%;" validtype="idcard" 
									invalidMessage="身份证号格式不正确">
							</td>
		    		  	</tr>
						<tr>
							<td style="width: 34%; padding: 5px; text-align: center;">
								<input class="easyui-textbox" id="mobile" name="mobile"
									value="${sysUser.mobile}" labelWidth="70" label="移动电话" 
									placeholder="移动电话" data-options="validType:['mobile'],prompt:'移动电话',prompt:'移动电话'"
									style="width: 90%;">
							</td>
							<td style="width: 33%; padding: 5px; text-align: center;">
		    		  			<input class="easyui-textbox" id="phone" name="phone"
									value="${sysUser.phone}" labelWidth="70" label="固定电话"
									placeholder="固定电话" data-options="prompt:'固定电话  格式027-12345678'"
									style="width: 90%;" validtype="telePhone" 
									invalidMessage="固定电话格式不正确">
							</td>
		    		  	</tr>
		    		  	<tr>
							<td style="width: 33%; padding: 5px; text-align: center;">
								<input class="easyui-textbox" id="qq" name="qq" value="${sysUser.qq}"
									labelWidth="70" label="QQ号码" placeholder="QQ号码" 
									data-options="validType:['length[5,16]','special'],prompt:'QQ号码'" style="width: 90%;">
							</td>
							<td style="width: 34%; padding: 5px; text-align: center;">
								<input class="easyui-textbox" id="email" name="email"
									value="${sysUser.email}" labelWidth="70" label="邮箱" 
									placeholder="邮箱" data-options="prompt:'邮箱'" style="width: 90%;"
									validtype="email" invalidMessage="邮箱格式不正确">
							</td>
		    		  	</tr>
					</tbody>
				</table>

			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align: left; padding: 5px;">
			<a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;"><i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;保存</a> 
			<a id="btnCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
		</div>
	</div>

	<div id="CropperDialog" class="easyui-dialog" closed="true"
		modal="true" title="图片裁剪"
		style="width: 760px; height: 450px;padding: 0 20px;">
		<div class="easyui-layout"  data-options="fit:true" style="paddign:20px;">
			<div data-options="region:'north'"
				style="height: 50px; padding: 5px;border:none;">
				<form id="cropperUploadForm" action="${ctx }/common/uploadImage"
					enctype="multipart/form-data">
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
					<c:when test="${sysUser.photo != null && sysUser.photo != ''}">
						<img id="cropperImage" alt="" src="${userHeader}">
					</c:when>
					<c:otherwise>
						<img id="cropperImage" alt="" src="">
					</c:otherwise>
				</c:choose>
			</div>
			<div data-options="region:'south',border:false" style="text-align: left; padding: 5px;">
				<a id="cropperSave" href="javascript:void(0)" class="easyui-linkbutton button-success" style="width: 80px;"><i class="fa fa-check fa-lg"></i>&nbsp;&nbsp;确定</a> 
				<a id="cropperCancel" href="javascript:void(0)" class="easyui-linkbutton button-warning" style="width: 80px;"><i class="fa fa-remove fa-lg"></i>&nbsp;&nbsp;取消</a>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/include/loading.jsp"%>
	<!-- js脚本，必须写在body中，tab的url加载模式只会异步加载body中的内容到tab中 -->

	<link href="${ctxResources }/js/cropper/cropper.css" rel="stylesheet">
	<script type="text/javascript">
		require( [ 'jquery', 'cropper', 'common' ], function($) {

			var cropperImage = $("#cropperImage");

			// 初始化图片裁剪工具
			cropperImage.cropper({
				aspectRatio : 1,
				autoCropArea : 0.8,
				checkImageOrigin : true,
				viewMode : 1,
				ready : function(e) {
					var $clone = $(this).clone().removeClass('cropper-hidden');

					$clone.css({
						display : 'block',
						width : '100%',
						minWidth : 0,
						minHeight : 0,
						maxWidth : 'none',
						maxHeight : 'none'
					});

					$("#cropperPreview").css({
						width : '120px',
						height : '120px',
						overflow : 'hidden'
					}).html($clone);
				},
				crop : function(e) {
					var imageData = $(this).cropper('getImageData');
					var previewAspectRatio = e.width / e.height;

					var $preview = $("#cropperPreview");
					var previewWidth = $preview.width();
					var previewHeight = previewWidth / previewAspectRatio;
					var imageScaledRatio = e.width / previewWidth;

					$preview.height(previewHeight).find('img').css({
						width : imageData.naturalWidth / imageScaledRatio,
						height : imageData.naturalHeight / imageScaledRatio,
						marginLeft : -e.x / imageScaledRatio,
						marginTop : -e.y / imageScaledRatio
					});
				}
			});

			$("#cropperUpload").on("change",function() {
				if ($(this).val() != "") {
					var formData = new FormData();
					formData.append('image',document.getElementById('cropperUpload').files[0]);
					formData.append('type', 'AVATAR');

					$.ajax({
						url : '${ctx}/common/uploadImage',
						type : 'POST',
						data : formData,
						dataType : 'json',
						cache : false,
						contentType : false,
						processData : false,
						success : function(json) {
							if (json.rtnCode != '00000000') {
								$.messager.alert('提示',json.message,'error');
							} else {
								$("#cropperPreview").html('');
								$('#cropperImage').cropper('replace',json.rtnData);
							}
						}
					});
				}
			});

			$("#photoPicker").on("click", function() {
				$("#CropperDialog").dialog('open');
			});

			$("#cropperSave").on("click", function() {
				var croppedCanvas = cropperImage.cropper('getCroppedCanvas');
				$("#photoPicker").attr("src", croppedCanvas.toDataURL());
				$("#CropperDialog").dialog('close');
			});

			$("#cropperCancel").on("click", function() {
				$("#CropperDialog").dialog('close');
			});

			// 给保存按钮添加点击事件
			$("#btnSave").on( 'click', function() {

				/* $("#btnSave").linkbutton('disable'); */

				// 若用户修改过图片，将新的图片数据放入到表单隐藏域中
				if ($("#photoPicker").attr("src").indexOf("data:image") != -1) {
					$("#photoData").val( $("#photoPicker").attr("src"));
				}

				$("#DataForm").form('submit', {
					url : '${ctx}/system/sysUser/sysUserUpdate',
					onSubmit : function() {
						return $(this).form('enableValidation').form('validate');
					},
					success : function(data) {
						var json = $.parseJSON(data);
						if (json && json.rtnCode == '00000000') {
							$.messager.alert('提示',"保存成功,下次登录生效","success",function() {
								$("#btnSave").linkbutton('enable');
								hideDialog();
// 								window.history.go(-1);
							});
						} else {
							$.messager.alert('提示',json.rtnMsg,"error");
							 $("#btnSave").linkbutton('enable'); 
						}
					},
					error : function() {
						$("#btnSave").linkbutton('enable');
					}
				});
			});

			// 给取消按钮添加点击事件
			$("#btnCancel").on('click', function() {
				hideDialog();
			});

			//头像上传
			$("#DataForm").on('change', "#avatar-file", function() {
				var formData = new FormData();
				formData.append('file', this.files.item(0));
				formData.append('type', "AVATAR");
				$.ajax({
					url : '${ctx}/system/sysUser/uploadPic',
					type : 'POST',
					data : formData,
					cache : false,
					contentType : false,
					processData : false,
					success : function(data) {
						json = eval('(' + data + ')');
						if (json.code == '000002') {
							$.messager.alert('提示', json.message, "error");
						}
						$("#imghead").attr("src", json.path);
						$("#photo").val(json.path);
					}
				});
			});

			//扩展校验
			$.extend($.fn.textbox.defaults.rules, {
				phoneNum : { //验证手机号    
					validator : function(value, param) {
						var reg = /^1[3|4|5|8|9]\d{9}$/;
						return reg.test(value);
					},
					message : '请输入正确的手机号码'
				},

				telePhone : {
					validator : function(value, param) {
						// 电话号码格式027-12345678
						var reg = /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i;
						return reg.test(value);
					},
					message : '请输入正确的固定电话号码'
				},

				idcard : {// 验证身份证
					validator : function(value) {
						var reg = /^\d{15}(\d{2}[A-Za-z0-9])?$/i;
						return reg.test(value);
					},
					message : '身份证号码格式不正确'
				},
				
			    password : {// 验证密码  
		             validator : function(value) {  
		                 return /[a-zA-Z0-9_]{5,15}$/i.test(value);  
		             },  
		             message : '密码不合法（允许6-16字节，由字母数字下划线组成）'  
		         },
		         
		         userName : {// 验证用户名
		             validator : function(value) {  
		                 return /[a-zA-Z0-9_]$/i.test(value);  
		             },  
		             message : '用户名不合法（用户名由字母数字下划线组成）'  
		         },
		         
				
				birthday : {// 验证生日不能超过当前日期
					validator : function(value, param) {
						 	var birthdayTmp = value;
						 	/* alert(birthdayTmp); */
						 	
				            var date = new Date();
				    		var seperator1 = "-";
				    		var year = date.getFullYear();
				    		var month = date.getMonth() + 1;
				    		var strDate = date.getDate();
				    		if (month >= 1 && month <= 9) {
				    			month = "0" + month;
				    		}
				    		if (strDate >= 0 && strDate <= 9) {
				    			strDate = "0" + strDate;
				    		}
				    		var currentdate = year + seperator1 + month + seperator1 + strDate;
				            
				            /* alert(currentdate); */
				            return birthdayTmp <= currentdate;
					},
					message : '生日日期不能超过当前日期'
				}
				
			});
		});
	</script>
</body>
</html>