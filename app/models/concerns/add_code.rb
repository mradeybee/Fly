module AddCode
	def add_code
    raw = [('a'..'z'),(0..9)].map { |i| i.to_a }.flatten
   (0...15).map { raw[rand(raw.length)] }.join
  end
end
    