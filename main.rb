# frozen_string_literal: true
require 'collections'

### LinkedList check ###
l1 = Collections::LinkedList.new(11)
l1.append(12)
l1.append(13)
l1.append(14)
l1.append(15)
l1.append(16)
l1.append(17)
p l1.to_a
p "#"*15
p l1.delete_at(2)
p l1.to_a
p "#"*15
p l1.find(15)
p "#"*15
p l1.at(0)
