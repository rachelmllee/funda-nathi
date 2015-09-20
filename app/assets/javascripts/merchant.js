function validate(){
	if(document.getElementById('user_id').value==""){
		document.getElementById('frmPay').style.display="none";
		document.getElementById('error').style.display="";
	}
}
function transact(type){
	document.getElementById("err").innerHTML="";
	var url="";
	var xmlhttp;
	var subscription = document.getElementById("package").value;
	if (subscription=="Special Package R100 for 3 months"){
		subscription="sp";
	}
	else if(subscription=="Premium package R75 p/month"){
		subscription="p";
	}
	else{
		subscription="s";
	}
	
	if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		 
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  
		  }
	xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
			var info = xmlhttp.responseText;
			
			var data = JSON.parse(info);
			
			//populate payment details
			document.getElementById("id").value=data["merchant_id"];
			document.getElementById("key").value=data["merchant_key"];
			document.getElementById("return").value=data["return_url"];
			document.getElementById("cancel").value=data["cancel_url"];
			document.getElementById("notify").value=data["notify_url"];
			document.getElementById("amount").value=data["amount"];
			document.getElementById("m_payment_id").value=data["payment_id"];
			
			//submit the form
			if(validate_inputs()){
			document.getElementById("frmPay").submit();
			 }
			}
		  } 
	
	if (type=="test"){
		url = "details.php?test=true&subscription="+subscription;
		document.getElementById("frmPay").action="https://sandbox.payfast.co.za/eng/process";
	}
	else if(type="live"){
		url = "details.php?live=true&subscription="+subscription;
		document.getElementById("frmPay").action="http://www.payfast.co.za/eng/process"
	}
	
	if(validate_inputs()==false){
		return;
	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	
	
}

function validate_inputs(){
	if (document.getElementById("firstname").value.trim()==""){
		
		document.getElementById("err").innerHTML="invalid first name";
		return false;
		
		
	}
	
	if (document.getElementById("lastname").value.trim()==""){
		document.getElementById("err").innerHTML="invalid last name";
		return false;
		
	}
	
	if (document.getElementById("email").value.trim()=="" || validateEmail(document.getElementById("email").value)==false ){
		document.getElementById("err").innerHTML="invalid email";
		return false;
		
	}
	if (document.getElementById("accept").checked==false){
		document.getElementById("err").innerHTML="please accept terms and conditions";
		return false;
	}
	if (document.getElementById("stu_id").value.trim()=="" || ((+document.getElementById("stu_id").value===parseInt(document.getElementById("stu_id").value))==false)){
		document.getElementById("err").innerHTML="invalid student ID";
		return false;
	}
	
	document.getElementById("firstname").value=document.getElementById("firstname").value.trim();
	document.getElementById("lastname").value=document.getElementById("lastname").value.trim();
	document.getElementById("email").value=document.getElementById("email").value.trim();
	return true;
	
}

function validateEmail(email) 
{
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}
