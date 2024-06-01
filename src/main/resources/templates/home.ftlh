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
                    <div class="button-text time-msg">Time</div>
                    <div class="button-text nickname">${item}</div>
                    <div class="button-text last-msg">Last message</div>
                </div>
            </a>
        </#list>
    </div>
</div>
<div class="split right">
    <div class="right-top-panel">
        <h2>Chat with ${selectedUser}</h2>
    </div>
    <div class="content buttons-container-right" id="messages-container">
        <#list messages as message>
            <div class="message">
                <div class="message-sender">${message.sender}</div>
                <div class="message-content">${message.content}</div>
            </div>
        </#list>
    </div>
    <div class="message-input">
        <form id="message-form">
            <input type="text" id="message-input" placeholder="Type a message..." required>
            <button type="submit">Send</button>
        </form>
    </div>
</div>
<script src="../js/script.js"></script>
</body>
</html>


<#macro layout title heading text items buttonText>
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
                        <div class="button-text time-msg">Time</div>
                        <div class="button-text nickname">${item}</div>
                        <div class="button-text last-msg">Last message</div>
                    </div>
                </a>
            </#list>
        </div>
    </div>
    <div class="split right">
        <div class="right-top-panel">
            <h2>Chat with ${selectedUser}</h2>
        </div>
        <div class="content buttons-container-right" id="messages-container">
            <#list messages as message>
                <div class="message">
                    <div class="message-sender">${message.sender}</div>
                    <div class="message-content">${message.content}</div>
                </div>
            </#list>
        </div>
        <div class="message-input">
            <form id="message-form">
                <input type="text" id="message-input" placeholder="Type a message..." required>
                <button type="submit">Send</button>
            </form>
        </div>
    </div>
    <script src="../js/script.js"></script>
    </body>
    </html>
</#macro>

<@layout title="Home" heading="My Heading" text="Lorem ipsum dolor sit amet, consectetur adipiscing elit." items=["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 5", "Item 6", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"] buttonText="Кнопка"/>
