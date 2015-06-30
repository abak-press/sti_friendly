# StiFriendly

**Дано**: *Table id: 1, type: 'OldSubclass'*

При обновлении STI модели, обновляемая строка идентифицируется не только по её id, но ещё и по её классу.
При обновлении типа (класса) у записи с такими атрибутами {id: 1, typе 'OldSublclass'} на 'NewSubclass' рельсы сделают следующий запрос:

```sql
UPDATE tables SET type='NewSubclass' WHERE type IN 'NewSubclass' AND id=1
```

**Проблема**: До обновления в базе ещё нет записи с id=1 и type='NewSubclass'.

- Дополнительное описание проблемы: http://stackoverflow.com/questions/16655543/sti-in-rails-how-do-i-change-from-a-superclass-to-a-subclass-without-accessing
- Решение обновления типа через второй запрос: http://wegowise.github.io/blog/2013/05/09/rails-gotcha-saving-sti-records/
- Решение на основе перекрытия метода update: http://blog.arkency.com/2013/07/sti/
- Примененное решение сделано на основе замечания "If you want to disable Single Table Inheritance or use the type column for something else, you can use self.inheritance_column = :fake_column." в http://samurails.com/tutorial/single-table-inheritance-with-rails-4-part-1/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sti_friendly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sti_friendly

## Setup

```ruby
module Offers
  class Custom < ActiveRecord::Base
    include StiFriendly
  end
end
```

## Contributing
1. [Fork it](https://github.com/abak-press/sti_friendly/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write code _and_ tests
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
