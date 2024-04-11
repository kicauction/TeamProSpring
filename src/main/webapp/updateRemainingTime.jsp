<!-- updateRemainingTime.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function updateRemainingTime() {
        $.ajax({
            url: '<c:url value="/updateRemainingTime"/>',
            type: 'GET',
            data: { pnum: ${board.pnum} },
            success: function(result) {
                $('#remainingTime').html(result);
            }
        });
    }

    $(document).ready(function() {
        updateRemainingTime();
    });

    setInterval(function() {
        updateRemainingTime();
    }, 1000);
</script>
