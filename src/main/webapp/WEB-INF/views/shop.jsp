<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LaTera - Shop</title>
    <meta name="description" content="Atualizações">
      <link rel="icon" href="/latera/img/icon.jpg">
      <link rel="stylesheet" href="/latera/css/shop.css">
</head>
    <body>
        <div id="mainDiv">
            <div id="mainContentDiv" class="Flex4">
                <div id="mainHeaderMenuDiv" class="Flex1">
                    <div class="headerCentralDiv Flex5">
                        <div class="headerNavDiv">
                            <div class="headerNavConteinerDiv Flex6">
                                <nav>
                                    <input type="checkbox" id="check">
                                    <label for="check" style="color: #fff;">&#x268c;</label>
                                    <ul>
                                        <li><a href="hall" class="menuTextColor">Hall</a></li>
                                        <li><a href="trade" class="menuTextColor">Trade</a></li>
                                        <li><a href="shop?id=1" class="menuTextColor" style="font-weight: 700;">Shop</a></li>
                                        <li><a class="botao2" href="logout">Logout</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="logoinner">
                            <a href="/latera"><img src="/latera/img/logo.png" alt="tera logo"></a>
                        </div>
                    </div>
                </div>
                <div id="mainproductDescListDiv" class="Flex3">
                    <div id="productDescRightDiv">
                        <div id="productDescRightLimitDiv">
                            <h2><%out.print(request.getAttribute("title"));%></h2>
                            <% if(!request.getAttribute("type").toString().equals("0")){ %><a class="botao2" href="/latera/pay?id=<% out.print(request.getAttribute("id")); %>" target="_blank">COMPRE AGORA! por R$<%out.print(request.getAttribute("price"));%></a><% } %>
                            <div id="productDescTextDiv">
                                <%out.print(request.getAttribute("desc"));%>
                            </div>
                        </div>
                    </div>
                    <div id="productListLeftDiv">
                        <h2>Lista de ofertas da loja.</h2>
                        <iframe src="/latera/api/getOffer?type=<% out.print(request.getAttribute("type")); %>" height="965" width="500"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
