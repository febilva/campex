module ApplicationHelper
  def options_for_select_with_add_new(model, prerequisite = nil, condition = nil)
    model_constant = model.to_s.split("_").collect(&:capitalize).join.constantize
    options_array = model_constant
    options_array = condition.nil? ? options_array.all : options_array.where(condition[:field] => condition[:value])
    options_array = options_array.collect{ |instance| [instance.code, instance.id] } << 
      ["Create and Edit...", "", {class: "add_new_option", "data-controller" => model, 
        "data-prerequisite" => prerequisite}]
    options_array.unshift(["", ""])
    options_for_select(options_array)
  end
end
