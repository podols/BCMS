// 체크 박스 

function allAChecking(){
	    var aBox = sharing.ACheck
	    if(aBox.length) {  // 여러 개일 경우
	        for(var i = 0; i<aBox.length;i++) {
	        	aBox[i].checked=sharing.allACheck.checked;
	        }
	    } 
   	 else { // 한 개일 경우
        aBox.checked=sharing.allACheck.checked;
    }
}

function allBChecking(){
	var bBox = sharing.BCheck
    if(bBox.length) {  // 여러 개일 경우
        for(var i = 0; i<bBox.length;i++) {
        	bBox[i].checked=sharing.allBCheck.checked;
        }
    } else { // 한 개일 경우
        bBox.checked=sharing.allBCheck.checked;
    }
}
//.do 이동 function


