<div class="justify-content-center mx-auto" style="width: 16rem">
    <#if hasPrev>
        <a id="loadPrev" class="btn btn-outline-info" href="${prevPageLink!''}">&lt;&lt;&lt;previousPage</a>
    <#else>
        <span class="btn btn-outline-info" id="loadPrev"> previousPage</span>
    </#if>

    <#if hasNext>
        <a id="loadNext" class="btn btn-outline-info" href="${nextPageLink!''}" data-default-page-size="${defaultPageSize!5}">nextPage&gt;&gt;&gt;</a>
    <#else>
        <span class="btn btn-outline-info">nextPage</span>
    </#if>
       <div><a href="/" class="btn btn-outline-info mx-left mt-2 " style="margin-left: 4rem">Go to the main</a></div>
</div>