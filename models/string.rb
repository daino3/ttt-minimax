class String
  # colorization
  def bg_red         
    "\033[41m#{self}\033[0m" 
  end

  def bg_green          
    "\033[42m#{self}\033[0m"
  end
end