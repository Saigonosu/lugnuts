class AutoIncrementPrimaryKeys < ActiveRecord::Migration[5.1]
  def change
    execute 'SET foreign_key_checks = 0;'
    execute 'ALTER TABLE customers MODIFY customerNumber INT NOT NULL AUTO_INCREMENT;'
    execute 'ALTER TABLE employees MODIFY employeeNumber INT NOT NULL AUTO_INCREMENT;'
    execute 'ALTER TABLE orders MODIFY orderNumber INT NOT NULL AUTO_INCREMENT;'
    execute 'SET foreign_key_checks = 1;'
  end
end
