require "./blockdb/*"

module BlockDB
  class Item
    def initialize(@name : String = "unknown")
    end
  end

  class Tool < Item
  end

  class Block < Item
    property tool : Tool

    def initialize(@name : String = "unknown_block", @tool : Tool = Tool.new "unknown")
      # @transparency : Bool
      # @luminance : Bool
      # @blast_resistance : UInt16
      # @stackable : UInt16
      # @flammable : Bool
      # @drops : Block
      # @hardness : UInt16
      # @crafting : Recipe::Crafting
    end
  end
end

macro tool_types(name)
	{% for durability in ["wood", "stone", "iron", "gold", "diamond"] %}
		pp {{durability.id}}_{{name}} = BlockDB::Tool.new "{{durability.id}}_{{name}}"
	{% end %}
end

tool_types pickaxe
tool_types sword
tool_types axe
tool_types shovel
tool_types hoe
BlockDB::Tool.new "shears"

BlockDB::Block.new(diamond_pickaxe)
