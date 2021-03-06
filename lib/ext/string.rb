class String
  # To change this template use File | Settings | File Templates.

  ACCENTS_MAPPING = {
      'E' => [200,201,202,203],
      'e' => [232,233,234,235],
      'A' => [192,193,194,195,196,197],
      'a' => [224,225,226,227,228,229,230],
      'C' => [199],
      'c' => [231],
      'O' => [210,211,212,213,214,216],
      'o' => [242,243,244,245,246,248],
      'I' => [204,205,206,207],
      'i' => [236,237,238,239],
      'U' => [217,218,219,220],
      'u' => [249,250,251,252],
      'N' => [209],
      'n' => [241],
      'Y' => [221],
      'y' => [253,255],
      'AE' => [306],
      'ae' => [346],
      'OE' => [188],
      'oe' => [189]
  }

  # Remove the accents from the string. Uses String::ACCENTS_MAPPING as the source map.
  def remove_accents
    str = String.new(self)
    String::ACCENTS_MAPPING.each {|letter,accents|
      packed = accents.pack('U*')
      rxp = Regexp.new("[#{packed}]", nil, 'U')
      str.gsub!(rxp, letter)
    }

    str
  end

  def urlize(options = {})
    options[:downcase] ||= true
    options[:convert_spaces] ||= false
    options[:regexp] ||= /[^-_A-Za-z0-9]/

    str = self.strip.removeaccents
    str.downcase! if options[:downcase]
    str.gsub!(/\ /,'_') if options[:convert_spaces]
    str.gsub(options[:regexp], '')
  end

  #def diacritic_away
  #  pattern = String.new(self)
  #
  #  pattern = pattern.gsub(/č/, 'c')
  #  pattern = pattern.gsub('á', 'a')
  #  pattern = pattern.gsub('ä', 'a')
  #  pattern = pattern.gsub('ľ', 'l')
  #  pattern = pattern.gsub('š', 's')
  #  pattern = pattern.gsub('ť', 't')
  #  pattern = pattern.gsub('ž', 'z')
  #  pattern = pattern.gsub('ý', 'y')
  #  pattern = pattern.gsub('é', 'e')
  #  pattern = pattern.gsub('ó', 'o')
  #  pattern = pattern.gsub('í', 'i')
  #  pattern = pattern.gsub('ú', 'u')
  #
  #  pattern
  #
  #end
end