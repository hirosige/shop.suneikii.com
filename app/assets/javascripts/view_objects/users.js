function VO() {
}

VO.Users = function () {
};

// Base
VO.Users.NAME                  = "users";
VO.Users.BASE_URL              = "/en/admin/users";

// Table
VO.Users.TABLE_CONTENTS        = "#" + VO.Users.NAME +  "-contents";
VO.Users.TABLE_CONTENTS_DETAIL = "#" + VO.Users.NAME +  "-table-contents";

// Search
VO.Users.SEARCH_COLUMN         = "#" + VO.Users.NAME +  "-search-column";
VO.Users.SEARCH_SELECTED_COL   = VO.Users.SEARCH_COLUMN + " option:selected";
VO.Users.SEARCH_BTN            = "#" + VO.Users.NAME +  "-search";
VO.Users.SEARCH_TEXT           = "#" + VO.Users.NAME +  "-search-text";
VO.Users.SEARCH_FORM           = "#" + VO.Users.NAME +  "-search-form";
VO.Users.SEARCH_COND_GROUP     = "#" + VO.Users.NAME +  "-search-conditions";
VO.Users.SEARCH_COND_CHILDREN  = VO.Users.SEARCH_COND_GROUP + " div";
VO.Users.COND_DELETE           = "#" + VO.Users.NAME +  "-delete-condition";

// Modal
VO.Users.DETAIL_MODAL_OPEN     = "#" + VO.Users.NAME +  "-control > .detail";
VO.Users.DETAIL_MODAL          = ".ui.longer.modal." + VO.Users.NAME +  ".detail";
VO.Users.DETAIL_PROFILE        = "#" + VO.Users.NAME +  "-profile";
VO.Users.DETAIL_PROFILE_TAB    = VO.Users.DETAIL_PROFILE +  "-on";
VO.Users.DETAIL_ACTIVITY       = "#" + VO.Users.NAME +  "-activities";
VO.Users.DETAIL_ACTIVITY_TAB   = VO.Users.DETAIL_ACTIVITY +  "-on";
VO.Users.DETAIL_CONTROL        = "#" + VO.Users.NAME +  "-controls";
VO.Users.DETAIL_CONTROL_TAB    = VO.Users.DETAIL_CONTROL +  "-on";

VO.Users.DEL_MODAL_OPEN        = "#" + VO.Users.NAME +  "-control > .delete";
VO.Users.DEL_MODAL             = ".ui.mini.modal." + VO.Users.NAME +  ".delete";

// Notification
VO.Users.NOTIFICATION_LANE     = "#" + VO.Users.NAME +   "-notifications";

// Loading
VO.Users.LOADING_DIMMER        = ".ui.active.dimmer";

// Setting
VO.Users.NOTICE_DURATION       = 2000;
VO.Users.USERS_UX_DURATION     = 500;

// Pager
VO.Users.PAGER_A_PAGE          = "#" + VO.Users.NAME + "-pagination .page.item";

// Functions
VO.Users.createdCard = function(condition) {
  var parsed = Action.Users.parseCondition(condition);
  var name = "";

  gon.conditions.forEach(function(condition) {
    if (condition.column === parsed.column) {
      name = condition.name;
    }
  });

  return '<div class="ui image violet label search-condition" data-column="' + condition + '">\n' +
            name + ' ' + parsed.type + ' ' + parsed.text +
         '  <i class="delete icon" id="' + VO.Users.NAME +  "-delete-condition" + '"></i>\n' +
         '</div>';
};

VO.Users.getNotification = function(color, msg, subMsg) {
  return '<div class="ui ' + color + ' message">' +
         '  <i class="close icon" id="' + VO.Users.COND_DELETE +'"></i>' +
         '  <div class="header">' +
            msg +
         '  </div>' +
         '  <p>' + subMsg + '</p>' +
         '</div>';
};

// Elements
VO.Users.SegmentLoding = '<div class="ui active dimmer"><div class="ui text loader">Loading</div></div>';
VO.Users.SearchInputBox = '<input id="' + VO.Users.NAME +  "-search-text" + '" type="text" placeholder="Search...">';
VO.Users.SearchSelectBox = function(selected) {
  var html = "";
  html += '<select id="' + VO.Users.NAME +  "-search-text" + '" class="ui compact selection dropdown" style="width: 100%; border-radius: 0;">';

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
