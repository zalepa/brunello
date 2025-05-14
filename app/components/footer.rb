class Components::Footer < Components::Base
  def view_template
    footer(class: "bg-brunello-coal text-white py-1 text-center text-xs") {
      p { "© #{Time.current.year} Purity Labs LLC. All rights reserved." }
    }
  end
end
