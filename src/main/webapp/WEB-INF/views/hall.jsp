<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LaTera - Minha conta</title>
        <meta name="description" content="Conta, Pï¿½gina principal">
        <link rel="icon" href="/latera/img/icon.jpg">
        <link rel="stylesheet" href="/latera/css/style.css">
    </head>
    <body onload="findPlayerRank(), getEventList('0')">
        <%if(request.getAttribute("alert") != null){%> 
            <div class="Conteiner Flex7" id="alert">
                <a class="alertBotao" id="alertBotaoAlert"><%out.print(request.getAttribute("alert"));%></a>
            </div>
        <%}else if(request.getAttribute("erro") != null){%>
            <div class="Conteiner Flex7" id="alert">
                <a class="alertBotao" id="alertBotaoErro"><%out.print(request.getAttribute("erro"));%></a>
            </div>
        <%}%>
        <div class="centralMainDiv Flex13">
            <div class="centralMainLimiteDiv">
                <div class="headerCentralDiv Flex11">
                    <div class="headerNavDiv">
                        <div class="headerNavConteinerDiv Flex8">
                            <nav>
                                <input type="checkbox" id="check">
                                <label for="check" style="color: #fff">&#x268c;</label>
                                <ul>
                                    <li><a href="hall" class="menuTextColor" style="font-weight: 700;">Hall</a></li>
                                    <li><a href="trade" class="menuTextColor">Trade</a></li>
                                    <li><a href="shop?id=1" class="menuTextColor">Shop</a></li>
                                    <li class="botaoS"><a class="botao2" id="buttonLogout" href="logout">Logout</a></li>  
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="logoinner">
                        <a href="/latera"><img src="/latera/img/logo.png" alt="tera logo"></a>
                    </div>
                </div>
                <div class="mainContentDiv Flex7">
                    <div class="mainContentTopDiv">
                        <div class="mainConttentTopBannerDiv">
                            <ul class="slideShow">
                                <li class="slideShowTagLi showBanner"><a href="" ><img src="img/slideshow1.jpg" alt=""></a></li>
                                <li class="slideShowTagLi"><a href=""><img src="img/slideshow2.jpg" alt=""></a></li>
                                <li class="slideShowTagLi"><a href=""><img src="img/slideshow3.jpg" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="mainConttentTopBannerControlDiv Flex8">
                        <input class="controlerBanner" type="radio" name="controlerBanner" onclick="selectChild(0)">
                        <input class="controlerBanner" type="radio" name="controlerBanner" onclick="selectChild(1)">
                        <input class="controlerBanner" type="radio" name="controlerBanner" onclick="selectChild(2)">
                    </div>
                    <div class="mainContentBottomDiv">
                        <div class="mainContentBottomConteinerDiv Flex6">
                            <div class="mainContentBottomConteudoSemanalDiv Flex7">
                                <div class="mainContentBottomIconsDiv Flex">
                                    <a href="https://discord.gg/nKjvvnGujf" target="_blank"><img src="img/discordico.png" alt="icon"></a>
                                    <a href="https://github.com/P15c1n4" target="_blank"><img src="img/git.png" alt="icon"></a>
                                    <a href=""><img src="img/insta.png" alt="icon"></a>
                                    <a href=""><img src="img/pay.png" alt="icon"></a>
                                </div>
                                <div class="mainContentBottomBannerDiv">
                                    <a href=""><img src="img/innerbanner.png" alt=""></a>
                                </div>
                            </div>
                            <div class="mainContentBottomRightDiv Flex9">
                                <div class="mainContentBottomRightTopEventsDiv Flex6 Flex10">
                                    <iframe src="/latera/api/eventsList?type=0" width="485" height="290">
                                    </iframe>
                                    <div class="mainContentBottomEventsUpdateDiv Flex7">
                                        <a href="/latera/event?id=9" class="Botao">Patch notes</a>
                                        <a href="" target="_blank" class="Botao">Códigos</a>
                                        <a href="" class="Botao">Sua Arte</a>
                                        <a href="https://discord.gg/nKjvvnGujf" target="_blank" class="Botao">Suporte</a>
                                    </div>
                                </div>
                                <div class="mainContentBottomRightBottomRankDiv">
                                    <div class="mainContentBottomRightBottomTabsDiv">
                                        <div class="mainContentBottomRightBottomTabsDgDiv Flex2">
                                            <div><a onClick="setRankTab('ALL')" class="tabs" id="ALL">All</a></div>
                                            <div><a onClick="setRankTab('9916')" class="tabs" id="9916">SC (HARD)</a></div>
                                            <div><a onClick="setRankTab('9027')" class="tabs" id="9027">MC (HARD)</a></div>
                                            <div><a onClick="setRankTab('3126')" class="tabs" id="3126">CS (HARD)</a></div>
                                            <div><a onClick="setRankTab('3203')" class="tabs" id="3203">FAU (HARD)</a></div>
                                        </div>
                                    </div>
                                    <div class="mainContentBottomRightBottomRankFinderDiv Flex2">
                                        <input type="text" id="findUserRank" placeholder="  BUSCAR JOGADORES NO RANK">
                                        <a onClick="findPlayerRank()"><img src="img/lupa.png" alt=""></a>
                                    </div>
                                    <div class="mainContentBottomRightBottomRankListDiv">
                                        <div class="eventsContent" id="playerRankUser0">
                                            <div><img src="img/unk.png" alt=""><a style="color: #fff"></a><span></span></div>
                                        </div>
                                        <div class="eventsContent" id="playerRankUser1">
                                            <div><img src="img/unk.png" alt=""><a style="color: #fff"></a><span></span></div>
                                        </div>
                                        <div class="eventsContent" id="playerRankUser2">
                                            <div><img src="img/unk.png" alt=""><a style="color: #fff"></a><span></span></div>
                                        </div>
                                        <div class="eventsContent" id="playerRankUser3">
                                            <div><img src="img/unk.png" alt=""><a style="color: #fff"></a><span></span></div>
                                        </div>
                                        <div class="eventsContent" id="playerRankUser4">
                                            <div><img src="img/unk.png" alt=""><a style="color: #fff"></a><span></span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer>
                    <div class="footerContactDiv Flex5">
                        <div id="copyright">
                            <p>&#169; Piscina#9603</p>
                        </div>
                        <div id="social" class="Flex5">
                            <div class="socialText">
                                <a href="https://steamcommunity.com/profiles/76561198067001212/" target="_blank">
                                    <img src="img/steam.png" alt="Steam icon" title="Meu perfil steam"></a>
                                <p>Contate-me via Steam!</p>
                            </div>
                            <div class="socialText">
                                <a href="https://discord.gg/nKjvvnGujf" target="_blank">
                                    <img src="img/discord.png" alt="Discord icon" title="Entrar no discord"></a>
                                <p>Entre no nosso Discord!</p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    <script src="/latera/js/hall.js"></script>
    </body>
</html>