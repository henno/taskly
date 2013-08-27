$(document).ready(function() {
	var mystring;
	$(".edit").mouseenter(function() {
		var id=this.id;


		switch(id)
		{
			
			case "task_summary":
				mystring="task_summary";
				var data=document.getElementById(mystring).innerHTML;
				document.getElementById(mystring).innerHTML = '<input type="text" onblur="edit()" value="'+data+'">';
				break;
			case "task_due":
				mystring="task_due";

				var data=document.getElementById(mystring).innerHTML;
				document.getElementById(mystring).innerHTML = '<input type="text" onblur="edit()" value="'+data+'">';
				break;
			case "user_assignee_id":
				mystring="user_assignee_id";
				var data=document.getElementById(mystring).innerHTML;
				document.getElementById(mystring).innerHTML = '<input type="text" onblur="edit()" value="'+data+'">';
			case "user_reporter_id":
				mystring="user_reporter_id";
				var data=document.getElementById(mystring).innerHTML;
				document.getElementById(mystring).innerHTML = '<input type="text" onblur="edit()" value="'+data+'">';
			default:
				mystring="task_summary";
				var data=document.getElementById(mystring).innerHTML;
				document.getElementById(mystring).innerHTML = '<input type="text" onblur="edit()" value="'+data+'">';
		}

	});


	$(".edit").mouseleave(function() {
		var element=document.getElementById(mystring);
		element.innerHTML=element.value;
	});

});
function edit(){
alert("Siin salvestab");
	//siin saadame salvestama ajaxiga
}
