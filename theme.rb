# -*- coding: utf-8 -*-
#
# Copyright (C) 2013  Kouhei Sutou <kou@clear-code.com>
#
# License: CC BY-SA 3.0

@clear_code_font_family = find_font_family("Andika")

include_theme("clear-code")

match(TitleSlide, Title) do |titles|
  set_font_family(titles, find_font_family("AirCut"))
  set_font_family(titles, find_font_family("Astron Boy"))
  set_font_family(titles, find_font_family("Beat My Guest"))
  set_font_family(titles, find_font_family("Burnstown Dam"))
end
