class Shipment < ActiveRecord::Base

  validates :tracking_number, uniqueness: true

  belongs_to :user
  belongs_to :courier
  belongs_to :tracking_number_status

  has_many :tracking_details, dependent: :destroy


  def self.checkusps(tknum)
    if (tknum.length != 22 && tknum.length != 20 && tknum.length != 13) then
      return 0;
    # NOT YET TESTED
    elsif tknum.length == 13
      if tknum.upcase["US"] == "US" then
        temp = tknum[2,9]
      else
        return 0
      end
    else
      temp = tknum.strip
      # puts "temp #{temp}"
      len = tknum.length
      # puts "temp #{len}"
      chk = temp[-1,1]
      # puts "temp #{chk}"
      temp = temp[0,len-1]
      # puts "temp #{temp}"
      len = temp.length
      # puts "temp #{len}"

      sumodd=0
      sumeven=0
      sum=0

      (len-1).downto(0) do |i|
        tempnum = temp[i,1]
        if i % 2 == 0 then
          sumeven = sumeven + tempnum.to_i
        else
          sumodd = sumodd + tempnum.to_i
        end
        # puts "#{i}--#{tempnum}"
      end
      # puts "sumodd = #{sumodd}"
      # puts "sumeven = #{sumeven}"

      sum = sumodd + (3 * sumeven)
      # puts sum
      # puts tknum[21,1].to_i

      if chk.to_i == (10 - (sum % 10)) || (sum % 10 == 0) then
        return 1
      else
        return 0
      end

    end
  end


end
