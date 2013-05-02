# == Schema Information
#
# Table name: drugs
#
#  id            :integer          not null, primary key
#  name          :string(200)
#  code          :string(200)
#  sukl_name_old :string(200)
#  label         :string(6000)
#  usage         :string(3500)
#  admin         :boolean
#  producer_id   :integer
#  holder_id     :integer
#  supplier_id   :integer
#  form          :string(200)
#  sukl_name     :string(400)
#

class Drug < ActiveRecord::Base

  attr_accessible :code, :form, :holder_id, :id, :label, :name, :sukl_name, :supplier_id, :usage
  belongs_to :supplier
  belongs_to :producer
  belongs_to :holder

  # pg_search gem
  #include PgSearch
  #pg_search_scope :search_by_more_attr, :against => :name
  #pg_search_scope :search_by_more_attr, :against => {:name => 'A', :label => 'C', :usage => 'B', :form => 'D'}, :using => [:tsearch]
  #pg_search_scope :search_by_clicks, :against => {:label => 'A', :usage => 'B'}, :using => [:tsearch]

  scope :recent_u, order("updated_at desc").limit(3) # In controller use: Drug.recent_u to see recent updated drugs
  scope :recent_c, order("created_at desc").limit(3) # In controller use: Drug.recent_a to see recent created drugs

  # Texticle
  #scope :search_by_more_attr_texticle, lambda { |query| search_by_name_or_by_form_or_by_label_or_by_usage(query, query) }

  def self.searchable_language
    'unaccent_simple'
  end

  def self.search_by_more_attr_texticle(query)
    params = { name: query, label: query, form: query, usage: query }
    should_be_exclusive = false
    basic_search(params, should_be_exclusive)
  end

  def self.find_drugs_like_name name
   Drug.where(["name ILIKE ?","#{name}%"])
  end

  def self.find_drugs_like pattern
    Drug.where("name ILIKE '%#{pattern}%' OR usage ILIKE '%#{pattern}%' OR label ILIKE '%#{pattern}%' OR form ILIKE '%#{pattern}%'")
  end

  def self.find_drugs_like_usage name
    Drug.where(["usage ILIKE ?", "%#{name}%"])
  end

  def self.find_drugs_like_label name
    Drug.where(["label ILIKE ?", "%#{name}%"])
  end

  def self.find_drugs_like_form name
    Drug.where(["form ILIKE ?", "%#{name}%"])
  end

  def self.find_drugs_by_name_texticle name
      Drug.search(:title => name)
  end

  def self.find_drugs_by_form_texticle form
    Drug.search(:form => form)
  end

  def self.find_drugs_by_label label
    Drug.search(:label => label)
  end

  def self.find_drugs_by_usage usage
    Drug.search(:usage => usage)
  end

  def self.find_drugs_by_clicks params
    #params.each do |num|
    #  param_string="bolesti hlavy" if num.eql? '1'
    #end

    parLen = params.length
    i = 0
    param_string=[]

    while i < parLen
      param_string[i]="hlav" if params[i].eql? '5'
      param_string[i]="oka" if params[i].eql? '1'
      param_string[i]="nos" if params[i].eql? '3'
      param_string[i]="zub" if params[i].eql? '4'
      param_string[i]="krk" if params[i].eql? '8'
      param_string[i]="uch" if params[i].eql? '6'
      param_string[i]="ramen" if params[i].eql? '9'
      param_string[i]="hrudn" if params[i].eql? '11'
      param_string[i]="bruch" if params[i].eql? '16'
      param_string[i]="ruk" if params[i].eql? '12'
      param_string[i]="predlakt" if params[i].eql? '14'
      param_string[i]="dlan" if params[i].eql? '18'
      param_string[i]="semenn" if params[i].eql? '17'
      param_string[i]="stehn" if params[i].eql? '20'
      param_string[i]="kolen" if params[i].eql? '22'
      param_string[i]="holen" if params[i].eql? '24'
      param_string[i]="chodidl" if params[i].eql? '26'

      i = i + 1
    end

    if parLen == 3 then
      Drug.where("usage ILIKE '%boles%#{param_string[0]}%#{param_string[1]}%#{param_string[2]}%' OR label ILIKE '%boles%#{param_string[0]}%#{param_string[1]}%#{param_string[2]}%'")
    elsif parLen == 2 then
      Drug.where("usage ILIKE '%boles%#{param_string[0]}%#{param_string[1]}%' OR label ILIKE '%boles%#{param_string[0]}%#{param_string[1]}%'")
    elsif parLen == 1 then
      Drug.where("usage ILIKE '%boles%#{param_string[0]}%' OR label ILIKE '%boles%#{param_string[0]}%'")
    end
  end

end
