document.getElementById('message-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const input = document.getElementById('message-input');
    const message = input.value;

    if (message.trim() === '') return;

    // Отправка сообщения на сервер
    fetch('/sendMessage', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ sender: "Me", content: message })
    })
        .then(response => response.json())
        .then(data => {
            // Обновление списка сообщений
            const messagesContainer = document.getElementById('messages-container');
            const newMessage = document.createElement('div');
            newMessage.classList.add('message');
            newMessage.innerHTML = `<div class="message-sender">${data.sender}</div><div class="message-content">${data.content}</div>`;
            messagesContainer.appendChild(newMessage);
            input.value = '';
            // Скролл к последнему сообщению
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        });
});

// Функция для получения новых сообщений с сервера
function getMessages() {
    fetch('/getMessages')
        .then(response => response.json())
        .then(data => {
            const messagesContainer = document.getElementById('messages-container');
            messagesContainer.innerHTML = '';
            data.forEach(message => {
                const messageElement = document.createElement('div');
                messageElement.classList.add('message');
                messageElement.innerHTML = `<div class="message-sender">${message.sender}</div><div class="message-content">${message.content}</div>`;
                messagesContainer.appendChild(messageElement);
            });
        });
}

// Периодическое обновление сообщений
setInterval(getMessages, 3000);

// Скролл к последнему сообщению при загрузке страницы
window.onload = function() {
    const messagesContainer = document.getElementById('messages-container');
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
};
