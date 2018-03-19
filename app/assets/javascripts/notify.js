function joinOrder(e) {
	$.ajax({
		method: 'post',
        url: '/joineds/add',
        data: {oid:$(e).attr('id'), authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        success: function(result){
        	window.location.replace("/orders/orderDetails/"+$(e).attr('id'));
        }
	})
}

function goOrder(e) {
    window.location.replace("/orders/orderDetails/"+$(e).attr('id'));
}

function cancelOrder(e) {
	$.ajax({
		method: 'post',
        url: '/joineds/cancel',
        data: {oid:$(e).prev().attr('id'), authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        success: function(result){
        	$(e).prev().remove()
        	$(e).remove()
        }
	})
}