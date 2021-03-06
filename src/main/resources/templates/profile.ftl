<#import "parts/common.ftl" as c>

<@c.page>

<h3>${username}</h3>

${message?ifExists}

<form method="post">
    <div class="form-group row">
        <label class="col-sm-3 col-form-label">New password:</label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="Password" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-3 col-form-label">New password confirmation:</label>
        <div class="col-sm-6">
            <input type="password" name="password2" class="form-control" placeholder="Password confirmation" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-3 col-form-label">New email:</label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}" />
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit">Save</button>
</form>

</@c.page>