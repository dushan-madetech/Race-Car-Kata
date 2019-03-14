require_relative 'tire_pressure'

class SensorStub
  attr_reader :pressure_value

  def initialize(pressure_value)
    @pressure_value = pressure_value
  end
end

describe Alarm do
  it 'is off by default' do
    alarm = Alarm.new(sensor: nil)
    expect(alarm.is_alarm_on).to eq(false)
  end

  it 'turns on when pressure is too low' do
    alarm = Alarm.new(sensor: SensorStub.new(16.99))
    alarm.check
    expect(alarm.is_alarm_on).to eq(true)
  end

  it 'turns on when pressure is too high' do
    alarm = Alarm.new(sensor: SensorStub.new(22))
    alarm.check
    expect(alarm.is_alarm_on).to eq(true)
  end

  it 'does not turn on when pressure is suitable' do
    alarm = Alarm.new(sensor: SensorStub.new(19))
    alarm.check
    expect(alarm.is_alarm_on).to eq(false)
  end
end
