module RetinaStepsHelper
	def lay_retina_tn
      str=""
	  for i in 1..100 do 
	    str += content_tag(:a, content_tag(:img, "", {class: "example-image", alt: "", src: image_path("100retinas/1o_tn.jpg")}), { class: "example-image-link", href: image_path("100retinas/"+ i.to_s + "o.jpg"), 'data-lightbox': "example-set", 'data-title': "Click the right half of the image to move forward." })
	    if i % 9 == 0 # break line post laying 9 tn 
	    	str += "\n"
	    end 
	  end
	  return str 
	end 
end 
