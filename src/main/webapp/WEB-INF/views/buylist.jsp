<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="model.Offert" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.google.gson.JsonObject" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LaTera - Events list</title>
        <meta name="description" content="Atualizações">
          <link rel="icon" href="/latera/img/icon.jpg">
          <link rel="stylesheet" href="/latera/css/buylist.css">
    </head>
    <body>
        <div id="mainContentAttDiv">
            <div id="mainContentAttPainelDiv" >
                <div class="mainContentBottomEventsEventBoxDiv">
                    <div class="mainContentBottomEventsEventTabsDiv Flex2">
                        <div><a href="/latera/api/getOffer?type=0" class="tabs" <% if("0".equals(request.getAttribute("type"))){ %>style="border-color: red;"<% } %>>All</a></div>
                        <div><a href="/latera/api/getOffer?type=1" class="tabs" <% if("1".equals(request.getAttribute("type"))){ %>style="border-color: red;"<% } %>>Tikat</a></div>
                        <div><a href="/latera/api/getOffer?type=2" class="tabs" <% if("2".equals(request.getAttribute("type"))){ %>style="border-color: red;"<% } %>>Packs e Serviços</a></div>
                    </div>
                </div>

                <%  
                    String jsonList = request.getAttribute("listoffert").toString();
                    Gson gson = new Gson();
                    Offert[] attArray = gson.fromJson(jsonList, Offert[].class);
                %>
                <ul>
                    <% for (Offert offert : attArray)  { 
                            JsonElement jsonElement = gson.toJsonTree(offert);
                            JsonObject jsonObject = jsonElement.getAsJsonObject(); 
                            %>
                            <li><img src='/latera/img/event3.png'><a onClick="redirecionarPaginaPai(<%= jsonObject.get("offertId").getAsString() %>)"><%= jsonObject.get("offertTitle").getAsString() %></a></span></li>
                       <%
                        }
                        %>
                </ul>
            </div>
        </div>
        <script>
            function redirecionarPaginaPai(id) {

              window.top.location.href = "/latera/shop?id="+id;
            }
      </script>
    </body>
</html>
