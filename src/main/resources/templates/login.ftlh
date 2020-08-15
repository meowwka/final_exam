<#import "/spring.ftl" as spring>
<#import "partials/main.ftlh" as main />

<@main.renderWith title="Login">
    <h2>sign-in</h2>
    <div>
        <#if error!false>
            <p style="color: red"> invalid-data</p>
        </#if>
    </div>

    <div class="d-flex justify-content-center">
        <div class="mx-3">

            <form    id="login-form" action="/login" method="post" >
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                </#if>
                        <input type="text" class="form-control mb-2" name="username" placeholder="your-email"  value="${(user.email)!''}" autofocus >

                        <input type="password" class="form-control mb-2" name="password" placeholder="your-password" value="" autofocus>
                <div>
                    <button type="submit" class="btn btn-outline-info btn-block"> sign-in</button>
                    <a href="/registration"  class="btn btn-outline-info btn-block"> registration</a>

                </div>
            </form>
        </div>
    </div>
</@main.renderWith>