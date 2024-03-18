-- Define a table to hold the card images
local cards = {}

function love.load()
  love.window.setFullscreen(true)
  local suits = {"clubs", "diamonds", "hearts", "spades"}
  local values = {"02", "03", "04", "05", "06", "07", "08", "09", "10", "J", "Q", "K", "A"}

  for _, suit in ipairs(suits) do
      for _, value in ipairs(values) do
          local cardName = string.format("card_%s_%s", suit, value)
          local imagePath = "assets/sprites/cards/" .. cardName .. ".png"
          if not cards[suit] then cards[suit] = {} end
          cards[suit][value] = love.graphics.newImage(imagePath)
          cards[suit][value]:setFilter("nearest", "nearest") -- Apply nearest neighbor filtering
      end
  end
end


function love.draw()
  love.graphics.setBackgroundColor(75/255, 0, 130/255) -- RGB for darker violet


  local startX = 50 -- Starting X position for the first card
  local startY = 50 -- Starting Y position for the first row
  local xGap = 80  -- Gap between cards, adjust for more/less overlap
  local yGap = 200 -- Gap between rows
  local shadowOffset = 5 -- Shadow offset to the left and bottom
  local shadowColor = {0, 0, 0, 0.2} -- Shadow color (black) with half opacity
  
  for suitIndex, suit in ipairs({"clubs", "diamonds", "hearts", "spades"}) do
      local xPosition = startX -- Reset X position for each suit
      local yPosition = startY + (suitIndex - 1) * yGap -- Calculate Y position based on the suit row
      for _, value in ipairs({"02", "03", "04", "05", "06", "07", "08", "09", "10", "J", "Q", "K", "A"}) do
          if cards[suit] and cards[suit][value] then
              -- Draw shadow
              -- love.graphics.setColor(shadowColor) -- Set the shadow color
              -- local cardWidth, cardHeight = cards[suit][value]:getDimensions()
              -- love.graphics.rectangle("fill", xPosition + shadowOffset, yPosition + shadowOffset, cardWidth * 4, cardHeight * 4)
              
              -- Draw card
              love.graphics.setColor(1, 1, 1) -- Reset color to white for the card image
              love.graphics.draw(cards[suit][value], xPosition, yPosition, 0, 4, 4)
              
              xPosition = xPosition + xGap -- Move X position for the next card
          end
      end
  end
  
  -- Reset color to white after drawing everything
  love.graphics.setColor(1, 1, 1)
end


