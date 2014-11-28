class Bank
	attr_reader :name
	attr_accessor :vault
	def initialize(name)
		@name = name
		@vault = 0
	end
	
	def open_account(account)
		account.info["#{self.name}"] = 0
		puts "Account opened for #{account.info[:name]} at #{self.name}"
	end
	
	def deposit(account, amount)
		account.info["#{self.name}"] += amount
		account.info[:wallet] -= amount
		self.vault += amount
		puts "#{account.info[:name]} deposited $#{amount} to #{self.name}. #{account.info[:name]} has $#{account.info[:wallet]}. #{account.info[:name]}'s account has $#{account.info["#{self.name}"]}"
	end
	
	def withdraw(account, amount)
		account.info["#{self.name}"] -= amount
		account.info[:wallet] += amount
		self.vault -= amount
		puts "#{account.info[:name]} withdrew $#{amount} from #{self.name}. #{account.info[:name]} has $#{account.info[:wallet]}. #{account.info[:name]}'s account has $#{account.info["#{self.name}"]}"
	end
	
	def transfer(account, new_bank, amount)
		account.info["#{self.name}"] -= amount
		account.info["#{new_bank.name}"] += amount
		puts "#{account.info[:name]} transferred $#{amount} from the #{self.name} account to the #{new_bank.name} account."
		puts "#{account.info[:name]}'s #{self.name} balance: $#{account.info["#{self.name}"]}"
		puts "#{account.info[:name]}'s #{new_bank.name} balance: $#{account.info["#{new_bank.name}"]}"
	end
	
end

class Person
	attr_reader :name
	attr_accessor :wallet, :info
	def initialize(name, wallet)
		@name = name
		@wallet = wallet
		@info = {name: @name, wallet: @wallet}
		puts "Hi, #{@name}! You have $#{@wallet}"
	end
end
