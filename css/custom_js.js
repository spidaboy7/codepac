
   function stylePreview() {
    $("#wmd-preview pre").addClass("prettyprint");
    $("#wmd-preview code").html(prettyPrintOne($("#wmd-preview code").html()));
}

$(document).ready(function() {
        $('#wmd-input').keydown(function() {
            
     $(this).stopTime();
     $(this).oneTime(1000, function() { stylePreview(); }); 
      });
    });

function downVoteAnswer(id){
	var data= $.get("/codepacu/index.php/answer/downvote/id/"+id,
	function(data){
	$('#ans-downvote-'+id).text(data);
	});
}

