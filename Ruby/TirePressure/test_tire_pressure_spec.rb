require_relative 'tire_pressure'

describe Alarm do
  it 'is off by default' do
    expect(Alarm.new().is_alarm_on).to eq(false)
  end

  it 'turns on when pressure is too low' do
    alarm = Alarm.new()
    alarm.sensor.random_override = 0
    alarm.check
    expect(alarm.is_alarm_on).to eq(true)
  end

  it 'turns on when pressure is too high' do
    alarm = Alarm.new()
    alarm.sensor.random_override = 1
    alarm.check
    expect(alarm.is_alarm_on).to eq(true)
  end

  it 'does not turn on when pressure is suitable' do
    alarm = Alarm.new()
    alarm.sensor.random_override = 0.5
    alarm.check
    expect(alarm.is_alarm_on).to eq(false)
  end
end
