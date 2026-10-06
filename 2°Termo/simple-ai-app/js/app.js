// This file contains the JavaScript code for the simple AI application.

document.addEventListener('DOMContentLoaded', function() {
    const inputField = document.getElementById('user-input');
    const submitButton = document.getElementById('submit-button');
    const outputArea = document.getElementById('output-area');

    submitButton.addEventListener('click', function() {
        const userInput = inputField.value;
        const aiResponse = generateAIResponse(userInput);
        outputArea.textContent = aiResponse;
        inputField.value = '';
    });

    function generateAIResponse(input) {
        // Simple AI logic for demonstration purposes
        if (input.toLowerCase().includes('hello')) {
            return 'Hello! How can I assist you today?';
        } else if (input.toLowerCase().includes('how are you')) {
            return 'I am just a program, but thanks for asking!';
        } else {
            return 'I am not sure how to respond to that.';
        }
    }
});