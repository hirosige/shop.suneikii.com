$(function() {

  // When you click search btn
  $(VO.UserSearch.SEARCH_BTN).on('click', function() {
    Action.UserSearch.onLoading();
    Action.UserSearch.updateConditions();

    console.log(gon.conditions);

    if (Action.UserSearch.isValid()) {
      Action.UserSearch.clearCondition();

      Action.UserSearch.delayAction(VO.UserSearch.USERS_UX_DURATION)
        .then(function() {

          return Action.UserSearch.GET_users(
            /** url       =>  **/ VO.UserSearch.BASE_URL,
            /** send_data =>  **/ Action.UserSearch.getQuery(1)
          );

        }).then(function(responseHTML) {

          Action.UserSearch.updateTableContents(responseHTML);
          Action.UserSearch.displayCards();
          Action.UserSearch.offLoading();
          Action.UserSearch.clearText();

        }).catch(function(jqXHR, textStatus, errorThrown) {
          var errorMsg = jqXHR.status + ': ' + errorThrown;
          Action.UserSearch.showMsg(Action.UserSearch.getAjaxReqError(errorMsg))
        });

    } else {
      if (Action.UserSearch.isBlank($(VO.UserSearch.SEARCH_TEXT).val())) {
        Action.UserSearch.showMsg(Action.UserSearch.getEmptyAlert())
      } else {
        Action.UserSearch.showMsg(Action.UserSearch.getNotification())
      }
    }
  });

  // when you click pager page btn
  $(document).on('click', VO.UserSearch.PAGER_A_PAGE, function() {
    Action.UserSearch.onLoading();
    Action.UserSearch.updateConditions();
    var page = $(this).data('page');

    Action.UserSearch.delayAction(VO.UserSearch.USERS_UX_DURATION)
      .then(function() {

        return Action.UserSearch.GET_users(
          /** url       =>  **/ VO.UserSearch.BASE_URL,
          /** send_data =>  **/ Action.UserSearch.getQuery(page)
        );

      }).then(function(responseHTML) {

        Action.UserSearch.updateTableContents(responseHTML);
        Action.UserSearch.displayCards();
        Action.UserSearch.offLoading();

      }).catch(function(jqXHR, textStatus, errorThrown) {
        var errorMsg = jqXHR.status + ': ' + errorThrown;
        Action.UserSearch.showMsg(Action.UserSearch.getAjaxReqError(errorMsg))
      });
  });

  // when you click condition delete
  $(document).on('click', VO.UserSearch.COND_DELETE, function() {
    var parent = $(this).parent();

    parent.transition('swing down', function() {
      this.remove();
      Action.UserSearch.onLoading();
      Action.UserSearch.updateConditions();
      Action.UserSearch.clearText();
      Action.UserSearch.clearCondition();

      Action.UserSearch.delayAction(VO.UserSearch.USERS_UX_DURATION)
        .then(function() {

          return Action.UserSearch.GET_users(
            /** url       =>  **/ VO.UserSearch.BASE_URL,
            /** send_data =>  **/ Action.UserSearch.getQuery(1)
          );

        }).then(function(responseHTML) {

          Action.UserSearch.updateTableContents(responseHTML);
          Action.UserSearch.displayCards();
          Action.UserSearch.offLoading();

        }).catch(function(jqXHR, textStatus, errorThrown) {
          var errorMsg = jqXHR.status + ': ' + errorThrown;
          Action.UserSearch.showMsg(Action.UserSearch.getAjaxReqError(errorMsg))
        });
    });
  });

  // when you change column select item
  $(VO.UserSearch.SEARCH_COLUMN).on('change', function() {
    var currentInput = $(VO.UserSearch.SEARCH_TEXT);
    var selected = $(this).val();

    switch ($(VO.UserSearch.SEARCH_SELECTED_COL).data("type")) {
      case 'input':
        if (!currentInput.is(':text')) {
          $(VO.UserSearch.SEARCH_TEXT).remove();
          $(VO.UserSearch.SEARCH_FORM).prepend(VO.UserSearch.SearchInputBox);
        }
        break;
      case 'select':
        $(VO.UserSearch.SEARCH_TEXT).remove();
        $(VO.UserSearch.SEARCH_FORM).prepend(VO.UserSearch.SearchSelectBox(selected));
        break;
    }
  });
});
