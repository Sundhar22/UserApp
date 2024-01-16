

bullCss      = input(color.new(#2157f3, 80), 'Bullish OB'   , inline = 'bullcss', group = 'Style')
bullBreakCss = input(color.new(#ff1100, 80), 'Bullish Break', inline = 'bullcss', group = 'Style')

bearCss      = input(color.new(#ff5d00, 80), 'Bearish OB'   , inline = 'bearcss', group = 'Style')
bearBreakCss = input(color.new(#0cb51a, 80), 'Bearish Break', inline = 'bearcss', group = 'Style')

showLabels = input(false, 'Show Historical Polarity Changes')



// Settings
onLength   = input.int(10, 'Swing Lookback'     , minval = 3)
showBull = input.int(3, 'Show Last Bullish OB', minval = 0)
showBear = input.int(3, 'Show Last Bearish OB', minval = 0)
useBody  = input(false, 'Use Candle Body')

// Style
bullCss      = input(color.new(#2157f3, 80), 'Bullish OB'   , inline = 'bullcss', group = 'Style')
bullBreakCss = input(color.new(#ff1100, 80), 'Bullish Break', inline = 'bullcss', group = 'Style')

bearCss      = input(color.new(#ff5d00, 80), 'Bearish OB'   , inline = 'bearcss', group = 'Style')
bearBreakCss = input(color.new(#0cb51a, 80), 'Bearish Break', inline = 'bearcss', group = 'Style')

showLabels = input(false, 'Show Historical Polarity Changes')

//-----------------------------------------------------------------------------}
// UDT's
//-----------------------------------------------------------------------------{
type OrderBlock
    float top = na
    float bottom = na
    int location = bar_index
    bool isBreaker = false
    int breakLocation = na

type Swing
    float y = na
    int x = na
    bool crossed = false

//-----------------------------------------------------------------------------}
// Functions
//-----------------------------------------------------------------------------{
getSwings(len) =>
    var os = 0
    var Swing topSwing = Swing.new(na, na)
    var Swing bottomSwing = Swing.new(na, na)
    
    upper = ta.highest(len)
    lower = ta.lowest(len)

    os := high[len] > upper ? 0 
         : low[len] < lower ? 1 
         : os

    if os == 0 and os[1] != 0
        topSwing := Swing.new(high[onLength], bar_index[onLength])
    
    if os == 1 and os[1] != 1
        bottomSwing := Swing.new(low[onLength], bar_index[onLength])

    [topSwing, bottomSwing]

getColorWithoutTransparency(colorVariable) => color.rgb(color.r(colorVariable), color.g(colorVariable), color.b(colorVariable))

displayOrderBlock(orderBlock, blockColor, breakColor) =>
    if orderBlock.isBreaker
        box.new(orderBlock.location, orderBlock.top, orderBlock.breakLocation, orderBlock.bottom, blockColor.withoutTransparency()
          , bgcolor = blockColor
          , xloc = xloc.bar_time)

        box.new(orderBlock.breakLocation, orderBlock.top, time + 1, orderBlock.bottom, na
          , bgcolor = breakColor
          , extend = extend.right
          , xloc = xloc.bar_time)
        
        line.new(orderBlock.location, orderBlock.top, orderBlock.breakLocation, orderBlock.top, xloc.bar_time, color = blockColor.withoutTransparency())
        line.new(orderBlock.location, orderBlock.bottom, orderBlock.breakLocation, orderBlock.bottom, xloc.bar_time, color = blockColor.withoutTransparency())
        line.new(orderBlock.breakLocation, orderBlock.top, time + 1, orderBlock.top, xloc.bar_time, extend.right, breakColor.withoutTransparency(), line.style_dashed)
        line.new(orderBlock.breakLocation, orderBlock.bottom, time + 1, orderBlock.bottom, xloc.bar_time, extend.right, breakColor.withoutTransparency(), line.style_dashed)
    else
        box.new(orderBlock.location, orderBlock.top, time, orderBlock.bottom, na
          , bgcolor = blockColor
          , extend = extend.right
          , xloc = xloc.bar_time)
        
        line.new(orderBlock.location, orderBlock.top, time, orderBlock.top, xloc.bar_time, extend.right, blockColor.withoutTransparency())
        line.new(orderBlock.location, orderBlock.bottom, time, orderBlock.bottom, xloc.bar_time, extend.right, blockColor.withoutTransparency())

//-----------------------------------------------------------------------------}
// Detect Swings
//-----------------------------------------------------------------------------{
swingLength = bar_index

[topSwing, bottomSwing] = getSwings(onLength)
maxPrice = useBody ? math.max(close, open) : high
minPrice = useBody ? math.min(close, open) : low

//-----------------------------------------------------------------------------}
// Bullish Order Blocks
//-----------------------------------------------------------------------------{
var bullishOrderBlocks = array.new<OrderBlock>(0)
bullishBreakConfidence = 0

if close > topSwing.y and not topSwing.crossed
    topSwing.crossed := true

    minima = maxPrice[1]
    maxima = minPrice[1]
    location = time[1]

    for i = 1 to (swingLength - topSwing.x) - 1
        minima := math.min(minPrice[i], minima)
        maxima := minima == minPrice[i] ? maxPrice[i] : maxima
        location := minima == minPrice[i] ? time[i] : location

    bullishOrderBlocks.unshift(OrderBlock.new(maxima, minima, location))

if bullishOrderBlocks.size() > 0
    for i = bullishOrderBlocks.size() - 1 to 0
        orderBlock = bullishOrderBlocks.get(i)
    
        if not orderBlock.isBreaker 
            if math.min(close, open) < orderBlock.bottom
                orderBlock.isBreaker := true
                orderBlock.breakLocation := time
        else
            if close > orderBlock.top
                bullishOrderBlocks.remove(i)
            else if i < showBull and topSwing.y < orderBlock.top and topSwing.y > orderBlock.bottom 
                bullishBreakConfidence := 1

// Set label
if bullishBreakConfidence > bullishBreakConfidence[1] and showLabels
    label.new(topSwing.x, topSwing.y, '▼', color = na
      , textcolor = bearCss.notransp()
      , style = label.style_label_down
      , size = size.tiny)

//-----------------------------------------------------------------------------}
// Bearish Order Blocks
//-----------------------------------------------------------------------------{
var bearishOrderBlocks = array.new<OrderBlock>(0)
bearishBreakConfidence = 0

if close < bottomSwing.y and not bottomSwing.crossed
    bottomSwing.crossed := true

    minima = minPrice[1]
    maxima = maxPrice[1]
    location = time[1]

    for i = 1 to (swingLength - bottomSwing.x) - 1
        maxima := math.max(maxPrice[i], maxima)
        minima := maxima == maxPrice[i] ? minPrice[i] : minima
        location := maxima == maxPrice[i] ? time[i] : location

    bearishOrderBlocks.unshift(OrderBlock.new(maxima, minima, location))

if bearishOrderBlocks.size() > 0
    for i = bearishOrderBlocks.size() - 1 to 0
        orderBlock = bearishOrderBlocks.get(i)

        if not orderBlock.isBreaker 
            if math.max(close, open) > orderBlock.top
                orderBlock.isBreaker := true
                orderBlock.breakLocation := time
        else
            if close < orderBlock.bottom
                bearishOrderBlocks.remove(i)
            else if i < showBear and bottomSwing.y > orderBlock.bottom and bottomSwing.y < orderBlock.top 
                bearishBreakConfidence := 1

// Set label
if bearishBreakConfidence > bearishBreakConfidence[1] and showLabels
    label.new(bottomSwing.x, bottomSwing.y, '▲', color = na
      , textcolor = bullCss.notransp()
      , style = label.style_label_up
      , size = size.tiny)

//-----------------------------------------------------------------------------}
// Set Order Blocks
//-----------------------------------------------------------------------------{
for bx in box.all
    bx.delete()

for l in line.all
    l.delete()

if barstate.islast
    // Bullish
    if showBull > 0
        for i = 0 to math.min(showBull-1, bullishOrderBlocks.size())
            orderBlock = bullishOrderBlocks.get(i)
            displayOrderBlock(orderBlock, bullCss, bullBreakCss)

    // Bearish
    if showBear > 0
        for i = 0 to math.min(showBear-1, bearishOrderBlocks.size())
            orderBlock = bearishOrderBlocks.get(i)
            displayOrderBlock(orderBlock, bearCss, bearBreakCss)
