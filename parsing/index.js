$(document).ready(
	function(){
		$("input[type=submit]").click(function(event){
			event.preventDefault();
			var filename = $("[name=filename]").val();
			var path = 'setup.php?filename=' + filename;
			console.log(path);
			$.get( path,
				function(my_var){
					if(my_var != 'error' )
						reloadFile(my_var);
					else
						alert('error');
				}, 'text'
			);
			return 0;
		});
	}
);

function reloadFile(filename)
{
	$.get(filename, function( my_var ) {
		$("#output").val(my_var);
	}, 'text');
}