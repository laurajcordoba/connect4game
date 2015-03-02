$( document ).ready(function() {
  $('.tdelem').click(function(){
    var j      = $(this).data("j");
    var player = $(this).data("id");
    var index  = j + 1;

    var column = $('table tr td:nth-child(' + index + ').unmarked');

    if (column.get(0) === undefined){
      alert('Cannot insert more elements here, try again');
      return false;
    }

    var choosed_element = column.last();
    var i      = choosed_element.data("i");

    $.ajax({
      type: 'GET',
      url: '/push',
      data: { 'i': i, 'j':j, 'player_id':player },
      dataType: 'script'
    });
    return false;
  })
});
