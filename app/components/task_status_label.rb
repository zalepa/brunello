class Components::TaskStatusLabel < Components::Base
  def initialize(completed:)
    @completed = completed
  end

  def view_template
    if @completed
      span(class: "bg-brunello-plant text-lime-100 rounded-md px-2 font-semibold") { "DONE" }
    else
      span(class: "bg-brunello-rust text-red-100 rounded-md px-2 font-semibold") { "TODO" }
    end
  end
end
