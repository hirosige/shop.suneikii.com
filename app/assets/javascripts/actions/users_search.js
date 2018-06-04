function Action(){
}

Action.UserSearch = function () {
  this.currentConditions = [];
};

Action.UserSearch.onLoading = function() {
  $(VO.UserSearch.SEARCH_BTN).addClass('loading');
  $(VO.UserSearch.SegmentLoding).appendTo($(VO.UserSearch.TABLE_CONTENTS));
};

Action.UserSearch.offLoading = function() {
  $(VO.UserSearch.SEARCH_BTN).removeClass('loading');
  $(VO.UserSearch.LOADING_DIMMER).remove();
};

Action.UserSearch.offLoading = function() {
  $(VO.UserSearch.SEARCH_BTN).removeClass('loading');
  $(VO.UserSearch.LOADING_DIMMER).remove();
};

Action.UserSearch.updateConditions = function() {
  Action.UserSearch.currentConditions = [];

  $(VO.UserSearch.SEARCH_COND_CHILDREN).each(function() {
    Action.UserSearch.currentConditions.push($(this).data('column').trim());
  })
};

Action.UserSearch.getNotification = function() {
  return VO.UserSearch.getNotification('orange', 'This condition is already added.', 'Try another one');
};

Action.UserSearch.getEmptyAlert = function() {
  return VO.UserSearch.getNotification('orange', 'Your input is empty.', 'Please select or input.');
};

Action.UserSearch.getAjaxReqError = function(err) {
  return VO.UserSearch.getNotification('red', 'Something wrong with API Request', err);
};

Action.UserSearch.showMsg = function(msgHTML) {
  $(msgHTML)
    .appendTo(VO.UserSearch.NOTIFICATION_LANE)
    .hide()
    .transition('swing down', function() {
      var newNotice = $(this);

      setTimeout(function() {
        newNotice.transition('swing down', function() {
          this.remove();
        });
      }, VO.UserSearch.NOTICE_DURATION);

      Action.UserSearch.offLoading();
    })
};

Action.UserSearch.isDuplicatedCond = function(condition) {
  if (Action.UserSearch.currentConditions.includes(condition)) return true;
  else return false;
};

Action.UserSearch.isValid = function() {
  var column = $(VO.UserSearch.SEARCH_COLUMN).val();
  var text   = $(VO.UserSearch.SEARCH_TEXT).val();
  var condition = column + ' like ' + text;

  return !Action.UserSearch.isBlank(text) && !Action.UserSearch.isDuplicatedCond(condition);
};

Action.UserSearch.GET_users = function(url, params) {
  return $.ajax({
    url: url,
    type: 'GET',
    data: params,
    dataType: 'html'
  });
};

Action.UserSearch.getConditionCards = function(condition) {
  var current = Action.UserSearch.parseCondition(condition);
  var element = [];

  Action.UserSearch.currentConditions.forEach(function(curCond) {
    var old = Action.UserSearch.parseCondition(curCond);

    if (old.column !== current.column) {
      element.push(VO.UserSearch.createdCard(curCond));
    }
  });

  if (!Action.UserSearch.isBlank(current.text)) element.push(VO.UserSearch.createdCard(condition));

  return element.join('');
};

Action.UserSearch.isBlank = function(item) {
  if (item === "null") return true;
  if (item === null) return true;
  if (item === "") return true;
  return false;
};

Action.UserSearch.getQuery = function(page) {
  var newColumn = $(VO.UserSearch.SEARCH_COLUMN).val();
  var newText   = $(VO.UserSearch.SEARCH_TEXT).val();
  var query = {
    "q":{},
    "page": page
  };

  if (Action.UserSearch.currentConditions.length) {
    Action.UserSearch.currentConditions.forEach(function(condition) {
      var parsed = Action.UserSearch.parseCondition(condition);
      query['q'][parsed.column + '_cont'] = parsed.text;
    })
  }

  if (!Action.UserSearch.isBlank(newText)) {
    query['q'][newColumn + '_cont'] = newText;
  }

  return query;
};

Action.UserSearch.clearCondition = function() {
  $(VO.UserSearch.SEARCH_COND_GROUP).empty();
};

Action.UserSearch.clearText = function() {
  $(VO.UserSearch.SEARCH_TEXT).val('');
};

Action.UserSearch.parseCondition = function(condition) {
  var parsed = condition.split(' ');
  return {
    "column": parsed[0],
    "type":   parsed[1],
    "text":   parsed[2]
  }
};

Action.UserSearch.displayCards = function() {
  var html = Action.UserSearch.getConditionCards(
    $(VO.UserSearch.SEARCH_COLUMN).val() + ' like ' + $(VO.UserSearch.SEARCH_TEXT).val(),
    $(VO.UserSearch.SEARCH_COLUMN).text()
  );

  $(html)
    .appendTo(VO.UserSearch.SEARCH_COND_GROUP)
    .hide()
    .transition('swing down');
};

Action.UserSearch.delayAction = function(duration) {
  return new Promise(function (resolve, reject) {
    setTimeout(function () {
      resolve('hello')
    }, duration);
  });
};

Action.UserSearch.updateTableContents = function(html) {
  $(VO.UserSearch.TABLE_CONTENTS).html(html);
};