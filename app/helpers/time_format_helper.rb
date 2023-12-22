module TimeFormatHelper
  def formatted_time(timestamp)
    timestamp.strftime('%-d %B %Y в %H:%M:%S').force_encoding('utf-8')
  end
end