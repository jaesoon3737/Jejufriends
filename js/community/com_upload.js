function communityUpload() {

    // 제목 체크
    const subject = $('input[name=comsubject]').val();
    if(subject.length === 0) {
        alert("제목을 입력해주세요");
        location.href = "#content";
        return;
    }
    // 내용 체크
    const content = $('textarea[name=comcontent]').val();
    if(content.length === 0) {
        alert("내용을 입력해주세요");
        location.href = "#content";
        return;
    }
    // 해시 태그 값 셋팅
    let hashTagLsit = '';

    const hashTagNum = $('#hashtag_list').children().length;
    const mainHash = $('.tag:checked').val();
    if(hashTagNum != 0) {
        if(!mainHash) {
            if(hashTagNum != 0) {
                for(let i = 0; i < hashTagNum; i++) {
                    hashTagLsit += ' ' + hashTag;
                }
            }
        }else {
            hashTagLsit += mainHash;
            if(hashTagNum != 0) {
                for(let i = 0; i < hashTagNum; i++) {
                    let hashTag = $(`#dough${i}`).val();
                    if(hashTag === mainHash) {
                        continue;
                    }else {
                        hashTagLsit += ' ' + hashTag;
                    }
                }
            }
        }
        $('#tag_set').val(hashTagLsit);
    }
    
    // 카테고리 체크
    const kategorie = $('select[name=kategorie] option:selected').val();
    if(kategorie.length == 0) {
        alert("카테고리를 골라주세요");
        location.href = "#content";
        return;
    }
    // 지역 체크
    const division = $('select[name=division] option:selected').val();
    if(division.length == 0) {
        alert("지역을 골라주세요");
        location.href = "#content";
        return;
    }
    community_submit.submit();
}