<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="model.Autor" %>
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
          <link rel="stylesheet" href="/latera/css/events.css">
    </head>
    <body>
        <div id="mainContentAttDiv">
<!--       <div id="mainContentAttPainelDiv" <%if(request.getAttribute("type").equals("1")){%>style="border: solid 5px #0073b2;<%}else if(request.getAttribute("type").equals("2")){%>style="border: solid 5px #f2defb;"<%}else if(request.getAttribute("type").equals("0")){%>style="border: solid 5px #000;"<%}else if(request.getAttribute("type").equals("3")){%>style="border: solid 5px #FFA500;"<%}%>">-->
            <div id="mainContentAttPainelDiv" >
                <div class="mainContentBottomEventsEventBoxDiv">
                    <div class="mainContentBottomEventsEventTabsDiv Flex2">
                        <div><a href="/latera/api/eventsList?type=0" class="tabs" <%if(request.getAttribute("type").equals("0")){%>style="border-color: red;"<%}%>>All</a></div>
                        <div><a href="/latera/api/eventsList?type=1" class="tabs" <%if(request.getAttribute("type").equals("1")){%>style="border-color: red;"<%}%>>Update</a></div>
                        <div><a href="/latera/api/eventsList?type=2" class="tabs" <%if(request.getAttribute("type").equals("2")){%>style="border-color: red;"<%}%>>Eventos</a></div>
                        <div><a href="/latera/api/eventsList?type=3" class="tabs" <%if(request.getAttribute("type").equals("3")){%>style="border-color: red;"<%}%>>Promoções</a></div>
                    </div>
                </div>

                <%  
                    int cont = 0;
                    String jsonList = request.getAttribute("listatt").toString();
                    Gson gson = new Gson();
                    Autor[] attArray = gson.fromJson(jsonList, Autor[].class);
                %>
                <ul>
                    <% for (Autor autor : attArray)  { 
                        if(cont < 6){
                            JsonElement jsonElement = gson.toJsonTree(autor);
                            JsonObject jsonObject = jsonElement.getAsJsonObject(); 
                            %>
                            <li><img src='/latera/img/event<%= jsonObject.get("autorType").getAsString() %>.png'><a onClick="redirecionarPaginaPai(<%= jsonObject.get("autorId").getAsString() %>)"><%= jsonObject.get("autorTitle").getAsString() %></a><span><%= jsonObject.get("autorDataTime").getAsString() %></span></li>
                       <%cont++;
                        }
                       } %>
                </ul>
            </div>
        </div>
        <script>
            function redirecionarPaginaPai(id) {

              window.top.location.href = "/latera/event?id="+id;
            }
      </script>
    </body>
</html>
