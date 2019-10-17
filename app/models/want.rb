class Want < Ownership
  def self.count
    group(:item_id).count(:item_id)
  end
end
