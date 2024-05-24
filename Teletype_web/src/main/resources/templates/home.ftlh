<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
<div class="split left">
    <div class="split left-top">
        <h6>My Heading</h6>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </div>
    <div class="split left-down">
        <ul>
            <#list items as item>
                <li>${item}</li>
            </#list>
        </ul>
    </div>
</div>

<div class="split right"> </div>
<link rel="stylesheet" href="../css/style.css">

</body>
</html>

<#macro layout>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
    </head>
    <body>
    <div class="split left">
        <div class="split left-top">
            <h1>${heading}</h1>
            <p>${text}</p>
        </div>
        <div class="split left-down">
            <ul>
                <#list items as item>
                    <li>${item}</li>
                </#list>
            </ul>
        </div>
    </div>

    <div class="split right"> </div>
    <link rel="stylesheet" href="../css/style.css">

    </body>
    </html>
</#macro>

<@layout title="Home" heading="My Heading" text="Lorem ipsum dolor sit amet, consectetur adipiscing elit."/>
