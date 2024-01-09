<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.latera.models.web.EventModel" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LaTera - Events list</title>
        <meta name="description" content="Atualizações">
          <link rel="icon" href="/static/img/icon.jpg">
          <link rel="stylesheet" href="/static/css/events.css">
    </head>
    <body>
        <div id="mainContentAttDiv">
<!--       <div id="mainContentAttPainelDiv" <%if(request.getAttribute("type").equals("1")){%>style="border: solid 5px #0073b2;<%}else if(request.getAttribute("type").equals("2")){%>style="border: solid 5px #f2defb;"<%}else if(request.getAttribute("type").equals("0")){%>style="border: solid 5px #000;"<%}else if(request.getAttribute("type").equals("3")){%>style="border: solid 5px #FFA500;"<%}%>">-->
            <div id="mainContentAttPainelDiv" >
                <div class="mainContentBottomEventsEventBoxDiv">
                    <div class="mainContentBottomEventsEventTabsDiv Flex2">
                        <div><a href="/eventlist?type=0" class="tabs" <%if(request.getAttribute("type").toString().equals("0")){%>style="border-color: red;"<%}%>>All</a></div>
                        <div><a href="/eventlist?type=1" class="tabs" <%if(request.getAttribute("type").toString().equals("1")){%>style="border-color: red;"<%}%>>Update</a></div>
                        <div><a href="/eventlist?type=2" class="tabs" <%if(request.getAttribute("type").toString().equals("2")){%>style="border-color: red;"<%}%>>Eventos</a></div>
                        <div><a href="/eventlist?type=3" class="tabs" <%if(request.getAttribute("type").toString().equals("3")){%>style="border-color: red;"<%}%>>Promoções</a></div>
                    </div>
                </div>

                <%
                    int cont = 0;
                    List<EventModel> eventList = (List<EventModel>) request.getAttribute("list");

                %>
                <ul>
                    <% for (EventModel event : eventList)  {
                        if(cont < 6){

                            %>
                            <li>
                                <img src='/static/img/event<%= event.getEventType() %>.png'>
                                <a onClick="redirecionarPaginaPai(<%= event.getId() %>)">
                                    <%= event.getEventTitle() %>
                                </a>
                                <span>
                                    <%= event.getEventTime().split(" ")[0] %>
                                </span>
                            </li>
                       <%cont++;
                        }
                       } %>
                </ul>
            </div>
        </div>
        <script>
            function redirecionarPaginaPai(id) {

              window.top.location.href = "/event?id="+id;
            }
      </script>
    </body>
</html>
