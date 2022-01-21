require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "bootstrap";
import "../stylesheets/application";

$(document).on('turbolinks:load', function() {
  $("#mini-menu-wrapper").hide();
  $(document).on("click",function(){
    $("#mini-menu-wrapper").slideUp(100);
    $("#show-mini-menu-wrapper").slideUp(100);
  });
  $("#mini-menu-btn").on("click",function(e){
    $("#mini-menu-wrapper").slideToggle(100);
    e.stopPropagation();
  });
  $("#show-mini-menu-wrapper").hide();
  $("#show-menu-btn").on("click",function(e){
    $("#show-mini-menu-wrapper").slideToggle(100);
    e.stopPropagation();
  });

  function judge_btn_active(check_class){
    let flag = true;
    $(check_class).each(function(index){
      if ($(check_class).eq(index).val() == ""){
        flag = false;
        return false;
      }
    });
    return flag;
  }
  function set_btn_state(target_id, check_class){
    if (judge_btn_active(check_class)){
      $(target_id).prop("disabled", false);
    }else{
      $(target_id).prop("disabled", true);
    }
  }

  set_btn_state("#active-btn", ".judge-active");
  $(".judge-active").on("keyup", function(){
    set_btn_state("#active-btn", ".judge-active");
  });

});