<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="model.Autor" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.google.gson.JsonObject" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LaTera - Patch</title>
    <meta name="description" content="Atualizações">
      <link rel="icon" href="/latera/img/icon.jpg">
      <link rel="stylesheet" href="/latera/css/patch.css">
</head>
    <body>
    <div id="mainDiv">
        <div id="mainHeaderMenuDiv" class="Flex1">
            <div class="headerCentralDiv Flex5">
                <div class="headerNavDiv">
                    <div class="headerNavConteinerDiv Flex6">
                        <nav>
                            <input type="checkbox" id="check">
                            <label for="check" style="color: #fff;">&#x268c;</label>
                            <ul>
                                <li><a href="/latera/hall" class="menuTextColor">Hall</a></li>
                                <li><a href="/latera/event?id=9" class="menuTextColor" <%if(request.getAttribute("type").equals("1")){%>style="font-weight: 700;"<%}%>>Updates</a></li>
                                <li><a href="/latera/event?id=10" class="menuTextColor" <%if(request.getAttribute("type").equals("2")){%>style="font-weight: 700;"<%}%>>Eventos</a></li>
                                <li><a href="/latera/event?id=11" class="menuTextColor" <%if(request.getAttribute("type").equals("3")){%>style="font-weight: 700;"<%}%>>Promoções</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="logoinner">
                    <a href="/latera"><img src="img/logo.png" alt="tera logo"></a>
                </div>
            </div>
        </div>
        <div id="mainContentBottomDiv" class="Flex1">
            <div id="mainContentBottomInnerDiv" class="Flex2">
                <div id="mainContentTextDiv" cless="Flex3">
                    <%if(request.getAttribute("title") != null){%>
                        <div id="headerTitleDiv">
                            <div id="headerTitleTextDiv">
                                <h2><p><%out.print(request.getAttribute("title"));%></p></h2>
                            </div>
                        </div>
                        <div id="headerAutorDataDiv" class="Flex4">
                            <div id="headerAutorDiv">
                                <h3><a>Autor: </a><a id="autorNome"><%out.print(request.getAttribute("autorname"));%></a></h3>
                            </div>
                            <div id="headerTimeTextDiv" class="Flex5">
                                <a style="font-weight: 700;">em: <%out.print(request.getAttribute("date"));%></a>
                            </div>
                        </div>
                    <%}%>
                    <%if(request.getAttribute("text") != null){%>
                        <div id="textDiv">
                            <%out.print(request.getAttribute("text"));%>
                        </div>
                    <%}%>
                </div>
                <div id="mainContentAttDiv">
                    <h2>Eventos semelhantes.</h2>
                    <div id="mainContentAttPainelDiv" class="Flex1" <%if(request.getAttribute("type").equals("1")){%>style="border: solid 5px #0073b2;<%}else if(request.getAttribute("type").equals("2")){%>style="border: solid 5px #f2defb;"<%}else if(request.getAttribute("type").equals("3")){%>style="border: solid 5px #FFA500;"<%}%>">
                        <%
                            String jsonList = request.getAttribute("listatt").toString();
                            Gson gson = new Gson();
                            Autor[] attArray = gson.fromJson(jsonList, Autor[].class);
                        %>
                        <ul>
                            <% for (Autor autor : attArray)  { %>
                                <% JsonElement jsonElement = gson.toJsonTree(autor);
                                   JsonObject jsonObject = jsonElement.getAsJsonObject(); 
                                %>
                                <li><img src='img/event<%= jsonObject.get("autorType").getAsString() %>.png'><a href='event?id=<%= jsonObject.get("autorId").getAsString() %>'><%= jsonObject.get("autorTitle").getAsString() %></a><span><%= jsonObject.get("autorDataTime").getAsString() %></span></li>
                            <% } %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>  


    </body>
</html>
