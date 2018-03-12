module RetinasHelper

	def list_retinas

	end

	def display_clinical_params(retina)
	  "display_clinical_params called"
      str=""
      puts "HbA1c is : #{retina.hba1c}"

      if !retina.hba1c.nil?
      	str = content_tag(:p, "HbA1c is : #{retina.hba1c}\n")
      end

      puts "string is:" + str

      if !retina.lipid_profile.nil?
        str += content_tag(:p, "Serum Cholesterol: #{retina.lipid_profile}\n")
      end

      if !retina.kidney_renal.nil?
      	case retina.kidney_renal
      	when 0
          str += content_tag(:p, "Renal Involvement: No\n")
        when 1
          str += content_tag(:p, "Renal Involvement: Microalbumineuria\n")
        when 2
          str += content_tag(:p, "Renal Involvement: Creatinine > 1.6\n")
        when 3
          str += content_tag(:p, "Renal Involvement: Creatinine > 4\n")
        end
      end

      if !retina.smoking.nil?
      	case retina.smoking
      	when 0
          str += content_tag(:p, "Smoking : No\n")
        when 1
          str += content_tag(:p, "Smoking : Yes\n")
        when 2
          str += content_tag(:p, "Smoking : Related Lung Disease\n")
        end
      end

      #if !retina.smoking_related_lung_disease.nil?
       # str += content_tag(:p, "Smoking related lung disease : #{retina.smoking_related_lung_disease}\n")
      #end

      if !retina.diabetic_duration.nil?
      	case retina.diabetic_duration
      	when 4
          str += content_tag(:p, "Diabetic Duration : 5-10 Yrs\n")
        when 3
          str += content_tag(:p, "Diabetic Duration : 11-15 Yrs\n")
        when 2
          str += content_tag(:p, "Diabetic Duration : 16-20 Yrs\n")
        when 1
          str += content_tag(:p, "Diabetic Duration : >20 Yrs\n")
        end
      end

      if !retina.cad_stroke.nil?
      	case retina.cad_stroke
      	when 2
          str += content_tag(:p, "CAD/Stroke : Yes\n")
        when 0
          str += content_tag(:p, "CAD/Stroke : No\n")
        end
      end

      if !retina.good_follow_up.nil?
        case retina.good_follow_up
      	when 0
          str += content_tag(:p, "Good follow-up : Yes\n")
        when 5
          str += content_tag(:p, "Good follow-up : No\n")
        end
      end

      return str
	end
end
