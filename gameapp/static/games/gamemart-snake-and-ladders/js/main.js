$(function(){
  drawBoard();
  putPlayer(1);

  $("#rollDiceButton").on("click", function(){
    var dice1 = getRandomInt(1,6);
    var dice2 = getRandomInt(1,6);
    $("#dice1").html(dice1);
    $("#dice2").html(dice2);

    movePlayer(dice1+dice2, false)
  });

  $("#newGameButton").on("click", function(){
    newGame();
  });

  $("#submitScore").click( function () {
    var msg = {
      "messageType": "SCORE",
      "score": parseFloat($("#score").text())
    };
    window.parent.postMessage(msg, "*");
  });

  $("#save").click( function () {
    var msg = {
      "messageType": "SAVE",
      "gameState": {
        "playerLocation": parseInt($("#player").data('location')),
        "score": parseFloat($("#score").text())
      }
    };
    window.parent.postMessage(msg, "*");
  });

  $("#load").click( function () {
    var msg = {
      "messageType": "LOAD_REQUEST",
    };
    window.parent.postMessage(msg, "*");
  });

  // Listen incoming messages, if the messageType
  // is LOAD then the game state will be loaded.
  // Note that no checking is done, whether the
  // gameState in the incoming message contains
  // correct information.
  //
  // Also handles any errors that the service
  // wants to send (displays them as an alert).
  window.addEventListener("message", function(evt) {
    if(evt.data.messageType === "LOAD") {
      playerLocation = evt.data.gameState.playerLocation;
      score = evt.data.gameState.score;
      $("#score").text(score);
      $("#rollDiceButton").show();
      putPlayer(playerLocation);
      setScore(0);
    } else if (evt.data.messageType === "ERROR") {
      alert(evt.data.info);
    }
  });

  var message =  {
    messageType: "SETTING",
    options: {
      "width": 1100, //Integer
      "height": 700 //Integer
      }
  };
  window.parent.postMessage(message, "*");

})

function newGame(){
  $("#rollDiceButton").show();
  putPlayer(1);
  setScore(0);
}

function setScore(score){
  $("#score").html(score);
}

function movePlayer(destination, isJump=false){
  var player = $("#player");
  var newLocation = 0;
  if(isJump){
    newLocation = destination;
  }
  else{
    newLocation = destination + player.data('location');
  }
  if(newLocation > 100){ newLocation = 100; }
  var newBox = $("#box"+newLocation);
  player.data('location', newLocation);
  player.attr('data-location', newLocation);
  player.animate({
    top: newBox.offset().top+18,
    left: newBox.offset().left+18,
  });

  var score = parseInt($("#score").html());
  newScore = score + boardConfig[newLocation].score;
  $("#score").html(newScore);

  var jumpTo = boardConfig[newLocation].jumpTo;
  if(jumpTo != 0){
    movePlayer(jumpTo, true);
  }
  if(newLocation == 100){
    $("#rollDiceButton").hide();
    $("#newGame").show();
  }
}

function drawBoard(){
  output = "";
  htmlOutput = "";
  for(var i = 100; i >= 1; i--){
    if(i % 10 == 0){
      if(i != 1){ htmlOutput += `</div>`;}
      var level = i/10;
      var oddOrEven = 'odd';
      if(level % 2 == 0) oddOrEven = 'even'
      htmlOutput += `<div class='level ${oddOrEven}' data-level='${level}'>`;
      output += `<br/>start new level [${level}]: `;
    }

    var boxColor = ["red", "green", "blue", "yellow", "violet"];
    var jumpTo = boardConfig[i].jumpTo;

    var jumpDirection = '';
    if(jumpTo != 0){
      if(jumpTo > i){
        jumpDirection = 'jump up';
      }
      else{
        jumpDirection = 'jump down';
      }
    }


    htmlOutput += `<div id='box${i}' data-jumpTo='${jumpTo}' data-boxno='${i}'' class='box ${boxColor[getRandomInt(0,4)]} ${jumpDirection}'>
      <span class='text'>${i}</span>
      <span class='boxScore'>${boardConfig[i].score}</span>
    </div>`;
    output += `[${i}]`;
  }
  $("#board").html($("#board").html()+htmlOutput);

  ctx = document.getElementById("c").getContext("2d");
	ctx.beginPath();

  for(var key in boardConfig){
    if(boardConfig[key].jumpTo != 0){
      var fromBox = $("#box"+key);
      var toBox = $("#box"+boardConfig[key].jumpTo)
      canvas_arrow(ctx,fromBox.offset().left+35,fromBox.offset().top+35,toBox.offset().left+35,toBox.offset().top+35);
    }
  }
	// canvas_arrow(ctx,10,30,200,150);
	// canvas_arrow(ctx,100,200,400,50);
	// canvas_arrow(ctx,200,30,10,150);
	// canvas_arrow(ctx,400,200,100,50);
	ctx.stroke();
}

function canvas_arrow(context, fromx, fromy, tox, toy){
    var headlen = 10;   // length of head in pixels
    var angle = Math.atan2(toy-fromy,tox-fromx);
    context.moveTo(fromx, fromy);
    context.lineTo(tox, toy);
    context.lineTo(tox-headlen*Math.cos(angle-Math.PI/6),toy-headlen*Math.sin(angle-Math.PI/6));
    context.moveTo(tox, toy);
    context.lineTo(tox-headlen*Math.cos(angle+Math.PI/6),toy-headlen*Math.sin(angle+Math.PI/6));
}

