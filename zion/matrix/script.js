document.getElementById('ask-button').addEventListener('click', function() {
    const input = document.getElementById('question-input');
    if (input.value.trim() !== '') {
        displayOracleResponse();
    } else {
        alert('Please ask a question.');
    }
    input.value = ''; // Clear input after asking
});

function displayOracleResponse() {
    const responses = [
        "The Matrix is everywhere, it is all around us.",
        "Do not try and bend the spoon. That's impossible.",
        "There is no spoon.",
        "You take the blue pill, the story ends. You wake up in your bed and believe whatever you want to believe.",
        "You take the red pill, you stay in Wonderland, and I show you how deep the rabbit hole goes.",
        "Welcome to the desert of the real.",
        "I'm trying to free your mind, Neo. But I can only show you the door. You're the one that has to walk through it.",
        "What you know you can't explain, but you feel it. You've felt it your entire life, that there's something wrong with the world. You don't know what it is, but it's there, like a splinter in your mind, driving you mad.",
        "The answer is out there, Neo, and it's looking for you, and it will find you if you want it to.",
        "Being the One is just like being in love. Nobody can tell you you're in love, you just know it, through and through, balls to bones.",
        "You're not here to make the choice, you've already made it. You're here to try to understand why you made it.",
        "What's really going to bake your noodle later on is, would you still have broken it if I hadn't said anything?",
        "Everything that has a beginning has an end, Neo.",
        "We can never see past the choices we don't understand.",
        "You have the sight now, Neo. You are looking at the world without time.",
        "I'm trying to wake you up, Neo. I want you to follow me, down the rabbit hole.",
    ];
    const answerText = document.getElementById('answer-text');
    answerText.textContent = responses[Math.floor(Math.random() * responses.length)];
}
