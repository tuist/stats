# frozen_string_literal: true

module ApplicationHelper
  def show_svg(path)
    File.open("app/assets/images/#{path}", "rb") do |file|
      raw file.read
    end
  end

  TuistGraphColorPalette = ["#6236FF", "#8FBFE0", "#1D8A99", "#0BC9CD", "#14FFF7", "#E2E4F6", "#E7C8DD", "#DBAFC1"]
end
