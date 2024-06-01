document.addEventListener('DOMContentLoaded', (event) => {
    const messageForm = document.getElementById('message-form');
    const messageInput = document.getElementById('message-input');
    const messagesContainer = document.getElementById('messages-container');

    // Подключение к WebSocket серверу
    const socket = new WebSocket('ws://localhost:17825');

    socket.addEventListener('open', function (event) {
        console.log('WebSocket connection opened');
    });

    socket.addEventListener('message', function (event) {
        const data = JSON.parse(event.data);
        const messageElement = document.createElement('div');
        messageElement.classList.add('message');
        if (data.sender === 'Me') {
            messageElement.classList.add('message-me');
        } else {
            messageElement.classList.add('message-other');
        }
        messageElement.innerHTML = `<div class="message-sender">${data.sender}</div><div class="message-content">${data.content}</div>`;
        messagesContainer.appendChild(messageElement);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    });

    messageForm.addEventListener('submit', function (event) {
        event.preventDefault();
        const message = messageInput.value;

        if (message.trim() === '') return;

        const data = {
            sender: 'Me',
            content: message
        };

        socket.send(JSON.stringify(data));

        messageInput.value = '';
    });
});
