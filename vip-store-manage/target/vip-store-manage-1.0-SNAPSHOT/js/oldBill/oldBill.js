function changeRepayState(){
	$.ajax({
		url : serverPath + "/oldBill/changeRepayState.htm",
		type : "post",
		dataType : "json",
		data : {
			"successNos" : $('#successNos').val()
		},
		success : function(res) {
			if(res.code != 0){
				BootstrapDialog.alert(res.message);
			}else{
				BootstrapDialog.alert("操作成功");
			}
		},
		error : function(e) {
			BootstrapDialog.alert(e);
			}
	})
}

function changeCreateUser(){
	$.ajax({
		url : serverPath + "/oldBill/changeCreateUser.htm",
		type : "post",
		dataType : "json",
		data : {
			"failedNos" : $('#failedNos').val()
		},
		success : function(res) {
			if(res.code != 0){
				BootstrapDialog.alert(res.message);
			}else{
				BootstrapDialog.alert("操作成功");
			}
		},
		error : function(e) {
			BootstrapDialog.alert(e);
			}
	})
}