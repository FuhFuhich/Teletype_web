<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="split left">
    <div class="content">
        <#list items as item>
            <div class="item-box">
                <div class="top-left-corner">
                    <p>${item}</p>
                </div>
                <div class="below-top-left">
                    <p>${item}</p>
                </div>
                <div class="bottom-right-corner">
                    <p>${item}</p>
                </div>
            </div>
        </#list>
    </div>
</div>
<div class="split right">
    <!-- Right content here -->
</div>
</body>
</html>

<#macro layout title heading text items>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
    <div class="split left">
        <div class="content">
            <#list items as item>
                <div class="item-box">
                    <div class="top-left-corner">
                        <p>${item}</p>
                    </div>
                    <div class="below-top-left">
                        <p>${item}</p>
                    </div>
                    <div class="bottom-right-corner">
                        <p>${item}</p>
                    </div>
                </div>
            </#list>
        </div>
    </div>
    <div class="split right">
        <!-- Right content here -->
    </div>
    </body>
    </html>
</#macro>

<@layout title="Home" heading="My Heading" text="Lorem ipsum dolor sit amet, consectetur adipiscing elit." items=["Item 1", "Item 2", "Item 3"]/>
