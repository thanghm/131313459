(function($, undefined) {
  $(function ()
    {
			$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		});
	});
})( jQuery );