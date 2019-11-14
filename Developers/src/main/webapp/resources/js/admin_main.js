//테이블 js (반응형 처리)
$(document).ready(function() {
	var activeSystemClass = $('.list-group-item.active');

	//something is entered in search form
	/*
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
	});*/
	
});

function search(cPage) {
	var selectLevel=$("#searchlevel option:selected").val();
	var searchValue=$("#system-search").val();
	if(cPage==0) cPage=$('#cPage').val();
	$.ajax({
		url:path+"/admin/memberSearchList.lac",
		type:"POST",
		data:{
			"value":searchValue,
			"searchLevel":selectLevel,
			"cPage":cPage,
			"numPerPage":$('#numPerPage').val()
		},
		success: function(result) {
			if(result!=null) {
				$('.mainContent').html("");
				$('.mainContent').html(result);
			} 
		}
	}); 
};


function wd_search(cPage) {
	var searchValue=document.getElementById('system-search').value;
	if(cPage==0) cPage=$('#cPage').val();
	$.ajax({
		url:path+"/admin/withdrawMemberSearchList.lac",
		type:"POST",
		data:{
			"value":searchValue,
			"cPage":cPage,
			"numPerPage":$('#numPerPage').val()
		},
		success: function(result) {
			if(result!=null) {
				$('.mainContent').html("");
				$('.mainContent').html(result);
			} 
		}
	}); 
}

function mll_search() {
	var searchValue=document.getElementById('system-search').value;
	$.ajax({
		url:path+"/admin/loginLogSearchList.lac",
		type:"POST",
		data:{
			"value":searchValue
		},
		success: function(result) {
			if(result!=null) {
				$('.mainContent').html("");
				$('.mainContent').html(result);
			} 
		}
	}); 
}

//멤버 수정
function fn_updateMember(memNo) {
	if(confirm('회원 정보를 수정하시겠습니까?')) {
		$.ajax({
			url:path+"/admin/updateMember.lac",
			type:"POST",
			data:{
					"memNo":memNo,
					"memLevel":$("#level_"+memNo+" option:selected").val(),
					"memAdminmemo":$("#memoarea_"+memNo).val()
				},
			success: function(result) {
				if(result==1) {
					alert("회원 정보가 수정되었습니다.");
				} else {
					alert("회원 정보 수정에 실패하였습니다.");
				}
			},
		});
	}
};

//멤버 탈퇴
function fn_deleteMember(memNo) {
	if(confirm('회원을 정말로 탈퇴시키겠습니까?')) {
		var searchValue=document.getElementById('system-search').value;
		var selectLevel=$("#searchlevel option:selected").val();
		$.ajax({
			url:path+"/admin/deleteMember.lac",
			type:"POST",
			data:{
				"memNo":memNo,
				"cPage":$('#cPage').val(),
				"numPerPage":$('#numPerPage').val(),
				"value":searchValue,
				"searchLevel":selectLevel
			},
			success: function(result) {
				if(result!=null) {
					alert("회원이 정상적으로 탈퇴처리 되었습니다.\n탈퇴회원관리 페이지에서 복구할 수 있습니다.");
					$('.mainContent').html("");
					$('.mainContent').html(result);
				} else {
					alert("회원 탈퇴처리가 정상적으로 이루어지지 않았습니다.");
				}
			},
		});
	} 
}

//멤버 복구
function fn_restoreMember(memNo) {
	if(confirm('해당 계정을 복구시키겠습니까?')) {
		var searchValue=document.getElementById('system-search').value;
		$.ajax({
			url:path+"/admin/restoreMember.lac",
			type:"POST",
			data:{
				"memNo":memNo,
				"cPage":$('#cPage').val(),
				"numPerPage":$('#numPerPage').val(),
				"value":searchValue
			},
			success: function(result) {
				if(result!=null) {
					alert("해당 게정은 사용가능한 계정으로 전환되었습니다.");
					$('.mainContent').html("");
					$('.mainContent').html(result);
				} else {
					alert("계정 복구가 제대로 이루어지지 않았습니다.");
				}
			},
		});
	} 
}