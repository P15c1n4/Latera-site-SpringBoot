<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.example.latera.models.web.OffertModel" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LaTera - Shop</title>
    <meta name="description" content="Atualizações">
      <link rel="icon" href="/static/img/icon.jpg">
      <link rel="stylesheet" href="/static/css/shop.css">
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
                                        <li><a class="botao2" href="/auth/logout">Sair</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="logoinner">
                            <a href="/"><img src="/static/img/logo.png" alt="tera logo"></a>
                        </div>
                    </div>
                </div>
                <div id="mainproductDescListDiv" class="Flex3">
                    <div id="productDescRightDiv">
                        <div id="productDescRightLimitDiv">

                            <%
                               OffertModel offert = (OffertModel) request.getAttribute("offert");
                            %>

                            <h2><%out.print(offert.getOfferTitle());%></h2>
                            <% if(!offert.getOfferType().toString().equals("0")){ %><a class="botao2" href="/pay?id=<% out.print(offert.getId()); %>" target="_blank">COMPRE AGORA! por R$<%out.print(offert.getOfferPrice());%></a><% } %>
                            <div id="productDescTextDiv">
                                <%out.print(offert.getOfferDisc());%>
                            </div>
                        </div>
                    </div>
                    <div id="productListLeftDiv">
                        <h2>Lista de ofertas da loja.</h2>
                        <iframe src="/offerts?type=<% out.print(offert.getOfferType()); %>" height="965" width="500"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
