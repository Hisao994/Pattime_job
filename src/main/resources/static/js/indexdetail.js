function applyinfo(){
	$.ajax({
		url:"save_applyinfo.action",
		mothod:"POST",
		dataType:"JSON",
		data:$("#parrtimejob").serialize(),
		success:function(data){
			if(data.code==1){
				alert(data.msg);
				location.href("index.jsp");
			}
		}
	})
}