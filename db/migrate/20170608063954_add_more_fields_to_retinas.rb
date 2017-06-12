class AddMoreFieldsToRetinas < ActiveRecord::Migration[5.0]
  def change
    add_column :retinas, :lipid_profile, :integer
    add_column :retinas, :kidney_renal, :boolean
    add_column :retinas, :kidney_micro_album, :boolean
    add_column :retinas, :kidney_creatinine, :integer
    add_column :retinas, :smoking, :boolean
    add_column :retinas, :smoking_related_lung_disease, :boolean
    add_column :retinas, :diabetic_duration, :integer
    add_column :retinas, :cad_stroke, :boolean
    add_column :retinas, :good_follow_up, :boolean
  end
end
