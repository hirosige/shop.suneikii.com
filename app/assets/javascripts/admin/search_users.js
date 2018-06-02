$(function() {
  var currentConditions = [];

  var createCard = function(condition) {
    return '<div class="ui image violet label search-condition">\n' +
              condition + '\n' +
           '  <i class="delete icon" id="delete"></i>\n' +
           '</div>';
  };

  var getConditionCards = function(condition) {
    var element = "";
    var splitCondition = condition.split(' ');

    currentConditions.forEach(function(curCond) {
      var splitCurCond = curCond.split(' ');

      if (splitCurCond[0] !== splitCondition[0]) {
        element += createCard(curCond);
      } else if (!splitCondition[2].length) {
        element += createCard(curCond);
      }
    });

    if (splitCondition[2].length) {
      element += createCard(condition);
    }

    return element;
  };

  var getNotification = function() {
    return '<div class="ui orange message">' +
             '<i class="close icon" id="delete"></i>' +
             '<div class="header">' +
               'This condition is already added.' +
             '</div>' +
             '<p>Try another one</p>' +
           '</div>';
  };

  var getEmptyAlert = function() {
    return '<div class="ui orange message">' +
      '<i class="close icon" id="delete"></i>' +
      '<div class="header">' +
      'Your input is empty.' +
      '</div>' +
      '<p>Please select or input.</p>' +
      '</div>';
  };

  var toggleLoading = function(state, targetElement) {
    if (state === 'on') {
      $(targetElement).addClass('loading');
      var tableLoading = '<div class="ui active dimmer"><div class="ui text loader">Loading</div></div>';
          tableLoading += '<div class="ui active dimmer"><div class="ui text loader">Loading</div></div>';
      $(tableLoading).appendTo($('#table-contents'));
    } else {
      $(targetElement).removeClass('loading');
      $('.ui.active.dimmer').remove();
    }
  };

  var getQuery = function(newColumn, newText) {
    var query = {"q":{}};

    if (currentConditions.length) {
      currentConditions.forEach(function(condition) {
        splitted = condition.split(' ');
        if (splitted[0] === newColumn) {

        }
        query['q'][splitted[0] + '_cont'] = splitted[2];
      })
    }

    if (newText != null) {
      if (newText !== '') {
        query['q'][newColumn + '_cont'] = newText;
      }
    }

    return query;
  };

  var updateConditions = function() {
    currentConditions = [];

    $('#search-conditions div').each(function(index) {
      var pureCond = $(this).text().trim();
      currentConditions.push(pureCond);
    })
  };

  var isDuplicatedCond = function(condition) {
    if (currentConditions.includes(condition)) return true;
    else return false;
  };

  var mainProcess = function() {
    toggleLoading('on', this);
    updateConditions();

    var column = $("#search-column").val();
    var name = $("#search-column").text();
    var text   = $("#search-text").val();
    var condition = column + ' like ' + text;
    var condition_card = getConditionCards(condition, name);

    $("#search-text").val('');

    if (text !== null && !isDuplicatedCond(condition)) {
      $("#search-conditions").empty();

      setTimeout(function() {
        $.ajax({
          url: '/en/admin/users',
          type: 'GET',
          data: getQuery(column, text),
          dataType: 'html'
        }).done(function( data, textStatus, jqXHR ) {
          $('#users-contents').html(data);

          $(condition_card).appendTo("#search-conditions").hide().transition('swing down');
          toggleLoading('off', $('#search'));
        })
          .fail(function( jqXHR, textStatus, errorThrown ) {
            // ...
          })
          .always(function( jqXHR, textStatus ) {
            // ...
          });
      }, 500);

    } else {
      if (text === null) {
        $(getEmptyAlert()).appendTo("#notifications").hide().transition('swing down', function() {
          var newNotice = $(this);

          setTimeout(function() {
            newNotice.transition('swing down', function() {
              this.remove();
            });
          }, 2000);

          toggleLoading('off', $('#search'));
        })
      } else {
        $(getNotification()).appendTo("#notifications").hide().transition('swing down', function() {
          var newNotice = $(this);

          setTimeout(function() {
            newNotice.transition('swing down', function() {
              this.remove();
            });
          }, 2000);

          toggleLoading('off', $('#search'));
        })
      }
    }
  };

  var deleteProcess = function() {
    toggleLoading('on', this);
    updateConditions();

    var column = $("#search-column").val();
    var name = $("#search-column").text();
    var text   = $("#search-text").val();
    var condition = column + ' like ' + text;
    var condition_card = getConditionCards(condition, name);

    $("#search-text").val('');
    $("#search-conditions").empty();

    setTimeout(function() {
      $.ajax({
        url: '/en/admin/users',
        type: 'GET',
        data: getQuery(column, text),
        dataType: 'html'
      }).done(function( data, textStatus, jqXHR ) {
        $('#users-contents').html(data);

        $(condition_card).appendTo("#search-conditions").hide().transition('swing down');
        toggleLoading('off', $('#search'));
      })
        .fail(function( jqXHR, textStatus, errorThrown ) {
          // ...
        })
        .always(function( jqXHR, textStatus ) {
          // ...
        });
    }, 500);
  };

  $('#search-column').on('change', function() {
    var type = $("#search-column option:selected").data("type");
    var inputBox = '<input id="search-text" type="text" placeholder="Search...">';
    var selectBox = '<select id="search-text" class="ui compact selection dropdown" style="width: 100%; border-radius: 0;">' +
      '      <option selected value="customer" data-type="input">' +
      '        Customer' +
      '      </option>' +
      '      <option value="staff" data-type="select">' +
      '        Staff' +
      '      </option>' +
      '      <option value="provider" data-type="select">' +
      '        Provider' +
      '      </option>' +
      '      <option value="admin" data-type="select">' +
      '        Admin' +
      '      </option>' +
      '  </select>';

    if (type === 'select') {
      $('#search-text').remove();
      $('#search-form').prepend(selectBox);
    } else {
      $('#search-text').remove();
      $('#search-form').prepend(inputBox);
    }
  });

  $("#search").on('click', function() {
    mainProcess();
  });

  $(document).on('click','#delete', function() {
    var parent = $(this).parent();

    parent.transition('swing down', function() {
      this.remove();
      deleteProcess();
    });
  });
});