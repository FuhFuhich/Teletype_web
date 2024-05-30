<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="split left">
    <div class="content buttons-container">
        <#list items as item>
            <a href="#" class="button-chat">
                <img src="../images/Frieren.jpg" alt="Photo" class="button-photo">
                <div class="button-text-container">
                    <div class="button-text time-msg">Top Text</div>
                    <div class="button-text nickname">${item}</div>
                    <div class="button-text last-msg">Bottom Text</div>
                </div>
            </a>
        </#list>
    </div>
</div>
<div class="split right">
    <div class="right-top-panel">
        <!-- Контент верхней панели справа -->
    </div>
    <div class="content buttons-container">
        <#list items as item>
            <a href="#" class="button-chat">
                <img src="../images/Frieren.jpg" alt="Photo" class="button-photo">
                <div class="button-text-container">
                    <div class="button-text time-msg">Top Text</div>
                    <div class="button-text nickname">${item}</div>
                    <div class="button-text last-msg">Bottom Text</div>
                </div>
            </a>
        </#list>
    </div>
</div>
</body>
</html>

<#macro layout title heading text items buttonText>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
    <div class="split left">
        <div class="content buttons-container">
            <#list items as item>
                <a href="#" class="button-chat">
                    <img src="../images/Frieren.jpg" alt="Photo" class="button-photo">
                    <div class="button-text-container">
                        <div class="button-text time-msg">Top Text</div>
                        <div class="button-text nickname">${item}</div>
                        <div class="button-text last-msg">Bottom Text</div>
                    </div>
                </a>
            </#list>
        </div>
    </div>
    <div class="split right">
        <div class="right-top-panel">
            <!-- Контент верхней панели справа -->
        </div>
        <div class="content buttons-container">
            <#list items as item>
                <a href="#" class="button-chat">
                    <img src="../images/Frieren.jpg" alt="Photo" class="button-photo">
                    <div class="button-text-container">
                        <div class="button-text time-msg">Top Text</div>
                        <div class="button-text nickname">${item}</div>
                        <div class="button-text last-msg">Bottom Text</div>
                    </div>
                </a>
            </#list>
        </div>
    </div>
    </body>
    </html>
</#macro>

<@layout title="Home" heading="My Heading" text="Lorem ipsum dolor sit amet, consectetur adipiscing elit." items=["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 5", "Item 6", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"] buttonText="Кнопка"/>
