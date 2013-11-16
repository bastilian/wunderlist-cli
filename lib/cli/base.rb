module Cli
  class Base < Thor
    include Thor::Actions
    include Client
    include Lists
    include Ui

    default_task :all

    desc "setup", "Setup authentication"
    def setup
      load_config
      config[:username] = ask("Username: ")
      config[:password] = ask("Password: ")
      wirte_config
    end

    desc "all", "Display all lists"
    def all
      task_lists = client.tasks.find_all { |t| t.completed_at.nil? }
                               .group_by { |t| t.list_id }

      show_list_list(task_lists)
    end

    desc "add TODO", "Add a new todo"
    option :list, :type => :string, :aliases => :l, :default => 'inbox'
    def add(todo = nil)
      todo    = ask("What to do?") unless todo
      list_id = options[:list]

      max_position = client.tasks.find_all{ |t| t.list_id == list_id }
                                 .sort_by { |t| t.position }[0]

      client.tasks.create(title: todo, list_id: list_id, position: max_position.position-0.1)
    end

    desc "complete TODO_ID", "Complete a todo"
    def completed(todo_id)
      task = client.tasks.find { |t| t.id == todo_id } 
      task.completed_at = Time.now.to_s
      task.save
    end

    desc "delete TODO_ID", "Delete a todo"
    def delete(todo_id)
      task = client.tasks.find { |t| t.id == todo_id } 
      task.destroy
    end

  end
end
