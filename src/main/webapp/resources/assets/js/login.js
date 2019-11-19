
$(function(){
    // 회원 가입 처리
    $('#login').click(function(e){
        if($("#user_id").val() ==''){
            alert('아이디를 입력하세요');
            $("#user_id").focus();
            return false;
        }


        if($("#user_password").val() ==''){
            alert('비밀번호를 입력하세요');
            $("#user_password").focus();
            return false;
        }
        var data = {
                user_id:$('#user_id').val(),
                user_password:$('#user_password').val()
        }
        $.ajax({
            url: '/app/Login_Act',
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'text/plain; charset=utf-8',
            success: function (response) {
            	alert(response);
                if(response == 1){
                    alert('로그인 성공');
                    location.replace('/app/'); // 화면 갱신
                } else if(response == 0){
                    alert('이미 가입된 아이디입니다');
                } else if(response == -2){
                    alert('입력된 값이 없습니다');
                } else {
                    alert('등록중에 에러가 발생했습니다');
                }
            },
            error: function(jqXHR, textStatus, errorThrown){
                alert("arjax error : " + textStatus + "\n" + errorThrown);
            }
        });

    });

});