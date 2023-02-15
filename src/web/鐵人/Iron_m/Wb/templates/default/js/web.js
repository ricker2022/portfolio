//推文

function push_up(sn,url,thisObj){
   $.ajax({
    url: url,
    cache: false,
    dataType: "json",
    data:{sn:sn},
    type:"GET",
    success: function (data) {
        call_fancybox(data.message,data.success);     
    },
    complete:function(){
      thisObj.removeClass('processing');
    }
  })
}
function push_upPost(sn, url, thisObj) {
    $.ajax({
        url: url,
        cache: false,
        dataType: "json",
        data: { sn: sn },
        type: "POST",
        success: function (data) {
            call_fancybox(data.message, data.success);
        },
        complete: function () {
            thisObj.removeClass('processing');
        }
    })
}
//msg box

function call_fancybox(msg,reloadTxt){
    $.fancybox( '<div class="alert_message">'+msg+'</div>',{padding:5,afterClose:function(){if(reloadTxt=="ok"){document.location.reload();}}});

}

//判斷字數
 function check_textarea_length(dom,text_length){
  if(dom.val().length <= text_length){
    return true;
  }
}
