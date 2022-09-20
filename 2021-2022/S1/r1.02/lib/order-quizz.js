new Sortable(quiz1);
//new Sortable(quiz2);
const correctAnswers = [
    [
      "Michael Schumacher",
      "Lewis Hamilton",
    ],
    [
        "A",
        "B",
    ]
];

const mapCorrectAnswers = new Map([
    ['1',["C","D","A","E","B"]],
    ['2',["B","A"]],
]);

function checkAnswer(idQuiz) {
  const li = document.querySelectorAll("#quiz"+idQuiz+" li");
  let answers = new Array();
  li.forEach(function (text) {
      answers.push(text.attributes[0].nodeValue);
  });
  JSON.stringify(correctAnswers[idQuiz-1]);
  //if (JSON.stringify(correctAnswers[idQuiz-1]) === JSON.stringify(answers)) {
  if (JSON.stringify(mapCorrectAnswers.get(idQuiz.toString())) === JSON.stringify(answers)) {
    $("#quiz"+idQuiz).append('<img  alt ="GG" src="img/gg.gif" />')
  } else {
    alert("Ordre incorrect !");
  }
}