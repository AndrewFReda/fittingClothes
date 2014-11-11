module ApplicationHelper

  def compare(mySize, compareSize)
    if mySize >= compareSize
      "#{mySize - compareSize} inches shorter"
    else
      "#{compareSize - mySize} inches longer"
    end

  end
end
