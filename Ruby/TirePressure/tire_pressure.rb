class Alarm
  attr_reader :is_alarm_on

  def initialize(sensor:)
    @low_pressure_threshold = 17
    @high_pressure_threshold = 21
    @sensor = sensor
    @is_alarm_on = false
  end

  def check
    psi_pressure_value = @sensor.pressure_value
    pressure_too_low = psi_pressure_value < @low_pressure_threshold
    pressure_too_high = @high_pressure_threshold < psi_pressure_value

    if pressure_too_low or pressure_too_high
      @is_alarm_on = true
    end
  end
end
