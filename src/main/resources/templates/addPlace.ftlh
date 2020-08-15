<#import "partials/main.ftlh" as main />

<@main.renderWith title="Main">
    <form action="/add_place" method="post" >
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
        </#if>
        <div class="form-group">
            <label for="nameInput">Title</label>
            <input type="text" name="title" class="form-control" id="nameInput" placeholder="Title">
        </div>
        <div class="form-group">
            <label for="descriptionArea">Description</label>
            <textarea class="form-control" name="description" id="descriptionArea" rows="3"></textarea>
        </div>
        <div class="form-group">
            <label for="fileEx">Example file input</label>
            <input type="file" name="file" class="form-control-file" id="fileEx">
        </div>
        <button type="submit">Submit new place</button>
    </form>
</@main.renderWith>