$(document).ready(
	function(){
		$("input[type=submit]").click(function(event){
			event.preventDefault();
			// Checkable fields, and select fields.
			var query = '';
			$('input[type=radio]').each(function()
			{
				if ((this.checked || this.selected) && this.value != '')
				{
					query += '&' + this.attributes["name"].value + '=' + this.value;
				}
			} );
			var filename = $("[name=filename]").val();
			var path = 'setup.php?filename=' + filename + query;
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
	$("#outputfilename").html(filename).attr('href', filename);
	$.get(filename, function( my_var ) {
		$("#output").val(my_var);
	}, 'text');
}