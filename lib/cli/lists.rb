module Cli
  module Lists

    def lists
      @lists ||= client.lists
    end

    def show_list_list(tasks_lists)
      inbox_first(tasks_lists).each do |list, tasks| 
        show_task_list(list, tasks)
      end
    end

    def ask_for_list
      lists_list

      list_index = ask("Add to list?")

      if list_index.to_i == 1 || list_index.empty?
        'inbox'
      else
        lists[list_index.to_i-2]
      end
    end

    def lists_list
      puts "1. Inbox"

      lists.each_with_index do |list, idx| 
        puts "#{idx+2}. #{list.title} (ID: #{list.id})"
      end
    end

    def list_title_for(list)
      if list == 'inbox'
        list = OpenStruct.new({ title: "Inbox", id: '' })
      else
        list = lists.find{ |l| l.id == list }
      end

      puts_padded list.title, " ", list.id
      puts_padded '', "="
    end

    def show_task_list(list, tasks)
      list_title_for(list)

      tasks.sort_by {|t| t.created_at.to_i }.reverse.each do |task|
        puts_padded " -  #{task.title}", " ", task.id
      end

      puts ''.ljust(80, " ")
    end

    def inbox_first(tasks_list)
      inbox = tasks_list.find{ |l, t| l == 'inbox' }
      if inbox
        show_task_list(inbox[0], inbox[1])
        tasks_list.delete_if{|l, t| l == 'inbox' }
      end

      tasks_list
    end

  end
end