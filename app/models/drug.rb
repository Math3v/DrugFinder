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
  belongs_to :click

  def self.searchable_language
    'unaccent_simple'
  end

  def self.search_by_more_attr_texticle(query)
    params = { name: query, label: query, form: query, usage: query }
    should_be_exclusive = false
    basic_search(params, should_be_exclusive)
  end

  def self.generate_string_to_execute params
    parlen = params.length
    i = 0
    param_string=[]
    str_to_exec = '%bolesti%'

    while i < parlen
      param_string[i]='hlav' if params[i].eql? '5'
      param_string[i]='oci' if params[i].eql? '1'
      param_string[i]='nos' if params[i].eql? '3'
      param_string[i]='zub' if params[i].eql? '4'
      param_string[i]='krk' if params[i].eql? '8'
      param_string[i]='uch' if params[i].eql? '6'
      param_string[i]='ramen' if params[i].eql? '9'
      param_string[i]='hrudn' if params[i].eql? '11'
      param_string[i]='bruch' if params[i].eql? '16'
      param_string[i]='ruk' if params[i].eql? '12'
      param_string[i]='predlakt' if params[i].eql? '14'
      param_string[i]='dlan' if params[i].eql? '18'
      param_string[i]='semenn' if params[i].eql? '17'
      param_string[i]='stehn' if params[i].eql? '20'
      param_string[i]='kolen' if params[i].eql? '22'
      param_string[i]='noh' if params[i].eql? '24'
      param_string[i]='chodidl' if params[i].eql? '26'

      str_to_exec += param_string[i] + '%'
      i = i + 1
    end

    return str_to_exec

  end

  def self.generate_sql_from_clicks params
    str_to_exec = generate_string_to_execute(params)

    # SQL Select
    inner = Drug.joins('JOIN clicks ON (clicks.drug_id = drugs.id)').where("label ILIKE '#{str_to_exec}' OR usage ILIKE '#{str_to_exec}'").order('clicks.no_of_clicks DESC').to_sql
    sql = "SELECT DISTINCT ON (tmp.name) * FROM (#{inner}) as tmp"

    return sql

  end

  def self.find_drugs_by_clicks params
    str_to_exec = generate_string_to_execute(params)

    # SQL Select
    Drug.select('DISTINCT ON (drugs.name) drugs.*').joins('JOIN clicks ON clicks.drug_id = drugs.id')
      .where("label ILIKE '#{str_to_exec}' OR usage ILIKE '#{str_to_exec}'")
  end

end
