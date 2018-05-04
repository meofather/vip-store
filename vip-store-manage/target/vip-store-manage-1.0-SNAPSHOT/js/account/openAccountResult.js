function resetPassword(p2pChannelNo,idNo){
	$.ajax({
		url : serverPath + "/account/resetPassword.htm",
		type : "post",
		data : {
			"p2pChannelNo" : p2pChannelNo,
			"idNo" : idNo,
			"Time" : new Date().getMilliseconds()
		},
		dataType : "json",
		success : function(result) {
			if (result.code == 0) {
				if(result.data.returnCode != '000000'){
					BootstrapDialog.alert("操作失败");
				}else{
					BootstrapDialog.alert("请在新打开页面完成密码重置", function() {
						window.open(result.data.url);
						window.history.back(-1);
					});
				}
			} else {
				BootstrapDialog.alert("操作失败");
			}
		},
		error : function() {
			BootstrapDialog.alert("操作失败");
		}
	});	
}

function modifyPassword(p2pChannelNo,idNo,memberName){
	$.ajax({
		url : serverPath + "/account/modifyPassword.htm",
		type : "post",
		data : {
			"p2pChannelNo" : p2pChannelNo,
			"idNo" : idNo,
			"custName":memberName,
			"Time" : new Date().getMilliseconds()
		},
		dataType : "json",
		success : function(result) {
			if (result.code == 0) {
				if(result.data.returnCode != '000000'){
					BootstrapDialog.alert("操作失败");
				}else{
					BootstrapDialog.alert("请在新打开页面完成密码修改", function() {
						window.open(result.data.url);
						window.history.back(-1);
					});
				}
			} else {
				BootstrapDialog.alert("操作失败");
			}
		},
		error : function() {
			BootstrapDialog.alert("操作失败");
		}
	});	
}

function withdraw(contractNo){
	$.ajax({
		url : serverPath + "/account/withdraw.htm",
		type : "post",
		data : {
			"contractNo" : contractNo,
			"Time" : new Date().getMilliseconds()
		},
		dataType : "json",
		success : function(result) {
			if (result.code == 0) {
				BootstrapDialog.alert("请在新打开页面完成提现", function() {
					window.open(result.data);
					window.history.back(-1);
				});
			} else {
				BootstrapDialog.alert("操作失败");
			}
		},
		error : function() {
			BootstrapDialog.alert("操作失败");
		}
	});	
}