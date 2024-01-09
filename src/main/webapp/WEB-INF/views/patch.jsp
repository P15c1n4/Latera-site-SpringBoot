<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.latera.models.web.EventModel" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LaTera - Patch</title>
    <meta name="description" content="Atualizações">
      <link rel="icon" href="/static/img/icon.jpg">
      <link rel="stylesheet" href="/static/css/patch.css">
</head>
    <%
        EventModel event = (EventModel) request.getAttribute("event");
        List<EventModel> eventList = (List<EventModel>) request.getAttribute("list");
    %>
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
                                <li><a href="/hall" class="menuTextColor">Hall</a></li>
                                <li><a href="/event?id=9" class="menuTextColor" <%if(request.getAttribute("type").toString().equals("1")){%>style="font-weight: 700;"<%}%>>Updates</a></li>
                                <li><a href="/event?id=10" class="menuTextColor" <%if(request.getAttribute("type").toString().equals("2")){%>style="font-weight: 700;"<%}%>>Eventos</a></li>
                                <li><a href="/event?id=11" class="menuTextColor" <%if(request.getAttribute("type").toString().equals("3")){%>style="font-weight: 700;"<%}%>>Promoções</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="logoinner">
                    <a href="/"><img src="/static/img/logo.png" alt="tera logo"></a>
                </div>
            </div>
        </div>
        <div id="mainContentBottomDiv" class="Flex1">
            <div id="mainContentBottomInnerDiv" class="Flex2">
                <div id="mainContentTextDiv" cless="Flex3">
                    <%if(event.getEventTitle() != null){%>
                        <div id="headerTitleDiv">
                            <div id="headerTitleTextDiv">
                                <h2><p><%out.print(event.getEventTitle());%></p></h2>
                            </div>
                        </div>
                        <div id="headerAutorDataDiv" class="Flex4">
                            <div id="headerAutorDiv">
                                <h3><a>Autor: </a><a id="autorNome"><%out.print(event.getEventAutor());%></a></h3>
                            </div>
                            <div id="headerTimeTextDiv" class="Flex5">
                                <a style="font-weight: 700;">em: <%out.print(event.getEventTime());%></a>
                            </div>
                        </div>
                    <%}%>
                    <%if(event.getEventText() != null){%>
                        <div id="textDiv">
                            <%out.print(event.getEventText());%>
                        </div>
                    <%}%>
                </div>
                <div id="mainContentAttDiv">
                    <h2>Eventos semelhantes.</h2>
                    <div id="mainContentAttPainelDiv" class="Flex1" <%if(request.getAttribute("type").toString().equals("1")){%>style="border: solid 5px #0073b2;<%}else if(request.getAttribute("type").toString().equals("2")){%>style="border: solid 5px #f2defb;"<%}else if(request.getAttribute("type").toString().equals("3")){%>style="border: solid 5px #FFA500;"<%}%>">

                        <ul>
                            <% for (EventModel events : eventList)  { %>
                                <li><img src='/static/img/event<%= events.getEventType() %>.png'><a href='event?id=<%= events.getId() %>'><%= events.getEventTitle() %></a><span><%= events.getEventTime().split(" ")[0] %></span></li>
                            <% } %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>  


    </body>
</html>
