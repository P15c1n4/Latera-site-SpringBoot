let input = document.getElementById("frmSingupNome");
let timer;

input.addEventListener("input", function() {
  clearTimeout(timer);
  if (input.value.length >= 4) {
    timer = setTimeout(function() {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", `/api/v1/user?user=${input.value}`, true);
    xhr.onreadystatechange = function() {
      if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            document.getElementById("validate").src = "/static/img/reprovado.png";

      }else if(this.readyState === XMLHttpRequest.DONE && this.status === 404){
            document.getElementById("validate").src = "/static/img/aprovado.png";
      }
    };
    xhr.send();
    }, 1000);
  }else{
    document.getElementById("validate").src = "/static/img/reprovado.png";
  }
});

function alertMensage(type, mensage) {

  const elementoAlert = document.getElementById("alert");
  const alertBotao = document.getElementsByClassName("alertBotao")[0];
  alertBotao.innerHTML = mensage;

  if (type === 'erro') {

    alertBotao.style.backgroundColor = "#c00000";
    elementoAlert.style.top = "0";

    setTimeout(function() {
      elementoAlert.style.top = "-100%";
    }, 3000);
  }else if(type === 'alert'){
  
    alertBotao.style.backgroundColor = "#66bbff";
    elementoAlert.style.top = "0";

    setTimeout(function() {
      elementoAlert.style.top = "-100%";
    }, 3000);
  }
};

document.getElementById('buttonLogin1').addEventListener('click', function(){
    closeLogin();
    document.getElementById("check").click();
});
      
document.getElementById('closeLogin').addEventListener('click', function(){
    closeLogin();
});

document.getElementById('closeSingup').addEventListener('click', function(){
    closeSingup();
});

document.getElementById('buttonSingup1').addEventListener('click', function(){
    closeSingup();
    document.getElementById("check").click();
});


function closeLogin(){
    document.getElementById("checkLogin").click();
    if(document.getElementById("checkSingup").checked){
        document.getElementById("checkSingup").click(); 
    }
}

function closeSingup(){
    document.getElementById("checkSingup").click();
    if(document.getElementById("checkLogin").checked){
        document.getElementById("checkLogin").click(); 
    }
}


/* Registro */ 


function validarRegistro(){
    let nome = frmSingup.nome.value
    let senha = frmSingup.senha.value
    let cSenha = frmSingup.cSenha.value
    let email = frmSingup.email.value

    if(validarNome(nome,4,15)){
        displayReset()
        document.getElementById("frmSingupNomeErro").innerHTML = "Preencha o campo Usuário com um valor válido!";
        frmSingup.login.focus()
        document.getElementById("frmSingupNome").style.borderColor = "#ff0000";
        return false
        
    }else if(validaSenha(senha,cSenha,8)){
        displayReset()
        document.getElementById("frmSingupSenhaErro").innerHTML = "Preencha o campo com um valor válido!";
        document.getElementById("frmSingupcSenhaErro").innerHTML = "Preencha o campo com um valor válido!";
        frmSingup.senha.focus()
        document.getElementById("frmSingupSenha").style.borderColor = "#ff0000";
        document.getElementById("frmSingupcSenha").style.borderColor = "#ff0000";
        return false
        
    }else if(validarEmail(email,50)){
        displayReset()
        document.getElementById("frmSingupEmailErro").innerHTML = "Preencha o campo Email com um valor válido!";
        frmSingup.email.focus()
        document.getElementById("frmSingupEmail").style.borderColor = "#ff0000";
    }else{

        var data = {
            userName: nome,
            passWord: senha,
            email: email
        };

        var jsonData = JSON.stringify(data);

        fetch('auth/register', {
            method: 'put',
            headers: {
                'Content-Type': 'application/json'
            },
            body: jsonData
        })
        .then(response => {

            if(response.status == 201){
                closeSingup();
                location.reload()

            }else{
                 alertMensage('erro', 'Falha ao criar conta, dados inválidos');

            }
        })
        .catch(error => {
            console.error('Erro na requisição de login:', error);
        });
    }
    
    
}

/* login */
document.getElementById("frmSinginNome").addEventListener("keydown", function(event) {
  if (event.key === "Enter") {
    validarLogin();
  }
});
document.getElementById("frmSinginSenha").addEventListener("keydown", function(event) {
  if (event.key === "Enter") {
    validarLogin();
  }
});


function validarLogin(){
    let nome = frmLogin.login.value
    
    if(validarNome(nome,4,15)){
        displayReset()
        document.getElementById("frmSinginNomeErro").innerHTML = "Preencha o campo Usuário com um valor válido!";
        frmLogin.login.focus()
        document.getElementById("frmSinginNome").style.borderColor = "#ff0000";
        return false
    }else{
        sendLoginRequest();

    }

}

function validarNome(input, tamanhoMim,tamanhiMax) {
    if(input.length === 0 ){
        return true
    }
    else if( input.length > tamanhiMax) {
        return true
    }else if(input.length < tamanhoMim){
        return true
    }
    var pattern = /^[a-zA-Z0-9._]+$/;
    return !pattern.test(input);
}

function validaSenha(senha, cSenha, tamanho){
    if((senha.length === 0) || (cSenha.length === 0)){
        return true

    }
    else if(senha.length < tamanho) {
        return true
    }
    else if(senha !== cSenha){
        return true
    }
    else{
        return false
    }
}


function validarEmail(input, tamanho) {
    if(input.length === 0 ){
        return true
    }
    else if( input.length > tamanho) {
        return true
    }else if(!(input.includes("@")) || !(input.includes("."))){
        return true
    }
    var pattern = /^[a-zA-Z0-9@._]+$/;
    return !pattern.test(input);
}

function displayReset(){
    document.getElementById("frmSingupNomeErro").innerHTML = "";
    document.getElementById("frmSingupSenhaErro").innerHTML = "";
    document.getElementById("frmSingupcSenhaErro").innerHTML = "";
    document.getElementById("frmSingupEmailErro").innerHTML = "";

    document.getElementById("frmSingupNome").style.borderColor = "#66bbff";
    document.getElementById("frmSingupSenha").style.borderColor = "#66bbff";
    document.getElementById("frmSingupcSenha").style.borderColor = "#66bbff";
    document.getElementById("frmSingupEmail").style.borderColor = "#66bbff";
}

function sendLoginRequest() {
            var username = document.getElementById("frmSinginNome").value;
            var password = document.getElementById("frmSinginSenha").value;

            var data = {
                userName: username,
                passWord: password
            };

            var jsonData = JSON.stringify(data);

            fetch('auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: jsonData
            })
            .then(response => {

                if(response.ok){
                    closeLogin();
                    location.reload()
                }else if(response.status == 404){
                     alertMensage('erro', 'Falha no login, dados inválidos');

                }
            })
            .catch(error => {
                console.error('Erro na requisição de login:', error);
            });
        }