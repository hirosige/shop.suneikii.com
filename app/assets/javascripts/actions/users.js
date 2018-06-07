function Action(){
}

Action.Users = function () {
  this.currentConditions = [];
};

Action.Users.addLoadingClass = function(target) {
  $(target).addClass('loading');
};

Action.Users.removeLoadingClass = function(target) {
  $(target).removeClass('loading');
};

Action.Users.activateClass = function(target) {
  $(target).addClass('active');
};

Action.Users.inactivateClass = function(target) {
  $(target).removeClass('active');
};

Action.Users.onLoading = function() {
  Action.Users.addLoadingClass(VO.Users.SEARCH_BTN);
  $(VO.Users.SegmentLoding).appendTo($(VO.Users.TABLE_CONTENTS_DETAIL));
};

Action.Users.offLoading = function() {
  Action.Users.removeLoadingClass(VO.Users.SEARCH_BTN);
  $(VO.Users.LOADING_DIMMER).remove();
};

Action.Users.updateConditions = function() {
  Action.Users.currentConditions = [];

  $(VO.Users.SEARCH_COND_CHILDREN).each(function() {
    Action.Users.currentConditions.push($(this).data('column').trim());
  })
};

Action.Users.onProfileTab = function() {
  [ VO.Users.DETAIL_PROFILE
    , VO.Users.DETAIL_PROFILE_TAB ]
    .map(function(target) {
      Action.Users.activateClass(target)
    });

  [ VO.Users.DETAIL_CONTROL
    , VO.Users.DETAIL_ACTIVITY
    , VO.Users.DETAIL_ACTIVITY_TAB
    , VO.Users.DETAIL_CONTROL_TAB ]
    .map(function(target) {
      Action.Users.inactivateClass(target)
    });
};

Action.Users.onActivityTab = function() {
  [ VO.Users.DETAIL_ACTIVITY
    , VO.Users.DETAIL_ACTIVITY_TAB ]
    .map(function(target) {
      Action.Users.activateClass(target)
    });

  [ VO.Users.DETAIL_CONTROL
    , VO.Users.DETAIL_PROFILE
    , VO.Users.DETAIL_PROFILE_TAB
    , VO.Users.DETAIL_CONTROL_TAB ]
    .map(function(target) {
      Action.Users.inactivateClass(target)
    });
};

Action.Users.onControlTab = function() {
  [ VO.Users.DETAIL_CONTROL
    , VO.Users.DETAIL_CONTROL_TAB ]
    .map(function(target) {
      Action.Users.activateClass(target)
    });

  [ VO.Users.DETAIL_ACTIVITY
    , VO.Users.DETAIL_PROFILE
    , VO.Users.DETAIL_PROFILE_TAB
    , VO.Users.DETAIL_ACTIVITY_TAB ]
    .map(function(target) {
      Action.Users.inactivateClass(target)
    });
};

Action.Users.getNotification = function() {
  return VO.Users.getNotification('orange', 'This condition is already added.', 'Try another one');
};

Action.Users.getEmptyAlert = function() {
  return VO.Users.getNotification('orange', 'Your input is empty.', 'Please select or input.');
};

Action.Users.getDeleteCompMsg = function() {
  return VO.Users.getNotification('success', 'User is successfully deleted', 'User is successfully deleted');
};

Action.Users.getAjaxReqError = function(err) {
  return VO.Users.getNotification('red', 'Something wrong with API Request', err);
};

Action.Users.showMsg = function(msgHTML) {
  $(msgHTML)
    .appendTo(VO.Users.NOTIFICATION_LANE)
    .hide()
    .transition('swing down', function() {
      var newNotice = $(this);

      setTimeout(function() {
        newNotice.transition('swing down', function() {
          this.remove();
        });
      }, VO.Users.NOTICE_DURATION);

      Action.Users.offLoading();
    })
};

Action.Users.isDuplicatedCond = function(condition) {
  if (Action.Users.currentConditions.includes(condition)) return true;
  else return false;
};

Action.Users.isValid = function() {
  var column = $(VO.Users.SEARCH_COLUMN).val();
  var text   = $(VO.Users.SEARCH_TEXT).val();
  var condition = column + ' like ' + text;

  return !Action.Users.isBlank(text) && !Action.Users.isDuplicatedCond(condition);
};

Action.Users.GET_users = function(url, params) {
  return $.ajax({
    url: url,
    type: 'GET',
    data: params,
    dataType: 'html'
  });
};

Action.Users.DELETE_user = function(url, params) {
  return $.ajax({
    url: url,
    type: 'DELETE',
    data: params,
    dataType: 'html'
  });
};

Action.Users.getConditionCards = function(condition) {
  var current = Action.Users.parseCondition(condition);
  var element = [];

  Action.Users.currentConditions.forEach(function(curCond) {
    var old = Action.Users.parseCondition(curCond);

    if (old.column !== current.column) {
      element.push(VO.Users.createdCard(curCond));
    }
  });

  if (!Action.Users.isBlank(current.text)) {
    // 重複してないgit ad
    if (Action.Users.currentConditions.indexOf(condition) === -1){
      element.push(VO.Users.createdCard(condition));
    }
  }

  return element.join('');
};

Action.Users.isBlank = function(item) {
  if (item === "null") return true;
  if (item === null) return true;
  if (item === "") return true;
  return false;
};

Action.Users.getQuery = function(page) {
  var newColumn = $(VO.Users.SEARCH_COLUMN).val();
  var newText   = $(VO.Users.SEARCH_TEXT).val();
  var query = {
    "q":{},
    "page": page
  };

  if (Action.Users.currentConditions.length) {
    Action.Users.currentConditions.forEach(function(condition) {
      var parsed = Action.Users.parseCondition(condition);
      query['q'][parsed.column + '_cont'] = parsed.text;
    })
  }

  if (!Action.Users.isBlank(newText)) {
    query['q'][newColumn + '_cont'] = newText;
  }

  return query;
};

Action.Users.clearCondition = function() {
  $(VO.Users.SEARCH_COND_GROUP).empty();
};

Action.Users.clearText = function() {
  console.log($(VO.Users.SEARCH_SELECTED_COL).data("type"));
  if ($(VO.Users.SEARCH_SELECTED_COL).data("type") === 'input') {
    $(VO.Users.SEARCH_TEXT).val('');
  }
};

Action.Users.parseCondition = function(condition) {
  var parsed = condition.split(' ');
  return {
    "column": parsed[0],
    "type":   parsed[1],
    "text":   parsed[2]
  }
};

Action.Users.displayCards = function() {
  var html = Action.Users.getConditionCards(
    $(VO.Users.SEARCH_COLUMN).val() + ' like ' + $(VO.Users.SEARCH_TEXT).val()
  );

  $(html)
    .appendTo(VO.Users.SEARCH_COND_GROUP)
    .hide()
    .transition('swing down');
};

Action.Users.delayAction = function(duration) {
  return new Promise(function (resolve, reject) {
    setTimeout(function () {
      resolve('hello')
    }, duration);
  });
};

Action.Users.updateTableContents = function(html) {
  $(VO.Users.TABLE_CONTENTS).html(html);
};
