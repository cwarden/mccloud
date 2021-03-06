require 'pp'
module Mccloud
  module Util
    def on_selected_machines(selection=nil)
      if selection.nil? || selection == "all"
        #puts "no selection - all machines"

        @session.config.vms.each do |name,vm|
#          puts "#{name}"
          if vm.auto_selected?
            id=@session.config.vms[name].server_id
            vm=@session.config.vms[name]
            yield id,vm
          else
            puts "[#{name}] Skipping because it has autoselection off"
          end
        end
      else
        name=selection
#        puts "#{name}"
#        pp  @session.config.vms
        #puts "#{@session.config.vms.keys}"
        
        if @session.config.vms.has_key?(name)
          #puts "found #{name} key"
          id=@session.config.vms[name].server_id
          vm=@session.config.vms[name]
          yield id,vm
        end
      end
    end

    def on_selected_lbs(selection=nil)
      if selection.nil? || selection == "all"
        #puts "no selection - all loadbalancers"
        @session.config.lbs.each do |name,lb|
          #Would this be StackId?
          id=-1
          lb=@session.config.lbs[name]
            yield id,lb
        end
      else
        name=selection

        #Would this be StackId?
        if @session.config.lbs.has_key?(name)
          id=-1
          stack=@session.config.lbs[name]
          yield id,stack
        end
      end
      
    end
    
    def on_selected_ips(selection=nil)
      if selection.nil? || selection == "all"
        #puts "no selection - all loadbalancers"
        @session.config.ips.each do |name,ip|
          #Would this be StackId?
          id=-1
          lb=@session.config.ips[name]
            yield id,ip
        end
      else
        name=selection

        #Would this be StackId?
        if @session.config.ips.has_key?(name)
          id=-1
          stack=@session.config.ips[name]
          yield id,ip
        end
      end
      
    end
    
    
    def on_selected_stacks(selection=nil)
      if selection.nil? || selection == "all"
        #puts "no selection - all machines"
        @session.config.stacks.each do |name,stack|
          #Would this be StackId?
          id=-1
          stack=@session.config.stacks[name]
            yield id,stack
        end
      else
        name=selection

        #Would this be StackId?
        if @session.config.stacks.has_key?(name)
          id=-1
          stack=@session.config.stacks[name]
          yield id,stack
        end
      end
    end



  end
end