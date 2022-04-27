
let selectPage = 1;
let maxPage = 0;
let communityListTemp = [];
function communityPageSet(pageNum, page, communityList) {
    $('#community_paging').empty();
    let pageHtml = '';
    let startPage = 1;
    let loop = 0;
    // communityList 가 배열이면 새로 전역변수에 대입
    if(Array.isArray(communityList)) communityListTemp = communityList;

    // 마지막 페이지 계산
    maxPage = Math.floor(communityListTemp.length / pageNum);
    if(communityListTemp.length%pageNum != 0) maxPage++;
    selectPage = page;

    // floor === 소수점 버림, toFixed(0) === 소수점 몇번째 자리까지 자른건지
    // 시작 페이지
    if((page/pageNum).toFixed(0) != 0) {
        loop = Math.floor(page/pageNum+1);
        if(pageNum*(loop-1) == page){
            startPage = Math.floor(pageNum*(loop-2)+1);
            loop -= 1;
        }else{
            startPage = Math.floor(pageNum*(loop-1)+1);
        }
    }else {
        loop = 1;
    }

    // 코스 리스트 출력
    let communityHtml = '';
    let communityListStart = page*pageNum-pageNum;
    let communityListLast = page*pageNum;

    $("#community_list").empty();
    if(communityListTemp.length != 0) {
        for(let i = communityListStart; i < communityListLast; i++) {
            if(communityListTemp[i] != null){
                let community = communityListTemp[i];
                communityHtml += `
                    <tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
                        <td style="width:10%;">${community.comnum}</td>
                        <td style="width:20%;">${community.nick}</td>
                        <td class="subject left txtBreak" style="width:10%;">
                            <a href="/jejufriends/community/communityContent.do?comnum=${community.comnum}" style="color:#555555;">${community.comsubject}</a> 
                        </td>
                        <td class=""><span class="txtNum">${community.comdate}</span></td>
                        <td class=""><span class="txtNum">${community.kategorie}</span></td>
                        <td class=""><span class="txtNum">${community.views}</span></td>
                        <td class=""><span class="txtNum">${community.love}</span></td>
                    </tr>
                `;
            }
        }
    }else {
        communityHtml += `
            <tr style="background-color:#FFFFFF; color:#555555;" class="">
                <td colspan="7" class="subject" style="text-align: center;">검색 결과가 없습니다</td>
            </tr>
        `;
    }
    $("#community_list").append(communityHtml);

    // 페이지 버튼 생성
    if(selectPage > 1) {
        pageHtml += '<a><img class="beforePage" style="cursor:pointer;" src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif" alt="이전 페이지"/></a>';
    }
    pageHtml += '<ol>';
    for(let i = startPage; i <= startPage+5; i++) {
        if(i === page) pageHtml += `<li class="xans-record-"><a class="this" style="cursor:pointer;">${i}</a></li>`;
        else if(i > maxPage) break;
        else pageHtml += `<li class="xans-record-"><a class="page" style="cursor:pointer;">${i}</a></li>`;
    }
    pageHtml += '</ol>';
    if(selectPage != maxPage && maxPage != 0) {
        pageHtml += '<a><img class="nextPage" style="cursor:pointer;" src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif" alt="다음 페이지"/></a>';
    }
    $('#community_paging').append(pageHtml);
}

$(document).ready(function() {
    // 페이지 번호 누를 때 이벤트
    $(document).on('click', '.page', function() {
        const page = Number($(this).text());
        const pageNum = $('#pageNum option:selected').val();
        communityPageSet(pageNum, page, null);
    });

    // 다음페이지 버튼 누를 때 이벤트
    $(document).on('click', '.nextPage', function() {
        const page = selectPage + 1;
        const pageNum = $('#pageNum option:selected').val();
        communityPageSet(pageNum, page, null);
    });

    // 이전페이지 버튼 누를 때 이벤트
    $(document).on('click', '.beforePage', function() {
        const page = selectPage - 1;
        const pageNum = $('#pageNum option:selected').val();
        communityPageSet(pageNum, page, null);
    });

    // 페이지 수 변경할 때 이벤트
    $(document).on('change', '#pageNum', function() {
        const page = selectPage;
        const pageNum = $('#pageNum option:selected').val();
        communityPageSet(pageNum, page, null);
    });

    // 검색 이벤트
    $('#community_button').on('click', function() {
        communitySearchAjax();
    });
    $('#community_search').on('keydown', function(key) {
        if(key.keyCode == 13) {
            communitySearchAjax();
        }
    });
});

// 검색 ajax
function communitySearchAjax() {
    const searchKey = $('#search_key option:selected').val();
    const keyWord = $('#community_search').val();
    let csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
    let csrfHeader = $('meta[name="_csrf_header"]').attr('content');
    let csrfToken = $('meta[name="_csrf"]').attr('content');
    $.ajax({
        url: "/jejufriends/community/communitySearch.json",
        type: "POST",
        data: {column: searchKey, keyword: keyWord},
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }, 
        success: function(communityList) {
            const pageNum = $('#pageNum option:selected').val();
            communityPageSet(pageNum, 1, communityList);
        }
    });
}