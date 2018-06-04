$(function() {
  $('.ui.dropdown').on('click')
    .dropdown()
  ;

  $('.ui.accordion')
    .accordion()
  ;

  $('.visible.example .ui.sidebar')
    .sidebar({
      context: '.visible.example .bottom.segment'
    })
    .sidebar('hide')
  ;

  $('#side-menu').click(function() {
    $('.ui.sidebar')
      .sidebar('toggle')
    ;

  });

  $(document).on('click','#notifications #delete', function() {
    $(this).transition('swing down', function() {
      this.remove();
    });
  });

  $('.menu .item')
    .tab()
  ;
});
