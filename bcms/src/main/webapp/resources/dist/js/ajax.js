var sendAjax =  function(url) {

	var postString = "";
	$.ajax({

		type: "POST",
		url: url,
		data: postString,
		success: function(msg) {
			
			document.getElementById("ajax").innerHTML = msg;
		}
	});
//			alert("성공");
 };