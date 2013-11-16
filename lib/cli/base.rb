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
    def add(todo = nil)
      unless todo
        todo    = ask("What to do?")
        list_id = ask_for_list
      else
        list_id = 'inbox'
      end
      client.tasks.create(title: todo, list_id: list_id, position: 0)
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
