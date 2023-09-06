const num = document.getElementById("num");
const printForm = document.getElementById("js-guess");
const display1 = document.getElementById("js-title");
const display2 = document.getElementById("js-result");
const range = document.getElementById("js-range");

const generateRandomNumber = (min, max) => {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

var rg;
const printRange = () => {
    rg = range.value;
    const displaySpan1 = display1.querySelector("span");
    displaySpan1.innerHTML = `${rg}`;
}

const handlePrint = (e) => {
    e.preventDefault();
    const rn = generateRandomNumber(0, rg);
    const nm = num.value;
    let msg;
    if (rn == nm)
        msg = "You Win!";
    else
        msg = "You Lost!";
    rg = range.value;
    const displaySpan2 = display2.querySelector("span");
    displaySpan2.innerHTML = `You choose: ${nm}, the machine choose: ${rn}.<br>
    <b>${msg}</b>`;
}

printForm.addEventListener("submit", printRange);
printForm.addEventListener("submit", handlePrint);