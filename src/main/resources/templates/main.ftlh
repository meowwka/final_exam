<#import "partials/main.ftlh" as main />

<@main.renderWith title="Main">

    <h1>Places</h1>

<#--    <div class="flex flex-wrap" id="itemList">-->

    <div class="row">
    <#list items as listItem>
    <#--            <div class="flex flex-column box flex-v-center">-->
    <#--                <a href="/places/${listItem.id}">-->
    <#--                    <div class="flex flex-column flex-v-center box-128">-->
    <#--                        <img class="food-icon" src="${listItem.imagePath}" alt="${listItem.name}">-->
    <#--                        ${listItem.name}-->
    <#--                    </div>-->
    <#--                </a>-->
    <#--            </div>-->
        <div class="col-sm-3">


        <div class="card bg-light border-dark mb-3" style="width: 15rem;">
                    <img src="/images/${listItem.imagePath}" class="card-img-top food-icon" alt="..." style=" height:21rem">
                    <a class="text-dark" href="/places/${listItem.id}">
                        <div class="card-body">
                            <h5 class="card-title">${listItem.name}</h5>
                            <p class="card-text">Some quick example .</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </a>
                </div>
        </div>


    </#list>
    </div>

<#--    </div>-->

<#--
здесь мы подставляем содержимое другого "частичного" шаблона
который отвечает за отображение элементов для постраничного просмотра данных
https://freemarker.apache.org/docs/ref_directive_include.html
 -->
    <#include "partials/pagination.ftlh">

</@main.renderWith>