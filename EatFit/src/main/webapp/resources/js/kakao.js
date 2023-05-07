 Kakao.init('2d337f4809ca9865d6f20f4b66a83a4b');

 $(document).ready(function() {
	    $('.kakao-login-btn').click(function() {
	        console.log("들어옴112333");

	        Kakao.Auth.loginForm({
	            redirectUri: "http://172.30.1.84:8081/eatfit/join.do",
	            success: function(authObj) {
	                // 로그인 성공 시 처리할 코드
	                console.log("로그인성공");
	                console.log(authObj);
	            },
	            fail: function(err) {
	                // 로그인 실패 시 처리할 코드
	                console.log("로그인실패");
	                console.log(err);
	            }
	        });
	    });
	});