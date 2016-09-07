class String
def curvy?
!("AEFHIKLMNTVWXYZ".include?(self.upcase))
end
end

"foo".curvy?
