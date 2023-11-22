<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LaTera | tera private server</title>
    <meta name="description" content="Servidor private de tera online, v100.02, hospedado no Brasil
     com ping baixo e suporte a proxy, não somos um servidor pirata e sim um servidor que evolui com os
      jogadores aceitando sugestões de atualizações e discussões em nosso discord.">
      <link rel="icon" href="/static/img/icon.jpg">
      <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <div class="Conteiner Flex7" id="alert">
        <a class="alertBotao" ></a>
    </div>

    <input type="checkbox" id="checkLogin">
    <div id="divLogin">
        <a id="closeLogin"><img src="/static/img/close.png"></a>
        <section id="senctionSingup">
            <div class="Conteiner Flex7" id="SinginInfo">
                <h2 >Logar conta</h2>
                <form name="frmLogin" class="Conteiner FrmSingup">
                    <table>
                        <tr id="tdFrmSingup">
                            <td><input type="text" name="login" placeholder="Usuário" class="caixa1" id="frmSinginNome"><p class="frmSingupErro" id="frmSinginNomeErro"></p></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="password" placeholder="Senha" class="caixa1" id="frmSinginSenha"><p class="frmSingupErro" id="frmSinginSenhaErro"></p></td>
                        </tr>
                    </table>
                </form>
                <div class="Conteiner">
                    <input type="button" value="logar" class="botao1" id="singinButton" onclick="validarLogin()">
                </div>
            </div>
        </section>
    </div>

    <input type="checkbox" id="checkSingup">
    <div id="divSingup">
        <a id="closeSingup"><img src="/static/img/close.png"></a>
        <section id="senctionSingup">
            <div class="Conteiner Flex7" id="SingupInfo">
                <h2 >Registrar conta</h2>
                <form name="frmSingup" class="Conteiner FrmSingup">
                    <table>
                        <tr>
                            <td><img src="/static/img/reprovado.png" alt="validador" id="validate"/><input type="text" name="nome" placeholder="Usuário 4-15" class="caixa1" id="frmSingupNome"><p class="frmSingupErro" id="frmSingupNomeErro"></p></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="senha" placeholder="Senha 8+" class="caixa1" id="frmSingupSenha"><p class="frmSingupErro" id="frmSingupSenhaErro"></p></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="cSenha" placeholder="Confirmar senha 8+" class="caixa1" id="frmSingupcSenha"><p class="frmSingupErro" id="frmSingupcSenhaErro"></p></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="email" placeholder="E-mail" class="caixa1" id="frmSingupEmail"><p class="frmSingupErro" id="frmSingupEmailErro"></p></td>
                        </tr>
                    </table>
                </form>
                <div class="Conteiner">
                    <input type="button" value="Criar conta" class="botao2" id="singupButton" onclick="validarRegistro()">
                </div>
            </div>
        </section>
    </div>

    <!-- cabeçalho -->
    <header id="inicio">
        <div class="Conteiner Flex">
            <div class="logo">
                <a href="/latera"><img src="/static/img/logo.png" alt="tera logo"></a>
            </div>
            <nav>
                <input type="checkbox" id="check">
                <label for="check">&#x268c;</label>
                <ul>
                    <li><a href="#inicio">Início</a></li>
                    <li><a href="#sobre">Sobre</a></li>
                    <li><a href="#onepage">Quem somos?</a></li>
                    <li><a href="#conteudo">Conteúdo</a></li>
                    <li><a href="#wireframe">Download</a></li>
                    <%if(session.getAttribute("usernome") == null){%>
                        <li class="botaoS"><a class="botao1" id="buttonLogin1">Entrar</a></li>
                        <li class="botaoS"><a class="botao2" id="buttonSingup1">Registrar</a></li>
                    <%}else{%>
                        <li class="botaoS"><a class="botao1" id="buttonAccount" href="hall">Olá, <%out.print(session.getAttribute("usernome"));%></a></li>
                        <li class="botaoS"><a class="botao2" id="buttonLogout" href="/auth/logout">Logout</a></li>
                    <%}%>
                </ul>
            </nav>
        </div>
    </header>
    <!-- Destaque -->
    <main>
        <div class="Conteiner">
            <h1>LaTera</h1>
            <h2>Tera private server Brasil</h2>
            <a href="https://www.youtube.com/watch?v=YLERP7w_9D0" target="_blank" class="Botao">O que é tera?</a>
        </div>
    </main>
    <!-- Sobre -->
    <section id="sobre">
        <div class="Conteiner Flex2">
            <div id="destaqueSobre">
                <img src="/static/img/quadro1.jpg" alt="LaTera tera server private. Femele Elf">
                <div>
                    <h2>Novidades</h2>
                    <iframe src="/latera/api/eventsList?type=0" width="485" height="290"></iframe>
                </div>
            </div>
            <div id="textoSobre">
                <h2>Jogue com o menor ping e o melhor desempenho.</h2>
                <p>Você está pronto para uma experiência de jogo incrível?
                    Venha jogar no LaTera, servidor hospedado no Brasil! Com latência baixa e alto desempenho, 
                    você poderá jogar de igual para igual com outros jogadores, sem se preocupar com problemas de latência. 
                    Além disso, nosso servidor é totalmente personalizável, permitindo nossas próprias regras e modos de jogo. 
                    Não perca mais tempo jogando em servidores Bugados cheios de problemas, venha jogar conosco e experimente a verdadeira emoção de jogar TERA! 
                    junte-se a nós agora e desfrute de uma aventura incrível!</p>
                <div class="TopicosSobre Flex2">
                    <img src="/static/img/ping.png" alt="foguete">
                    <p>Ping baixo 5~20</p>
                </div>
                <div class="TopicosSobre Flex2">
                    <img src="/static/img/comu.png" alt="comunidade">
                    <p>Comunidade e GMs ativos!</p>
                </div>
                <div class="TopicosSobre Flex2">
                    <img src="/static/img/code.png" alt="script code">
                    <p>Server personalizado!</p>
                </div>                                
            </div>
        </div>
    </section>
    <!-- One page -->
    <section id="onepage">
        <div class="Conteiner Flex3">
            <div class="textoSite">
                 <h2>Quem somos nózes?</h2>
                <p>Somos um grupo de jogadores
                     de TERA dedicados a manter o jogo ativo.
                      Jogamos desde o início do jogo e contribuímos
                       muito para o desenvolvimento da comunidade
                        brasileira. Agora, estamos criando
                         um servidor personalizado e mais
                          equilibrado para toda a comunidade
                           da América Latina.</p>
            </div>
            <div id="video">
                <iframe id="iframeVideo" width="560" height="315" src="https://www.youtube.com/embed/vjRNm_sOBLE" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
        </div>
    </section>
    <!-- Download -->
    <section id="wireframe">
        <div class="Conteiner Flex2">
            <div id="textoWire">
                <h2>Download!</h2>
                <p>Baixe agora mesmo <span>no PC!</span> Download via launcher(web install) ou download direto(Jogo completo)</p>
                <div class="textoWireBotao Flex6">
                    <li><a href="#" class="Botao">Launcher</a></li>
                    <li><a href="#" class="Botao">Instalador_Direto</a></li>
                </div>
            </div>
            <div id="down">
                <img src="/static/img/down1.png" alt="download">
            </div>
        </div>
    </section>
    <!-- Conteudo -->
    <section id="conteudo">
        <div class="Conteiner">
            <h2>Conteúdo</h2>
            <div class="Cards Flex4">
                <div class="Card">
                    <img src="/static/img/card1.jpg" alt="darkan boss tera online privare server">
                <h3>Dungeons</h3>
                    <p style="text-align: center;">As dungeons em Tera são desafiantes e oferecem recompensas valiosas.
                          Em um nosso servidor, elas
                           podem ter sido re-balanceadas
                            para aumentar a dificuldade.
                             Isso inclui mecanismos de combate
                              e mudanças na forma de lidar com
                               os inimigos. Isso torna a experiência mais emocionante
                                 e desafiadora, mas também exige estratégia
                                  e trabalho em equipe. Isso torna as
                                   dungeons mais divertidas e recompensadoras.</p>
                    <a href="" target="_blank" class="Botao">Veja +</a>
                </div>
                <div class="Card">
                    <img src="/static/img/card2.jpg" alt="pvp tera online privare server">
                                        <h3>PVP open word</h3>
                    <p style="text-align: center;">O PVP em nosso servidor foi re-balanceado, oferecendo uma experiência
                          mais justa e emocionante. Isso inclui mudanças
                           nas habilidades e equipamentos dos jogadores,
                            novas regras e mecanismos para tornar as batalhas
                             mais intensas. Isso torna o PVP mais competitivo
                              e dá aos jogadores a oportunidade de mostrar suas
                               habilidades em combate. Realizamos balanceammento constantes. Então, venha e experimente
                                essa emoção!</p>
                    <a href="" target="_blank" class="Botao">Veja +</a>
                </div>
                <div class="Card">
                    <img src="/static/img/card3.jpg" alt="pvp tera online privare server">
                    <h3>Rally, civil unrest e eventos</h3>
                    <p style="text-align: center;">Os eventos open world em Tera como "Rally" oferecem novos
                         desafios e recompensas para os jogadores em um servidor
                          privado. Um exemplo é o evento "Civil Unrest", onde os
                           jogadores se unem em uma batalha entre guilds. Isso inclui
                            batalhas em massa, missões cooperativas e desafios únicos
                            . Os jogadores podem ganhar recompensas exclusivas por
                             participar e completar esses desafios.</p>
                    <a href="" target="_blank" class="Botao">Veja +</a>
                </div>
            </div>
            <div id="todos">
                <a href="https://discord.gg/nKjvvnGujf" target="_blank">Entre na nossas comunidade!</a>
            </div>
        </div>
    </section>
    <!-- RodapÃ© -->
    <address>
        <div class="Conteiner">
            <div id="contato">

            </div>
        </div>
    </address>
    <footer>
        <div class="Conteiner Flex5">
            <div id="copyright">
                <p>&#169; Piscina#9603</p>
            </div>
            <div id="social" class="Flex5">
                <div class="socialText">
                    <a href="https://steamcommunity.com/profiles/76561198067001212/" target="_blank">
                        <img src="/static/img/steam.png" alt="Steam icon" title="Meu perfil steam"></a>
                    <p>Contate-me via Steam!</p>
                </div>
                <div class="socialText">
                    <a href="https://discord.gg/" target="_blank">
                        <img src="/static/img/discord.png" alt="Discord icon" title="Entrar no discord"></a>
                    <p>Entre no nosso Discord!</p>
                </div>
            </div>
        </div>
    </footer>
    <a href="#inicio" id="topo"><img src="/static/img/top.png" alt="topo do site"></a>
    <script src="/static/js/index.js"></script>
</body>
</html>