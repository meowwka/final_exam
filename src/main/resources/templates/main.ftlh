<#import "partials/main.ftlh" as main />

<@main.renderWith title="Main">

    <h1>Places</h1>

<#--    <div class="flex flex-wrap" id="itemList">-->

    <div class="row">
    <#list items as listItem>
    <#--            <div class="flex flex-column box flex-v-center">-->
    <#--                <a href="/places/${listItem.id}">-->
    <#--                    <div class="flex flex-column flex-v-center box-128">-->
    <#--                        <img class="images-icon" src="${listItem.imagePath}" alt="${listItem.name}">-->
    <#--                        ${listItem.name}-->
    <#--                    </div>-->
    <#--                </a>-->
    <#--            </div>-->
        <div class="col-sm-3">


        <div class="card bg-light border-dark mb-3" style="width: 15rem;height: 35rem">
                    <a class="text-dark" href="/places/${listItem.id}">
                        <img src="/images/${listItem.imagePath}" class="card-img-top images-icon" alt="..." style=" height:21rem;width: 15rem">

                        <div class="card-body">
                            <h5 class="card-title">${listItem.name}</h5>
                            <p class="card-text">${listItem.description}</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Rating: </li>
                        </ul>

                    </a>
                </div>
        </div>


    </#list>
    </div>


    <#include "partials/pagination.ftlh">

</@main.renderWith>