$(function() {

  // When you click search btn
  $(VO.Users.SEARCH_BTN).on('click', function() {
    Action.Users.onLoading();
    Action.Users.updateConditions();

    if (Action.Users.isValid()) {
      Action.Users.clearCondition();

      Action.Users.delayAction(VO.Users.USERS_UX_DURATION)
        .then(function() {

          return Action.Users.GET_users(
            /** url       =>  **/ VO.Users.BASE_URL,
            /** send_data =>  **/ Action.Users.getQuery(1)
          );

        }).then(function(responseHTML) {

          Action.Users.updateTableContents(responseHTML);
          Action.Users.displayCards();
          Action.Users.offLoading();
          Action.Users.clearText();

        }).catch(function(jqXHR, textStatus, errorThrown) {
          var errorMsg = jqXHR.status + ': ' + errorThrown;
          Action.Users.showMsg(Action.Users.getAjaxReqError(errorMsg))
        });

    } else {
      if (Action.Users.isBlank($(VO.Users.SEARCH_TEXT).val())) {
        Action.Users.showMsg(Action.Users.getEmptyAlert())
      } else {
        Action.Users.showMsg(Action.Users.getNotification())
      }
    }
  });

  // when you click pager page btn
  $(document).on('click', VO.Users.PAGER_A_PAGE, function() {
    Action.Users.onLoading();
    Action.Users.updateConditions();
    var page = $(this).data('page');

    Action.Users.delayAction(VO.Users.USERS_UX_DURATION)
      .then(function() {

        return Action.Users.GET_users(
          /** url       =>  **/ VO.Users.BASE_URL,
          /** send_data =>  **/ Action.Users.getQuery(page)
        );

      }).then(function(responseHTML) {

        Action.Users.updateTableContents(responseHTML);
        Action.Users.displayCards();
        Action.Users.offLoading();

      }).catch(function(jqXHR, textStatus, errorThrown) {
        var errorMsg = jqXHR.status + ': ' + errorThrown;
        Action.Users.showMsg(Action.Users.getAjaxReqError(errorMsg))
      });
  });

  // when you click condition delete
  $(document).on('click', VO.Users.COND_DELETE, function() {
    var parent = $(this).parent();

    parent.transition('swing down', function() {
      this.remove();
      Action.Users.onLoading();
      Action.Users.updateConditions();
      Action.Users.clearText();
      Action.Users.clearCondition();

      Action.Users.delayAction(VO.Users.USERS_UX_DURATION)
        .then(function() {

          return Action.Users.GET_users(
            /** url       =>  **/ VO.Users.BASE_URL,
            /** send_data =>  **/ Action.Users.getQuery(1)
          );

        }).then(function(responseHTML) {

          Action.Users.updateTableContents(responseHTML);
          Action.Users.displayCards();
          Action.Users.offLoading();

        }).catch(function(jqXHR, textStatus, errorThrown) {
          var errorMsg = jqXHR.status + ': ' + errorThrown;
          Action.Users.showMsg(Action.Users.getAjaxReqError(errorMsg))
        });
    });
  });

  // when you change column select item
  $(VO.Users.SEARCH_COLUMN).on('change', function() {
    var currentInput = $(VO.Users.SEARCH_TEXT);
    var selected = $(this).val();

    switch ($(VO.Users.SEARCH_SELECTED_COL).data("type")) {
      case 'input':
        if (!currentInput.is(':text')) {
          $(VO.Users.SEARCH_TEXT).remove();
          $(VO.Users.SEARCH_FORM).prepend(VO.Users.SearchInputBox);
        }
        break;
      case 'select':
        $(VO.Users.SEARCH_TEXT).remove();
        $(VO.Users.SEARCH_FORM).prepend(VO.Users.SearchSelectBox(selected));
        break;
    }
  });

  // when click detail modal
  $(document).on('click', VO.Users.DETAIL_MODAL_OPEN, function() {
    $(VO.Users.DETAIL_MODAL).modal({
      centered: true,
      onHide: function(){
        $(VO.Users.DETAIL_PROFILE).empty();
        Action.Users.onProfileTab();
      }
    }).modal('show');

    var id = $(this).data('id');
    console.log(id);
    Action.Users.addLoadingClass(VO.Users.DETAIL_PROFILE);

    Action.Users.delayAction(VO.Users.USERS_UX_DURATION)
      .then(function() {
        console.log('test');

        return Action.Users.GET_users(
          /** url       =>  **/ VO.Users.BASE_URL  + '/' + id,
          /** send_data =>  **/ {}
        );

      }).then(function(responseHTML) {
        console.log(responseHTML);
      Action.Users.removeLoadingClass(VO.Users.DETAIL_PROFILE);
      $(VO.Users.DETAIL_PROFILE).append(responseHTML);

    }).catch(function(jqXHR, textStatus, errorThrown) {
      var errorMsg = jqXHR.status + ': ' + errorThrown;
      Action.Users.showMsg(Action.Users.getAjaxReqError(errorMsg))
    });
  });

  // when click delete modal
  $(document).on('click', VO.Users.DEL_MODAL_OPEN, function() {
    var id = $(this).data('id');

    $(VO.Users.DEL_MODAL).modal({
      centered: true,
      onHide: function(){
        $(VO.Users.DETAIL_PROFILE).empty();
      },
      onApprove: function() {
        Action.Users.delayAction(VO.Users.USERS_UX_DURATION)
          .then(function() {

            return Action.Users.DELETE_user(
              /** url       =>  **/ VO.Users.BASE_URL  + '/' + id,
              /** send_data =>  **/ {id: id}
            );

          }).then(function(responseHTML) {

          Action.Users.updateTableContents(responseHTML);
          Action.Users.showMsg(Action.Users.getDeleteCompMsg());

        }).catch(function(jqXHR, textStatus, errorThrown) {

          var errorMsg = jqXHR.status + ': ' + errorThrown;
          Action.Users.showMsg(Action.Users.getAjaxReqError(errorMsg))

        });
      },
      onDeny: function() {
        $(VO.Users.DEL_MODAL).modal('hide');
      }
    }).modal('show');
  });

  // click tab in detail modal
  $(document).on('click', VO.Users.DETAIL_PROFILE_TAB, function() {
    Action.Users.onProfileTab();
  });

  $(document).on('click', VO.Users.DETAIL_ACTIVITY_TAB, function() {
    Action.Users.onActivityTab();
  });

  $(document).on('click', VO.Users.DETAIL_CONTROL_TAB, function() {
    Action.Users.onControlTab();
  });
});
