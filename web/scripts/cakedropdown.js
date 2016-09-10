var basket = [];
var cakeCounter = 0;
var grandTotal = 0;

function cake(top, topPrice, bot, botPrice)
{
    this.top = top,
    this.topPrice = topPrice,
    this.bot = bot,
    this.botPrice = botPrice,
    this.totalPrice = parseInt(topPrice) + parseInt(botPrice);
    this.toString = function()
    {
        return "Topping: <b>" + this.top + "</b> | Price: " + this.topPrice + "$</br>"
        + "Bottom-Layer: <b>" + this.bot + "</b> | Price: " + this.botPrice + "$</br>"
        + "Total Price: <b>" + this.totalPrice + "$</b></br>" + "</br>";
    }
};

function bingo()
{
    var topBar = document.getElementById("topdrop");
    var topValue = topBar.options[topBar.selectedIndex].text;
    var botBar = document.getElementById("bottomdrop");
    var botValue = botBar.options[botBar.selectedIndex].text;
    var topVars = topValue.toString().split("|");
    var botVars = botValue.toString().split("|");
    eval("var newCake" + cakeCounter + " = new cake(topVars[0], topVars[1].substring(0,1), botVars[0], botVars[1].substring(0,1));");
    eval("basket.push(newCake" + cakeCounter + ");");
    grandTotal += basket[cakeCounter].totalPrice;
    window.sessionStorage.setItem('foo','bar');
    document.getElementById("basketCon").innerHTML = "";
    document.getElementById("basketCon").innerHTML += "<div id=\"jslort\">";
    for (var i = 0; i < basket.length; i++)
    {
        document.getElementById("basketCon").innerHTML += basket[i].toString();
    }
    document.getElementById("basketCon").innerHTML += ("Grand Total: <b>" + grandTotal + "$</b>");
    console.log(grandTotal);
    document.getElementById("basketCon").innerHTML += "</div>";
    cakeCounter++;
}

function clearBasket()
{
    window.location.href="shop.jsp";
}
