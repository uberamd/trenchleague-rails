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

  def translate_lane_role_number_to_string(rolenum)
    case rolenum
      when 0
        return 'Unknown'
      when 1
        return 'Safe'
      when 2
        return 'Mid'
      when 3
        return 'Off'
      when 4
        return 'Jungle'
    end
  end
end
