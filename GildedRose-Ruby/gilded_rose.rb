
require './item.rb'

class GildedRose

@items = []

  def initialize
    @items = []
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality
    properties = { 
      "+5 Dexterity Vest"                         => { sell_in: -1, quality: lambda { |s| (s == 0) ? -2 : -1 } }, 
      "Aged Brie"                                 => { sell_in: -1, quality: lambda { |s| (s == 0) ? 2 : 1 } },
      "Elixir of the Mongoose"                    => { sell_in: -1, quality: lambda { |s| (s == 0) ? -2 : -1 } },
      "Sulfuras, Hand of Ragnaros"                => { sell_in:  0, quality: lambda { |s| 0 } }, 
      "Backstage passes to a TAFKAL80ETC concert" => { sell_in: -1, quality: lambda { |s| case s when 0; -50 when 1..5; 3 when 6..10; 2 else 1 end } }, 
      "Conjured Mana Cake"                        => { sell_in: -1, quality: lambda { |s| (s == 0) ? -4 : -2 } }
    }

    @items.each do |item|
      properties.each do |key, property|
        if item.name == key
          if item.quality >= 0 and item.quality <= 50
            item.quality += property[:quality].call(item.sell_in)
            item.quality = [0, item.quality, 50].sort[1] 
            item.sell_in += property[:sell_in]
          end
        end
      end
    end
  end 

end
