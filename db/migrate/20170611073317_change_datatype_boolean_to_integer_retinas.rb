class ChangeDatatypeBooleanToIntegerRetinas < ActiveRecord::Migration[5.0]
  def change
  	change_column :retinas, :kidney_renal, 'integer USING CAST (kidney_renal::integer)'
  	change_column :retinas, :kidney_micro_album, :integer
  	change_column :retinas, :smoking, :integer
  	change_column :retinas, :smoking_related_lung_disease, :integer
  	change_column :retinas, :cad_stroke, :integer
  	change_column :retinas, :good_follow_up, :integer
  end
end
