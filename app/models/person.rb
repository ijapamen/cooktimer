class Person < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '1人分' },
    { id: 2, name: '2人分' },
    { id: 3, name: '3人分' },
    { id: 4, name: '4人分' }
  ]

  include ActiveHash::Associations
  has_many :recipes
end
