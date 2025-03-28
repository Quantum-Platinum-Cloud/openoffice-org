<%
  // from jbake - content.file, content.uri and content.body
  // from page metadata - content.title and content.css
  if ( content.file.endsWith(".html") || content.file.endsWith(".htm") ) {
    // using content.body if html get content.header, content.bodytag, and content.extracted_body
    include "html_extract.gsp"
  }
  // insert breadcrumbs and ssi logic
  // using content.uri get content.breadcrumbs and content.ssi[]
  include "breadcrumbs.gsp"
  // using content.ssi[] get content.brand, content.topnav, content.leftnav and content.rightnav
  include "ssi_paths.gsp"
  // adjust css from markdown output
  if (content.image_css || content.list_css) {
     include "markdown_css.gsp";
  }
%><!--#include virtual="/doctype.html" -->
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <% if (content.header) { %>
    <link href="/css/ooo.css" rel="stylesheet" type="text/css">
    ${content.header}
    <% }  else { %>
    <title>${content.title}</title>
    <link href="/css/ooo.css" rel="stylesheet" type="text/css">
    <% if (content.css) { %>
    <link href="${content.css}" rel="stylesheet" type="text/css">
    <% } %>
    <% if (content.css2) { %>
    <link href="${content.css2}" rel="stylesheet" type="text/css">
    <% } %>
    <% } %>
    <script src="https://www.apachecon.com/event-images/snippet.js"></script>
  </head>
  <body<% if (content.bodytag) { %>${content.bodytag}<% } %>>
    <!--#include virtual="${content.brand}" -->
    <div id="topbara">
      <% if (content.topnav) { %><!--#include virtual="${content.topnav}" --><% } %>
      <div id="breadcrumbsa">${content.breadcrumbs}</div>
    </div>
    <div id="clear"></div>
      <% if (content.leftnav) { %><!--#include virtual="${content.leftnav}" --><% } %>
      <% if (content.rightnav) { %><!--#include virtual="${content.rightnav}" --><% } %>
    <div id="content"><% if (content.title) {%><h1 class="title">${content.title}</h1><% } %>
      <% if (content.extracted_body) { %>
      ${content.extracted_body}
      <% } else { %>
      ${content.body}
      <% } %>
    </div>
    <!--#include virtual="/footer.html" -->
  </body>
</html>
