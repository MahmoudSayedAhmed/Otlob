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