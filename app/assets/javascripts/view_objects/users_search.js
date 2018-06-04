function VO() {
}

VO.UserSearch = function () {
};

// Values
VO.UserSearch.NAME                 = "users";
VO.UserSearch.BASE_URL             = "/en/admin/users";
VO.UserSearch.SEARCH_COLUMN        = "#" + VO.UserSearch.NAME +  "-search-column";
VO.UserSearch.SEARCH_SELECTED_COL  = VO.UserSearch.SEARCH_COLUMN + " option:selected";
VO.UserSearch.SEARCH_BTN           = "#" + VO.UserSearch.NAME +  "-search";
VO.UserSearch.SEARCH_TEXT          = "#" + VO.UserSearch.NAME +  "-search-text";
VO.UserSearch.SEARCH_FORM          = "#" + VO.UserSearch.NAME +  "-search-form";
VO.UserSearch.TABLE_CONTENTS       = "#" + VO.UserSearch.NAME +  "-contents";
VO.UserSearch.SEARCH_COND_GROUP    = "#" + VO.UserSearch.NAME +  "-search-conditions";
VO.UserSearch.SEARCH_COND_CHILDREN = VO.UserSearch.SEARCH_COND_GROUP + " div";
VO.UserSearch.COND_DELETE          = "#" + VO.UserSearch.NAME +  "-delete-condition";
VO.UserSearch.PAGER_A_PAGE         = "#users-pagination .page.item";
VO.UserSearch.NOTIFICATION_LANE    = "#" + VO.UserSearch.NAME +   "-notifications";
VO.UserSearch.LOADING_DIMMER       = ".ui.active.dimmer";
VO.UserSearch.NOTICE_DURATION      = 2000;
VO.UserSearch.USERS_UX_DURATION    = 500;

// Functions
VO.UserSearch.createdCard = function(condition) {
  var parsed = Action.UserSearch.parseCondition(condition);
  var name = "";

  gon.conditions.forEach(function(condition) {
    if (condition.column === parsed.column) {
      name = condition.name;
    }
  });

  return '<div class="ui image violet label search-condition" data-column="' + condition + '">\n' +
            name + ' ' + parsed.type + ' ' + parsed.text +
         '  <i class="delete icon" id="' + VO.UserSearch.NAME +  "-delete-condition" + '"></i>\n' +
         '</div>';
};

VO.UserSearch.getNotification = function(color, msg, subMsg) {
  return '<div class="ui ' + color + ' message">' +
         '  <i class="close icon" id="' + VO.UserSearch.COND_DELETE +'"></i>' +
         '  <div class="header">' +
            msg +
         '  </div>' +
         '  <p>' + subMsg + '</p>' +
         '</div>';
};

// Elements
VO.UserSearch.SegmentLoding = '<div class="ui active dimmer"><div class="ui text loader">Loading</div></div>';
VO.UserSearch.SearchInputBox = '<input id="' + VO.UserSearch.NAME +  "-search-text" + '" type="text" placeholder="Search...">';
VO.UserSearch.SearchSelectBox = function(selected) {
  var html = "";
  html += '<select id="' + VO.UserSearch.NAME +  "-search-text" + '" class="ui compact selection dropdown" style="width: 100%; border-radius: 0;">';

  gon.conditions.forEach(function(condition) {
    if (condition.column === selected) {

      condition.select.forEach(function(select) {
        html += '<option selected value="' + select.column + '">';
        html +=    select.name;
        html += '</option>';
      });
    }
  });

  html += '</select>';
  return html;
};
