# Discs
Factory.define(:disc) do |o|
  o.number "I"
end

Factory.define(:recording) do |o|
  o.name "Back To The Future"
  o.association :disc
  o.seen false
end
