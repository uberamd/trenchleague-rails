module PlayersHelper
  def translate_role_number_to_string(rolenum)
    case rolenum
      when 1
        return 'Support (Pos. 5)'
      when 2
        return 'Roamer/Support (Pos. 4)'
      when 3
        return 'Offlane'
      when 4
        return 'Safelane Carry'
      when 5
        return 'Mid'
      when 6
        return 'Mid/Safelane Core'
      when 7
        return 'Support'
      else
        return 'Unknown'
    end
  end
end
