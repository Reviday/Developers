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
	if(cPage==0) cPage=1;
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
	if(cPage==0) cPage=1;
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

function mll_search(cPage) {
	var searchValue=document.getElementById('system-search').value;
	var mllSuccess=document.getElementById('mllSuccess').value;
	if(cPage==0) cPage=1;
	$.ajax({
		url:path+"/admin/loginLogSearchList.lac",
		type:"POST",
		data:{
			"value":searchValue,
			"cPage":cPage,
			"mllSuccess":mllSuccess
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
					alert("해당 계정은 사용가능한 계정으로 전환되었습니다.");
					$('.mainContent').html("");
					$('.mainContent').html(result);
				} else {
					alert("계정 복구가 제대로 이루어지지 않았습니다.");
				}
			},
		});
	} 
}


//태그 승인
function tag_approval(tag_no, bus_no) {
	if(confirm('해당 태그 요청을 승인하시겠습니까?')) {
		var tagOpinion=$('#tag_opinion_'+tag_no).val();
		$.ajax({
			url:path+"/admin/tagApproval.lac",
			type:"POST",
			data: {
				"tagNo":tag_no,
				"busNo":bus_no,
				"tagOpinion":tagOpinion,
				"cPage":$('#cPage').val(),
				"numPerPage":$('#numPerPage').val()
			},
			success: function(result) {
				if(result!=null) {
					alert("정상적으로 승인처리 되었습니다.");
					$('.mainContent').html("");
					$('.mainContent').html(result);
				} else {
					alert("태그 승인처리가 정상적으로 이루어지지 않았습니다.");
				}
			}
		});
	}
};

//태그 거절
function tag_rejection(tag_no) {
	if(confirm('해당 태그 요청을 거절하시겠습니까?')) {
		$.ajax({
			url:path+"/admin/tagRejection.lac",
			type:"POST",
			data: {
				"tagNo":tag_no,
				"cPage":$('#cPage').val(),
				"numPerPage":$('#numPerPage').val()
			},
			success: function(result) {
				if(result!=null) {
					alert("정상적으로 거절처리 되었습니다.");
					$('.mainContent').html("");
					$('.mainContent').html(result);
				} else {
					alert("태그 거절처리가 정상적으로 이루어지지 않았습니다.");
				}
			}
		});
	}
};

// 로그인 로그 차트 변경
function mll_chartChange(data, chart) {
	$.ajax({
		url:path+"/admin/mllChangeChart.lac",
		type:"POST",
		data:{
			"data":data,
			"chart":chart
		},
		success:function(result) {
			if(result!=null) {
				$('#chartArea').html("");
				$('#chartArea').html(result);
			} else {
				alert("요청이 정상적으로 처리되지 않았습니다.");
			}
		}
			
	})
};

// mll 페이지 데이터/차트 선택 함수
$(".chartTrigger").on("change", function() {
	mll_chartChange($("#chartDataSelect option:selected").val(), $("#chartSelect option:selected").val());
});

//방문자 통계 차트 변경
function visitor_chartChange(period, term, chart) {
	$.ajax({
		url:path+"/admin/visitorChangeChart.lac",
		type:"POST",
		data:{
			"period":period,
			"term":term,
			"chart":chart
		},
		success:function(result) {
			if(result!=null) {
				$('#visitor-chart-time').html("");
				$('#visitor-chart-time').html(result);
			} else {
				alert("요청이 정상적으로 처리되지 않았습니다.");
			}
		}
			
	})
};

//기업등록 승인
function bus_req_approval(requestNo, busNo, memNo) {
	$.ajax({
		url:path+"/admin/businessRequestApproval.lac",
		type:"POST",
		data:{
			"requestNo":requestNo,
			"busNo":busNo,
			"busName":$("#busName_"+busNo).val(),
			"memNo":memNo,
			"memEmail":$("#memEmail_"+memNo).val()
		},
		success:function(result) {
			if(result!=null) {
				alert("정상적으로 승인처리 되었습니다.");
				$('.mainContent').html("");
				$('.mainContent').html(result);
			} else {
				alert("승인처리가 정상적으로 이루어지지 않았습니다.");
			}
		}
	})
};

//기업등록 거절
function bus_req_rejection(requestNo, busNo, memNo) {
	$.ajax({
		url:path+"/admin/businessRequestRejection.lac",
		type:"POST",
		data:{
			"requestNo":requestNo,
			"busNo":busNo,
			"busName":$("#busName_"+busNo).val(),
			"memNo":memNo,
			"memEmail":$("#memEmail_"+memNo).val()
		},
		success:function(result) {
			if(result!=null) {
				alert("정상적으로 거절처리 되었습니다.");
				$('.mainContent').html("");
				$('.mainContent').html(result);
			} else{
				alert("거절처리가 정상적으로 이루어지지 않았습니다.");
			}
		}
	})
};


// 포지션 등록 승인
function position_approval(positionNo, busNo) {
	$.ajax({
		url:path+"/admin/positionApproval.lac",
		type:"POST",
		data:{
			"positionNo":positionNo,
			"busName":$("#busName_"+busNo).val(),
			"applyEmail":$("#applyEmail_"+positionNo).val()
		},
		success:function(result) {
			if(result!=null) {
				alert("정상적으로 승인처리 되었습니다.");
				$('.mainContent').html("");
				$('.mainContent').html(result);
			} else {
				alert("승인처리가 정상적으로 이루어지지 않았습니다.");s
			}
		}
	})
};

// 포지션 등록 거절
function position_rejection(positionNo, busNo) {
	$.ajax({
		url:path+"/admin/positionRejection.lac",
		type:"POST",
		data:{
			"positionNo":positionNo,
			"busName":$("#busName_"+busNo).val(),
			"applyEmail":$("#applyEmail_"+positionNo).val()
		},
		success:function(result) {
			if(result!=null) {
				alert("정상적으로 거절처리 되었습니다.");
				$('.mainContent').html("");
				$('.mainContent').html(result);
			} else {
				alert("거절처리가 정상적으로 이루어지지 않았습니다.");s
			}
		}
	})
};
