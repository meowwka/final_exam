<#import "partials/main.ftlh" as main />

<@main.renderWith title="Places">

<#--    <h1>${place.name}</h1>-->
<#--    <img src="/images/${place.imagePath}" alt="Photo of place front" width="300">-->
    <div class="card  mb-3 mt-3 mx-auto" >
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="/images/${place.imagePath}" class="card-img" alt="${place.name}" style="width: 18rem;height: 23rem">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">${place.name}</h5>
                    <p class="card-text">${place.description}</p>
                </div>
            </div>
        </div>
    </div>
    <div>
        <h4>Rating:</h4>
    </div>
    <hr>
    <div>
        <h4>Reviews:</h4>
        <div class="card border-light">
            <div class="card-header">
                Featured
            </div>
            <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
<#--                <a href="#" class="btn btn-primary">Go somewhere</a>-->
            </div>
        </div>
    </div>
    <hr>
    <div>
        <form action="">

        </form>
    </div>
<#--    <#include "partials/pagination.ftlh">-->

    <div>
        <a href="/">Back to home page</a>
    </div>

</@main.renderWith>