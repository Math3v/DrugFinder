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
    params = {name: query, label: query, form: query, usage: query}
    should_be_exclusive = false
    basic_search(params, should_be_exclusive)
  end

  def self.generate_string_to_execute params
    parlen = params.length
    i = 0
    param_string=[]
    str_to_exec = '%bolest_%('

    while i < parlen
      param_string[i]='\mhlav_\M|\ml_cn|\ml_c\M' if params[i].eql? '5'
      param_string[i]='\mo_i\M|\mo__\M|\moka\M|\mvie_ok|\mvie_ku' if params[i].eql? '1'
      param_string[i]='\mnos_\M|\mnozdier\M' if params[i].eql? '3'
      param_string[i]='\mzubov\M|\mzub\M|\mjazyk_\M|\mjazyk\M|\mmandl_\M' if params[i].eql? '4'
      param_string[i]='\mkrk\M|\mmandl_\M|\mkr_n|\mpa_er_ka' if params[i].eql? '8'
      param_string[i]='\mucha\M|\mu_i\M|mu__\M' if params[i].eql? '6'
      param_string[i]='\mramen|\mramien\M' if params[i].eql? '9'
      param_string[i]='\mhrudn|\mprsia|\mbradav|\msrdc' if params[i].eql? '11'
      param_string[i]='\mbruch|\mbru_n|\m_al_do' if params[i].eql? '16'
      param_string[i]='\msvalov' if params[i].eql? '12'
      param_string[i]='\msvalov' if params[i].eql? '14'
      param_string[i]='\mdlan' if params[i].eql? '18'
      param_string[i]='\msemenn|\mpenis|\mvaje_n_k|\mmie_ka\M|\mmie_ok\M' if params[i].eql? '17'
      param_string[i]='\mstehn|\mstehenn|\mstehien|\msvalov' if params[i].eql? '20'
      param_string[i]='\mkolen|\mkolien' if params[i].eql? '22'
      param_string[i]='\mn_h\M|\mp___ala\M|\mp____aly\M' if params[i].eql? '24'
      param_string[i]='\mchodidl|\mchodidiel' if params[i].eql? '26'

      str_to_exec += param_string[i]
      str_to_exec += '|' if i < (parlen - 1)
      str_to_exec += ')%' if i == (parlen - 1)
      i = i + 1
    end

    return str_to_exec

  end

  def self.generate_sql_from_clicks params
    str_to_exec = generate_string_to_execute(params)

    # SQL Select
    inner = Drug.joins('JOIN clicks ON (clicks.drug_id = drugs.id)').where("label SIMILAR TO '#{str_to_exec}' OR usage SIMILAR TO '#{str_to_exec}'").order('clicks.no_of_clicks DESC').to_sql
    sql = "SELECT DISTINCT ON (tmp.name) * FROM (#{inner}) as tmp"

    return sql

  end

  def self.find_drugs_by_clicks params
    str_to_exec = generate_string_to_execute(params)

    # SQL Select
    Drug.joins('JOIN clicks ON clicks.drug_id = drugs.id')
    .where('label SIMILAR TO ? OR usage SIMILAR TO ?', str_to_exec, str_to_exec).order('clicks.no_of_clicks DESC')
  end

end
