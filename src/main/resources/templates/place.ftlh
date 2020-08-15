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
    <div class="row">
        <#list images as im>
            <div class="col-sm-2">
                <div class="card" style="width: 11rem;">
            <img src="/images/${im.imageName}" class="card-img-top" alt="${im.place.name}" style="height: 13rem;width: 11rem">
            </div>
            </div>
        </#list>
    </div>
    <div>
        <h4>Rating:</h4>
    </div>
    <hr>
    <div>
        <h4>Reviews:</h4>
        <#list review as review>
        <div class="card border-dark mb-3 mt-3">
            <div class="card-header">
                ${review.user.name} - ${review.user.email}
            </div>
            <div class="card-body">
                <h5 class="card-title">${review.comment}</h5>
                <p class="card-text">${review.value}</p>
<#--                <a href="#" class="btn btn-primary">Go somewhere</a>-->



            </div>
        </div>
        </#list>
    </div>
    <hr>
    <div >
        <form action="/post_review" class="border-dark" method="post" enctype="multipart/form-data">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <input type="hidden" name="placeId" value="${place.id}">
            <div class="form-group">
                <label for="reviewText">Add review:</label>
                <textarea class="form-control border-dark" name="comment" id="reviewText" rows="3"></textarea>
            </div>
            <div class="form-group">
                <label for="rating">Example select</label>
                <select class="form-control border-dark" name="value" id="exampleFormControlSelect1">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>
            <div class="form-group">
                <label for="fileEx">Example file input</label>
                <input type="file" name="file" class="form-control-file" id="fileEx">
            </div>
            <button class="btn btn-outline-info" type="submit">Upload</button>

        </form>

<#--        <form action="/upload_new_photo" method="post" enctype="multipart/form-data">-->
<#--            <#if _csrf??>-->
<#--                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>-->
<#--            </#if>-->
<#--            <input type="hidden" name="placeId" value="${place.id}"/>-->

<#--            <button classtype="submit">Submit</button>-->
<#--        </form>-->
    </div>
<#--    <#include "partials/pagination.ftlh">-->

</@main.renderWith>