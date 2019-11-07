
$(function(){
    // 회원 가입 처리
    $('#join-submit').click(function(e){
        e.preventDefault();
        if($("#user_name").val() ==''){
            alert('이름을 입력하세요');
            $("#user_name").focus();
            return false;
        }
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

        if($("#user_password_check").val() ==''){
            alert('비밀번호를 다시 한번 더 입력하세요');
            $("#user_password_check").focus();
            return false;
        }

        if($("#user_password").val()!== $("#user_password_check").val()){
            alert('비밀번호를 둘다 동일하게 입력하세요');
            return false;
        }
        var email = $('#user_email').val();
        if(email == ''){
            alert('이메일을 입력하세요');
            $("#InputEmail").focus();
            return false;
        } else {
            var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!emailRegex.test(email)) {
                alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
                $("#user_email").focus();
                return false;
            }
        }
        if($("#user_mobile").val() ==''){
            alert('휴대폰 번호를 입력하세요');
            $("#user_mobile").focus();
            return false;
        }
        var data = {
        		user_name:$("#user_name").val(),
                user_id:$('#user_id').val(),
                user_email:$('#user_email').val(),
                user_password:$('#user_password').val(),
                user_mobile:$("#user_mobile").val(),
                user_birth:$("#datePicker").val(),
                user_type:$("#user_type").val()
        }
        $.ajax({
            url: 'Regis_Act',
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json; charset=utf-8',
            success: function (response) {
                if(response.result == 1){
                    alert('가입 완료');
                    location.replace('/app/'); // 화면 갱신
                } else if(response.result == 0){
                    alert('이미 가입된 아이디입니다');
                } else if(response.result == -2){
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