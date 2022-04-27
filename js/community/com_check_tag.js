$(document).ready(function () {
    const tag = {};
    let counter = 0;

    // 입력한 값을 태그로 생성한다.
    function addTag (value) {
        tag[counter] = value;
        counter++; // del-btn 의 고유 id 가 된다.
    }

    // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag () {
        return Object.values(tag).filter(function (word) {
            return word !== "";
        });
    }

    $("#course_hash").on("keyup", function (e) {
        const self = $(this);
        //엔터나 스페이스바 눌렀을때 실행
        if(e.keyCode == 32) {
            alert("스페이스바를 사용할 수 없습니다.");
            self.val("");
        }
        
        let tagValue = self.val(); // 값 가져오기
        if(tagValue.length > 30) {
            self.val(tagValue.substring(0,30));
            alert("30자 까지 입력가능 합니다");
            return;
        }

        if (e.key === "Enter") {
            
            if(tagValue.startsWith('#')){ // 값이 #으로 시작하는지 검사
                // 해시태그 값 없으면 실행X
                if (tagValue.length > 1) { // 내용이 없는 태그 체크
                    let checkTag = tagValue.substring(1);

                    if(checkTag.indexOf('#') < 0) {
                        tagValue = tagValue.replace(/^\s+|\s+$/gm,''); // 문저열 앞뒤 공백 제거
                        if(counter < 5) { // 태그 갯수 제한
                            
                            // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                            let result = Object.values(tag).filter(function (word) {
                                return word === tagValue;
                            })
                        
                            // 해시태그가 중복되었는지 확인
                            if (result.length == 0) { 
                                $("#hashtag_list").append(`
                                    <div class="chk-box" style="display:inline-block;">
                                        <input type="radio" id="dough${counter}" class="tag" name="dough" value="${tagValue}" style="display:inline-block;float:left;"/>
                                        <label for="dough${counter}" style="float:right;">
                                            ${tagValue}
                                        </label>
                                    </div>
                                `);
                                addTag(tagValue);
                                self.val("#");
                            } else {
                                self.val("#");
                                alert("태그값이 중복됩니다.");
                            }
                        }else {
                            self.val("#");
                            alert("태그는 5개 까지 입력 가능 합니다.");
                        }
                    }else {
                        self.val("#");
                        alert("#은 맨앞에만 입력할 수 있습니다.");
                    }
                    e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
                }else {
                    self.val("#");
                    alert("해시태그의 내용을 입력하세요");
                }
            }else {
                self.val("#");
                alert("먼저 #을 입력해주세요");
            }
        }
    });

    // 삭제 버튼 
    // 인덱스 검사 후 삭제
    $(document).on("click", ".del-btn", function (e) {
        let index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
    });
})


// 태그 글자 수 제한
$(document).ready(function() {
    $('#course_hash').keydown(function() {
        let content = $(this).val();
        if(content.length > 30) {
            $(this).val(content.substring(0,30));
            return;
        }
    });
});