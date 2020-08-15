<#--
 объявляем макро-функцию используя которую мы создадим шаблон страницы
 https://freemarker.apache.org/docs/dgui_misc_userdefdir.html
 -->
<#import "/spring.ftl" as spring>
<#macro renderWith title scripts=[] styles=[] dir="ltr">
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
<#--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title> ${title}title</title>
<#--        <link rel="stylesheet" href="/css/styles.css">-->
        <link rel="stylesheet" href="/css/main.css">
        <#list styles as styleSource>
            <link rel="stylesheet" href="${styleSource}">
        </#list>
    </head>
    <body>


    <header class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="/">main</a>
                <ul id="ulist" class="navbar-nav">
                    <#if user??>
                        <li class="nav-item">
                            <a class="nav-link" href="/successful"> profile</a>
                        </li>
                    <#else>
                    <p>logout</p>
                    </#if>
                </ul>
        </nav>
            <div class="collapse navbar-collapse justify-content-center">
                <ul class="nav">
<#--                    <#if user??>-->
                        <li class="nav-item mr-2 form-inline">
                            <input type="search" id="search-input" class="form-control " placeholder="Поиск"/>
                            <button class="btn btn-outline-light ml-1" id="btn-search" onclick="search()">Поиск</button>
                        </li>
<#--                    <#else>-->
<#--                    </#if>-->
                </ul>
            </div>
            <#if user??>
                <ul  class="nav justify-content-end navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/add_place">Add Place</a>
                    </li>
                    <li class="nav-item">
                        <form  action="/logout" method="post">
                            <#if _csrf??>
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                            </#if>
                            <button class=" btn btn-light" > Logout</button>
                        </form>
                    </li>
                </ul>
            <#else>
                <ul  class="nav justify-content-end navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/registration">Registration</a>
                    </li>
                </ul>
            </#if>
        </div>
    </header>



    <div class="container ">
        <#nested>

    </div>
<#--    <script src="js/main.js"></script>-->
    <script src="js/script.js"></script>

    <#list scripts as scriptSource>
        <script src="${scriptSource}"></script>
    </#list>

    </body>
    </html>

</#macro>