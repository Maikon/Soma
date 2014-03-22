class BloodTest < MedicalTest
  validates :taken_on, presence: true, uniqueness: true

  def self.as_json(method)
    prepare_for_json(method.to_sym).to_json
  end

  def self.prepare_for_json(method)
    order('taken_on ASC').map do |test|
      result = test.send(method)
      if method == :crp && result.is_a?(String)
        result = result.gsub("<","").to_i unless result.nil? || result.empty?
      end
      { date: test.taken_on, result: result }
    end.reject { |test| test[:result].nil?|| test[:result]==''}
  end

  def self.legend_as_json
    BloodTestsHelper::TEST_NAMES.inject({}) do |hash, method|
      hash[method] = { name: BloodTestsHelper::HEADERS[method], fullname: BloodTestsHelper::FULLNAMES[method], unit: BloodTestsHelper::UNITS[method], min: BloodProbe::RANGES[method].first, max: BloodProbe::RANGES[method].last }
      hash
    end
  end

  def self.all_as_json
    all = {}
    BloodTestsHelper::TEST_NAMES.each do |method|
      all[method] = prepare_for_json(method)
    end
    return all.to_json
  end

  def error_messages
    errors.inject([]) do |array, (attr, message)|
      array << message
    end
  end
end
