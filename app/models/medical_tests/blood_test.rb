class BloodTest < MedicalTest
  validates :taken_on, presence: true, uniqueness: true

  def self.as_json(method)
    prepare_for_json(method.to_sym).to_json
  end

  def self.prepare_for_json(method)
    order('taken_on ASC').map do |test|
      result = test.send(method)
      if method == :crp && result.is_a?(String)
        result = result.gsub('<', '').to_i unless result.nil? || result.empty?
      end
      { date: test.taken_on, result: result }
    end.reject { |test| test[:result].nil? || test[:result] == '' }
  end

  def self.legend_as_json
    BloodTestsHelper::TEST_NAMES.inject({}) do |hash, method|
      hash[method] = {
          name: BloodTestsHelper::HEADERS[method],
          fullname: BloodTestsHelper::FULLNAMES[method],
          unit: BloodTestsHelper::UNITS[method],
          min: BloodProbe::RANGES[method].first,
          max: BloodProbe::RANGES[method].last
        }
      hash
    end
  end

  def self.all_as_json
    all = {}
    BloodTestsHelper::TEST_NAMES.each do |method|
      all[method] = prepare_for_json(method)
    end
    all.to_json
  end

  def self.all_dangerous_results
    @out_of_range_results = []
    get_out_of_range_results
    @out_of_range_results.to_json
  end

  def self.get_out_of_range_results
    BloodTest.order('taken_on DESC').each do |blood_test|
      get_id_and_date(blood_test)
      start_probe(blood_test)
      @out_of_range_results << @bad_result
    end
  end

  def self.start_probe(blood_test)
    probe = BloodProbe.new(blood_test)
      BloodTestsHelper::TEST_NAMES.each do |method|
        check_crp(blood_test, method)
        @bad_result[method] = blood_test.send(method) if !probe.within_range?(method.to_sym) && !blood_test[method].nil? && !blood_test[method].is_a?(String)
      end
  end

  def self.check_crp(blood_test, method)
    if method == :crp
      blood_test.crp.gsub('<', '').to_i unless blood_test.crp.nil? || blood_test.crp.is_a?(Fixnum)
    end
  end

  def self.get_id_and_date(blood_test)
    @bad_result = {}
    @bad_result['id'] = blood_test.id
    @bad_result['taken_on'] = blood_test.taken_on
  end

  def self.new_from_remote(options)
    BloodTest.new(
      :taken_on => options[:taken_on],
      :hb  => options[:hb] ,
      :mcv  => options[:mcv],
      :wbc  => options[:wbc],
      :platelets  => options[:platelets],
      :neutrophils  => options[:neutrophils],
      :lymphocytes  => options[:lymphocytes],
      :alt  => options[:alt],
      :alk_phos  => options[:alk_phos],
      :creatinine  => options[:creatinine],
      :esr  => options[:esr],
      :crp  => options[:crp])
  end

  def error_messages
    errors.inject([]) do |array, (attr, message)|
      array << message
    end
  end

  def self.delete_empty_hashes(hash)
    hash.delete_if { |key, value| value == {} || value == nil }
  end
end
