class ChangeDatatypeBooleanToIntegerRetinas < ActiveRecord::Migration[5.0]
  def change
  	change_column :retinas, :kidney_renal, 'integer USING CAST (kidney_renal AS integer)'
  	change_column :retinas, :kidney_micro_album, 'integer USING CAST (kidney_micro_album AS integer)'
  	change_column :retinas, :smoking, 'integer USING CAST (smoking AS integer)'
  	change_column :retinas, :smoking_related_lung_disease, 'integer USING CAST (smoking_related_lung_disease AS integer)'
  	change_column :retinas, :cad_stroke, 'integer USING CAST (cad_stroke AS integer)'
  	change_column :retinas, :good_follow_up, 'integer USING CAST (good_follow_up AS integer)'
  end
end
