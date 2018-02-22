class AttrValue < ApplicationValue
  def self.attr(attribute)
    I18n.t("activerecord.attributes.#{attribute}")
  end

  def self.admin(elem)
    I18n.t("admin.#{elem}")
  end

  def self.front(elem)
    I18n.t("front.#{elem}")
  end
end