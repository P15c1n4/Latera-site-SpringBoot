const children = document.querySelectorAll(".slideShowTagLi");

const controlerBanner = document.querySelectorAll(".controlerBanner");


let currentIndex = 0;
let intervalId = setInterval(toggleChild, 5000);


document.getElementById("findUserRank").addEventListener("keypress", function(event) {
  if (event.key === 'Enter') {
    findPlayerRank();
  }
});


function selectChild(index) {
  clearInterval(intervalId);
  
  children.forEach(child => {
    child.classList.remove("showBanner");

  });
  
  children[index].classList.add("showBanner");
 
  currentIndex = index;
  
  intervalId = setInterval(toggleChild, 5000);
}

function toggleChild() {
  children[currentIndex].classList.remove("showBanner");
  controlerBanner[currentIndex].checked = false;

  currentIndex = (currentIndex + 1) % children.length;

  children[currentIndex].classList.add("showBanner");
  controlerBanner[currentIndex].checked = true;
}
var rankTab = "ALL";

document.getElementById("ALL").style.borderColor = "red";

function setRankTab(idDg){
   rankTab = idDg;
   findPlayerRank();
}

document.addEventListener("DOMContentLoaded", function() {

  const elementoAlert = document.getElementById("alert");
  const alertBotao = document.getElementsByClassName("alertBotao")[0];

  if (document.getElementById("alertBotaoErro")) {

    alertBotao.style.backgroundColor = "#c00000";
    elementoAlert.style.top = "0";

    setTimeout(function() {
      elementoAlert.style.top = "-100%";
    }, 3000);
  }else if(document.getElementById("alertBotaoAlert")){
  
    alertBotao.style.backgroundColor = "#66bbff";
    elementoAlert.style.top = "0";

    setTimeout(function() {
      elementoAlert.style.top = "-100%";
    }, 3000);
  }
});

function findPlayerRank(){
    
    clearRank();
    document.getElementById(rankTab).style.borderColor = "red";

    
    var nome = document.getElementById("findUserRank").value;
    
    var xhr = new XMLHttpRequest();
    
    if(nome !== null || nome !== ""){
        xhr.open("GET", 'api/dgrank?user='+nome+'&dungeon='+rankTab, true);
    }else{
        xhr.open("GET", 'api/dgrank?user=&dungeon='+rankTab, true);
    }
    xhr.onload = function() {
        if (xhr.status === 200) {
            if(xhr.responseText.length === 0){
                rankPlayer(0,"ESSA PESQUISA NÃO RETORNOU DADOS!",undefined,undefined,undefined);
                
            }else{
                let data = JSON.parse(xhr.responseText);

                for (var i = 0; i < data.length; i++) {
                    rankPlayer(i,data[i].userName,data[i].userClass,data[i].dgCount,data[i].dgStatus);
                }

            }
        }
    };
    xhr.send();

}   

function clearRank(){
    document.getElementById("ALL").style.borderColor = "#343538";
    document.getElementById("9916").style.borderColor = "#343538";
    document.getElementById("9027").style.borderColor = "#343538";
    document.getElementById("3126").style.borderColor = "#343538";
    document.getElementById("3203").style.borderColor = "#343538";

    document.getElementById("playerRankUser0").style.display = "none";
    document.getElementById("playerRankUser1").style.display = "none";
    document.getElementById("playerRankUser2").style.display = "none";
    document.getElementById("playerRankUser3").style.display = "none";
    document.getElementById("playerRankUser4").style.display = "none";

}

function rankPlayer(pos,name,pClass,clear,dgStatus){
    
    var idElement= "playerRankUser"+pos;

    var elemeto = document.getElementById(idElement);
    var statusColor = "";
    
    
    
    
    if(dgStatus !== undefined){
    
        if(parseInt(clear) === undefined){
            statusColor = "";
            clear = "Clears: 0";
            
        }else if(dgStatus === "Skilled"){
            statusColor = "#ff6600";
            clear = "Clears: "+clear+" - "+dgStatus;
            
        }else{
            statusColor = "#4cea4c";
            clear = "Clears: "+clear+" - "+dgStatus;
        }
    }else{
        clear = "Clears: "+clear;  
    }
    

    
    elemeto.style.display = "block";
    
    switch (pClass){
        case undefined:
            elemeto.querySelector("img").src = "img/unk.png";
            elemeto.querySelector("a").innerHTML = name;
            elemeto.querySelector("span").innerHTML = "";
            elemeto.querySelector("span").style.color = statusColor;
            break;
        default :
            elemeto.querySelector("img").src = "img/"+pClass+".png";
            elemeto.querySelector("a").innerHTML = name;
            elemeto.querySelector("span").innerHTML = clear;
            elemeto.querySelector("span").style.color = statusColor;
            break;
    }
}
