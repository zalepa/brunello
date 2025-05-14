class Components::DangerBanner < Components::Base
  def stripes
    div(class: "w-4 bg-amber-400 absolute h-full left-0 top-0 rounded-tl-md rounded-bl-md")
    div(class: "w-4 bg-black absolute h-full left-4 top-0")
    div(class: "w-4 bg-amber-400 absolute h-full left-8 top-0")
    div(class: "w-4 bg-black absolute h-full left-12 top-0")  
  end

  def view_template
    div(class: "relative m-10 text-xs text-center bg-slate-100 p-3 pl-10 rounded-md text-slate-600") {
      stripes
      p { "Warning. Brunello is in alpha and may lose data (temporarily or permanently) or be unavailable at times." }
      p { "Use at own risk" }
    }
  end
end
