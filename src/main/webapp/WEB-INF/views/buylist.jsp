<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.latera.models.web.OffertModel" %>
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
          <link rel="stylesheet" href="/static/css/buylist.css">
    </head>
    <body>

    <%
        List<OffertModel> offerts = (List<OffertModel>) request.getAttribute("offerts");
        String type = (String) request.getAttribute("type").toString();
    %>

        <div id="mainContentAttDiv">
            <div id="mainContentAttPainelDiv" >
                <div class="mainContentBottomEventsEventBoxDiv">
                    <div class="mainContentBottomEventsEventTabsDiv Flex2">
                        <div><a href="/offerts?type=0" class="tabs" <% if("0".equals(type)){ %>style="border-color: red;"<% } %>>All</a></div>
                        <div><a href="/offerts?type=1" class="tabs" <% if("1".equals(type)){ %>style="border-color: red;"<% } %>>Tikat</a></div>
                        <div><a href="/offerts?type=2" class="tabs" <% if("2".equals(type)){ %>style="border-color: red;"<% } %>>Packs e Serviços</a></div>
                    </div>
                </div>

                <ul>
                    <% for (OffertModel offert : offerts)  {%>
                            <li><img src='/static/img/event3.png'><a onClick="redirecionarPaginaPai(<%= offert.getId() %>)"><%= offert.getOfferTitle() %></a></span></li>
                    <%}%>
                </ul>
            </div>
        </div>
        <script>
            function redirecionarPaginaPai(id) {

              window.top.location.href = "/shop?id="+id;
            }
      </script>
    </body>
</html>
