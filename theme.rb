# -*- coding: utf-8 -*-
#
# Copyright (C) 2013  Kouhei Sutou <kou@clear-code.com>
#
# License: CC BY-SA 3.0

@clear_code_font_family = find_font_family("Andika")

include_theme("clear-code")

match(TitleSlide, Title) do |titles|
  set_font_family(titles, find_font_family("Burnstown Dam"))
end

unless print?
  match(Slide, "**", PreformattedBlock) do |blocks|
    blocks.each do |block|
      next if block.slide["evaluate-code"] != "true"
      name = "render-cairo"
      block.delete_post_draw_proc_by_name(name)
      block.add_pre_draw_proc(name) do |canvas, x, y, w, h, simulation|
        unless simulation
          context = canvas.renderer.instance_variable_get(:@context)
          context.save do
            x_fuzzy = rand / 10
            x_fuzzy *= -1 if rand(2).zero?
            y_fuzzy = rand / 100
            y_fuzzy *= -1 if rand(2).zero?
            context.translate( canvas.width  * (0.6 + x_fuzzy),
                              -canvas.height * (0.1 + y_fuzzy))
            context.scale(4, 4)
            red = rand
            green = rand
            blue = rand
            context.set_source(red, green, blue)
            eval(block.text)
          end
        end
        [x, y, w, h]
      end
    end
  end
end
