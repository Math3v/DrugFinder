class Statistic < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.generate_drugs_count
    Drug.all.count
  end

  def self.generate_holders_count
    Holder.all.count
  end

  def self.generate_producers_count
    Producer.all.count
  end

  def self.generate_suppliers_count
    Supplier.all.count
  end

  # @return [Object]
  def self.generate_users_count
    User.count
  end

  def self.generate_drugs_with_usage_count
    Drug.where('usage IS NOT NULL').count
  end

  def self.generate_drugs_with_label_count
    Drug.where('label IS NOT NULL').count
  end
end
