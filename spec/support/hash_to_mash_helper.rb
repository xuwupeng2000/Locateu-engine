module HashToMashHelper

  def to_mash(hash)
    mash = Hashie::Mash.new(hash)
    mash
  end

end
