$(document).ready(function() {
    // 클라이언트 측에서 표의 순번을 관리할 변수
    var orderNumber = 1;

    // 저장 버튼 클릭 이벤트 리스너
    $("#golPop3 input[value='확인']").click(function() {
        // 입력 필드에서 데이터 가져오기
        var loadPoint = $("#loadPoint").val();
        var unloadPoint = $("#unloadPoint").val();
        var golItems = $("#golItems").val();
        var golCount = $("#golCount").val();
        var carNumb = $("#carNumb").val(); // 차량번호 입력값

        // 차량번호가 입력되지 않았을 때 "(일괄배차) 미지정"으로 설정
        if (!carNumb) {
            carNumb = "(일괄배차) 미지정";
        }

        // AJAX 요청 보내기
        $.ajax({
            url: '/dailyReport/oldform',
            method: 'POST',
            data: {
                loadPoint: loadPoint,
                unloadPoint: unloadPoint,
                golItems: golItems,
                golCount: golCount,
                carNumb: carNumb
            },
            success: function(response) {
                // 서버 응답 처리
                if (response.success) {
                    // 서버에서 성공 응답을 받았을 때 표에 행 추가

                    // No. 증가
                    var orderNo = orderCount++;

                    var newRow = "<tr><td>" + orderNo + "</td><td>"+ loadPoint +
                    "</td><td>" + unloadPoint + "</td><td>" + golItems + "</td><td>" + golCount +
                      "</td><td>" + carNumb + "</td></tr>";
                    $("table tbody").append(newRow);

                    // 입력 필드 초기화
                    $("#loadPoint, #unloadPoint, #golItems, #golCount").val("");

                    // 팝업창 닫기
                    $("#golPop3").hide();
                } else {
                    // 서버에서 실패 응답을 받았을 때 처리
                    alert("서버에서 저장 중 오류가 발생했습니다.");
                }
            },
            error: function() {
                // AJAX 요청 자체에 실패한 경우 처리
                alert("서버에 연결할 수 없습니다.");
            }
        });
        // 취소 버튼 클릭 이벤트 리스너
        $("#golPop3 input[value='취소']").click(function() {
            // 팝업창 닫기
            $("#golPop3").hide();

            // 입력 필드 초기화
            $("#loadPoint, #unloadPoint, #golItems, #golCount, #carNumb").val("");
    });
});
