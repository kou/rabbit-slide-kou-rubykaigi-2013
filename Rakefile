# Copyright (C) 2013  Kouhei Sutou <kou@clear-code.com>
#
# License: CC BY-SA 3.0

require "rabbit/task/slide"

# Edit ./config.yaml to customize meta data

spec = nil
Rabbit::Task::Slide.new do |task|
  spec = task.spec
  # task.spec.files += Dir.glob("doc/**/*.*")
  # task.spec.files -= Dir.glob("private/**/*.*")
  spec.add_runtime_dependency("rabbit-theme-clear-code")
end

desc "Tag #{spec.version}"
task :tag do
  sh("git", "tag", "-a", spec.version.to_s, "-m", "Publish #{spec.version}")
  sh("git", "push", "--tags")
end