function putPlayer(location){
  console.log(location);
  var box = $("#box"+location);
  var player = $("#player");
  player.data('location', location);
  player.attr('data-location', location);
  player.offset({ top: box.offset().top+18, left: box.offset().left+18});
}



/**
 * Returns a random integer between min (inclusive) and max (inclusive)
 * Using Math.round() will give you a non-uniform distribution!
 */
function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

var boardConfig = {
  1: { score: 0, jumpTo: 0},
  2: { score: 20, jumpTo: 0},
  3: { score: 40, jumpTo: 0},
  4: { score: 0, jumpTo: 14},
  5: { score: -20, jumpTo: 0},
  6: { score: 30, jumpTo: 0},
  7: { score: 40, jumpTo: 0},
  8: { score: -10, jumpTo: 0},
  9: { score: 0, jumpTo: 31},
  10: { score: 10, jumpTo: 0},
  11: { score: 10, jumpTo: 0},
  12: { score: 20, jumpTo: 0},
  13: { score: -40, jumpTo: 0},
  14: { score: -10, jumpTo: 0},
  15: { score: -10, jumpTo: 0},
  16: { score: 50, jumpTo: 0},
  17: { score: 0, jumpTo: 7},
  18: { score: 30, jumpTo: 0},
  19: { score: 20, jumpTo: 0},
  20: { score: 0, jumpTo: 38},
  21: { score: 20, jumpTo: 0},
  22: { score: 50, jumpTo: 0},
  23: { score: -50, jumpTo: 0},
  24: { score: -10, jumpTo: 0},
  25: { score: 10, jumpTo: 0},
  26: { score: 20, jumpTo: 0},
  27: { score: -40, jumpTo: 0},
  28: { score: 0, jumpTo: 84},
  29: { score: 30, jumpTo: 0},
  30: { score: 30, jumpTo: 0},
  31: { score: 30, jumpTo: 0},
  32: { score: -40, jumpTo: 0},
  33: { score: -50, jumpTo: 0},
  34: { score: -40, jumpTo: 0},
  35: { score: 30, jumpTo: 0},
  36: { score: 10, jumpTo: 0},
  37: { score: 60, jumpTo: 0},
  38: { score: 40, jumpTo: 0},
  39: { score: 10, jumpTo: 0},
  40: { score: 0, jumpTo: 59},
  41: { score: -10, jumpTo: 0},
  42: { score: -60, jumpTo: 0},
  43: { score: 30, jumpTo: 0},
  44: { score: -20, jumpTo: 0},
  45: { score: 40, jumpTo: 0},
  46: { score: -10, jumpTo: 0},
  47: { score: 30, jumpTo: 0},
  48: { score: 30, jumpTo: 0},
  49: { score: 30, jumpTo: 0},
  50: { score: 40, jumpTo: 0},
  51: { score: 0, jumpTo: 67},
  52: { score: 30, jumpTo: 0},
  53: { score: 20, jumpTo: 0},
  54: { score: 0, jumpTo: 34},
  55: { score: -20, jumpTo: 0},
  56: { score: -20, jumpTo: 0},
  57: { score: -30, jumpTo: 0},
  58: { score: -20, jumpTo: 0},
  59: { score: 10, jumpTo: 0},
  60: { score: 50, jumpTo: 0},
  61: { score: 30, jumpTo: 0},
  62: { score: 0, jumpTo: 19},
  63: { score: 0, jumpTo: 81},
  64: { score: 0, jumpTo: 60},
  65: { score: 30, jumpTo: 0},
  66: { score: 20, jumpTo: 0},
  67: { score: 30, jumpTo: 0},
  68: { score: 30, jumpTo: 0},
  69: { score: 10, jumpTo: 0},
  70: { score: -40, jumpTo: 0},
  71: { score: 0, jumpTo: 91},
  72: { score: -20, jumpTo: 0},
  73: { score: -10, jumpTo: 0},
  74: { score: -10, jumpTo: 0},
  75: { score: -10, jumpTo: 0},
  76: { score: -10, jumpTo: 0},
  77: { score: 20, jumpTo: 0},
  78: { score: 20, jumpTo: 0},
  79: { score: 40, jumpTo: 0},
  80: { score: 30, jumpTo: 0},
  81: { score: -10, jumpTo: 0},
  82: { score: -20, jumpTo: 0},
  83: { score: 30, jumpTo: 0},
  84: { score: 20, jumpTo: 0},
  85: { score: 20, jumpTo: 0},
  86: { score: 30, jumpTo: 0},
  87: { score: -30, jumpTo: 0},
  88: { score: -20, jumpTo: 0},
  89: { score: 10, jumpTo: 0},
  90: { score: -10, jumpTo: 0},
  91: { score: -10, jumpTo: 0},
  92: { score: 10, jumpTo: 0},
  93: { score: 0, jumpTo: 73},
  94: { score: -30, jumpTo: 0},
  95: { score: 0, jumpTo: 75},
  96: { score: 20, jumpTo: 0},
  97: { score: -10, jumpTo: 0},
  98: { score: -50, jumpTo: 0},
  99: { score: 0, jumpTo: 78},
  100: { score: 1000, jumpTo: 0},
}
