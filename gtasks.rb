# https://github.com/DAddYE/google_tasks
# https://code.google.com/apis/console/
# ruby gtasks.rb | grep wordtofind

require "google_tasks"
require "awesome_print"

google_tasks = GoogleTasks.new(ENV['GOOGLE_TASKS_CLIENT_ID'],ENV['GOOGLE_TASKS_CLIENT_SECRET'],ENV['GOOGLE_TASKS_API_KEY'])
items = google_tasks.lists.items
items.each{	|one_list|
  p one_list.title
  tasks = google_tasks.tasks(:list, one_list.id).items.map(&:title)
  ap tasks, options = {}
}
