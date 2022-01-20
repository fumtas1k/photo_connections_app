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
  });
  $("#mini-menu-btn").on("click",function(e){
    $("#mini-menu-wrapper").slideToggle(100);
    e.stopPropagation();
  });
  $("#show-mini-menu-wrapper").hide();
  $(document).on("click",function(){
    $("#show-mini-menu-wrapper").slideUp(100);
  });
  $("#show-menu-btn").on("click",function(e){
    $("#show-mini-menu-wrapper").slideToggle(100);
    e.stopPropagation();
  });
});