//테이블 js (반응형 처리)
$(document).ready(function() {
	var activeSystemClass = $('.list-group-item.active');

	//something is entered in search form
	$('#system-search').keyup(function() {
		var that = this;
		// affect all table rows on in systems table
		var tableBody = $('.table-list-search tbody');
		var tableRowsClass = $('.table-list-search tbody tr');
		$('.search-sf').remove();
		tableRowsClass.each(function(i, val) {

			//Lower text for case insensitive
			var rowText = $(val).text().toLowerCase();
			var inputText = $(that).val().toLowerCase();
			if (inputText != '') {
				$('.search-query-sf').remove();
				tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
								+ $(that).val()
								+ '"</strong></td></tr>');
			} else {
				$('.search-query-sf').remove();
			}

			if (rowText.indexOf(inputText) == -1) {
				//hide rows
				tableRowsClass.eq(i).hide();

			} else {
				$('.search-sf').remove();
				tableRowsClass.eq(i).show();
			}
		});
		//all tr elements are hidden
		if (tableRowsClass.children(':visible').length == 0) {
			tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
		}
	});
});

// memo js
$('.memoBtn').on('click', function() {
	var choId=$(this).next('.memo_area');
	var memoArr=$(".memo_area");
	$.each(memoArr, function(index, item) {
		if($(item).attr("id")==$(choId).attr("id")) {
			$(choId).slideToggle();
		} else {
			$(item).slideUp();		
		}
	})
})

