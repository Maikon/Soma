class BloodTest < MedicalTest
  validates :taken_on, presence: true, uniqueness: true

  def self.as_json(method)
    prepare_for_json(method).to_json
  end

  def self.prepare_for_json(method)
    order('taken_on ASC').map do |test|
      if method == "crp"
          old_result = test.send(method.to_sym)
          new_result = old_result.gsub("<","").to_f if !old_result.empty?
          { date: test.taken_on, result: new_result}
        else
          { date: test.taken_on, result: test.send(method.to_sym)}
      end
    end.reject { |test| test[:result].nil?|| test[:result]==''}
  end

  def self.legend_as_json
    BloodProbe::TEST_NAMES.inject({}) do |hash, method|
      hash[method] = { name: BloodProbe::HEADERS[method], fullname: BloodProbe::FULLNAMES[method], unit: BloodTestsHelper::UNITS[method], min: BloodProbe::RANGES[method].last, max: BloodProbe::RANGES[method].first }
      hash
    end
  end

  def self.all_as_json
    @methods =
    ["hb",
      "mcv",
      "wbc",
      "platelets",
      "neutrophils",
      "lymphocytes",
      "alt",
      "alk_phos",
      "creatinine",
      "esr",
      "crp"
    ]
    all = {}
    @methods.each do |method|
      all[method.to_sym] = prepare_for_json(method)
    end
    return all.to_json
  end

  def error_messages
    errors.inject([]) do |array, (attr, message)|
      array << message
    end
  end
end
