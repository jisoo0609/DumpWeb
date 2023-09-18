$(document).ready(function() {
    // 저장 버튼 클릭 이벤트 리스너
    $("#golPop3 input[value='확인']").click(function() {
        // 입력 필드에서 데이터 가져오기
        var orderDate = $("#datepicker").val();
        var loadPoint = $("#loadPoint").val();
        var unloadPoint = $("#unloadPoint").val();
        var items = $("#golItems").val();
        var count = $("#golCount").val();
        var carNumber = "(일괄배차) 미지정"; // 고정된 차량번호

        // 주문일 형식 변경
        var formattedOrderDate = new Date(orderDate).toLocaleDateString('en-US', { month: '2-digit', day: '2-digit' });

        // AJAX 요청 보내기
        $.ajax({
            url: 'order.jsp', // 서버 엔드포인트 설정
            method: 'POST', // 또는 'GET'에 따라서
            data: {
                orderDate: formattedOrderDate, // 변경된 주문일 사용
                loadPoint: loadPoint,
                unloadPoint: unloadPoint,
                items: items,
                count: count,
                carNumber: carNumber
            },
            success: function(response) {
                // 서버 응답 처리
                if (response.success) {
                    // 서버에서 성공 응답을 받았을 때 표에 행 추가
                    var newRow = "<tr><td>" + formattedOrderDate + "</td><td>" + loadPoint + "</td><td>" + unloadPoint + "</td><td>" + items + "</td><td>" + count + "</td><td>" + carNumber + "</td></tr>";
                    $("table tbody").append(newRow);

                    // 입력 필드 초기화
                    $("#datepicker, #loadPoint, #unloadPoint, #golItems, #golCount").val("");
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
    });
});
