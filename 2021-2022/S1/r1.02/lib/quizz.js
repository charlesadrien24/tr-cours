/**
 * Try this example at https://alpsquid.github.io/quizlib
 */

/** Key value pairs using quiz element IDs and Quiz Objects.
 * For example: quizzes['quiz-1'] = [Quiz Object]
 */
var quizzes = {};

/**
 * Callback for answer buttons. The implementation for this will vary depending on your requirements.
 * In this example, the same function is being used for every quiz so we pass the ID of the quiz element and
 * retrieve the respective quiz instance from the quiz map we created in the window.onload function.
 */
function showResults(quizID) {
  // Retrieve the quiz instance for this quiz element from the map.
  var activeQuiz = quizzes[quizID];
  // Check answers and continue if all questions have been answered
  if (activeQuiz.checkAnswers()) {
    var quizScorePercent = activeQuiz.result.scorePercentFormatted; // The unformatted percentage is a decimal in range 0 - 1
    var quizResultElement = document.getElementById('quiz-result');
    // Move the quiz result element to the active quiz, placing it after the quiz title.
    var quizElement = document.getElementById(quizID);
    quizElement.insertBefore(quizResultElement, quizElement.children[1]);

    // Show the result element and add result values.
    quizResultElement.style.display = 'block';
    document.getElementById('quiz-score').innerHTML = activeQuiz.result.score.toString();
    document.getElementById('quiz-max-score').innerHTML = activeQuiz.result.totalQuestions.toString();
    document.getElementById('quiz-percent').innerHTML = quizScorePercent.toString();

    // Change background colour of results div according to score percent
    if (quizScorePercent >= 75) quizResultElement.style.backgroundColor = '#4caf50';
    else if (quizScorePercent >= 50) quizResultElement.style.backgroundColor = '#ffc107';
    else if (quizScorePercent >= 25) quizResultElement.style.backgroundColor = '#ff9800';
    else if (quizScorePercent >= 0) quizResultElement.style.backgroundColor = '#f44336';

    // Highlight questions according to whether they were correctly answered. The callback allows us to highlight/show the correct answer
    activeQuiz.highlightResults(handleAnswers);
  }
}

/** Callback for Quiz.highlightResults. Highlights the correct answers of incorrectly answered questions
 * Parameters are: the quiz object, the question element, question number, correctly answered flag
 */
function handleAnswers(quiz, question, no, correct) {
  if (!correct) {
    var answers = question.getElementsByTagName('input');
    for (var i = 0; i < answers.length; i++) {
      if (answers[i].type === "checkbox" || answers[i].type === "radio"){
        // If the current input element is part of the correct answer, highlight it
        if (quiz.answers[no].indexOf(answers[i].value) > -1) {
          answers[i].parentNode.classList.add(Quiz.Classes.CORRECT);
        }
      } else {
        // If the input is anything other than a checkbox or radio button, show the correct answer next to the element
        var correctAnswer = document.createElement('span');
        correctAnswer.classList.add(Quiz.Classes.CORRECT);
        correctAnswer.classList.add(Quiz.Classes.TEMP); // quiz.checkAnswers will automatically remove elements with the temp class
        correctAnswer.innerHTML = quiz.answers[no];
        correctAnswer.style.marginLeft = '10px';
        answers[i].parentNode.insertBefore(correctAnswer, answers[i].nextSibling);
      }
    }
  }
}

window.onload = function() {
  // Create quiz instances for each quiz and add them to the quizzes map.
  // The key is the ID of the quiz element, same as what we pass to the Quiz object as the first argument.
  /*quizzes['quiz-1'] = new Quiz('quiz-1', [
    'A',
    'C',
    'B',
    'D',
    'F',
    'G',
    'E',
  ]);

  quizzes['quiz-2'] = new Quiz('quiz-2', [
    'exo1',
    '4'
  ]);
  quizzes['quiz-3'] = new Quiz('quiz-3', [
    '13',
    '9',
    '22',
    '5',
    '1',
  ]);
  quizzes['quiz-4'] = new Quiz('quiz-4', [
    '6.8',
    '2.8',
    '9.6',
    '2.4',
  ]);
  quizzes['quiz-5'] = new Quiz('quiz-5', [
    '?',
    '?',
    '?',
    '4',
    '?',
    '?',
    '4',
    '5',
    '?',
    '4',
    '5',
    '-1',
    '4',
    '10',
    '-1',
    '15',
    '10',
    '-1',
    '15',
    '10',
    '25',
  ]);
  quizzes['quiz-6'] = new Quiz('quiz-6', [
    'true',
    'false',
    '?',
    //ligne2
    'true',
    'false',
    'false',
    //ligne3
    'true',
    'false',
    'true',
    //ligne4
    'true',
    'false',
    'false',
    //ligne5
    'true',
    'false',
    'true',
  ]);
  quizzes['quiz-7'] = new Quiz('quiz-7', [
    'true',
    'false',
    '?',
    //ligne2
    'true',
    'false',
    'false',
    //ligne3
    'true',
    'false',
    'false',
    //ligne4
    'true',
    'false',
    'true',
    //ligne5
    'true',
    'false',
    'false',
    //ligne6
    'true',
    'false',
    'true',
  ]);
  quizzes['quiz-8'] = new Quiz('quiz-8', [
    'true',
    'false',
    '?',
    //ligne2
    'true',
    'false',
    'true',
    //ligne3
    'true',
    'false',
    'true',
    //ligne4
    'true',
    'false',
    'false',
    //ligne5
    'true',
    'false',
    'true',
    //ligne6
    'true',
    'false',
    'false',
  ]);
  quizzes['quiz-9'] = new Quiz('quiz-9', [
    '2',
    '6',
    '?',
    '?',
    '?',
    '?',
    'false',
    //ligne2
    '6',
    '2',
    '?',
    '?',
    '?',
    '?',
    'true',
    //ligne3
    '6',
    '2',
    '-1.3',
    '5.2',
    '?',
    '?',
    'true',
    //ligne4
    '6',
    '2',
    '-1.3',
    '5.2',
    '@',
    '*',
    'true',
  ]);
  quizzes['quiz-10'] = new Quiz('quiz-10', [
    ['a', 'd', 'g']
  ]);
  quizzes['quiz-11'] = new Quiz('quiz-11', [
    ['a', 'd', 'h']
  ]);
  quizzes['quiz-12'] = new Quiz('quiz-12', [
    ['b']
  ]);
  quizzes['quiz-13'] = new Quiz('quiz-13', [
    'int [] tab1 = new int [3];',
    'float [] tab2 = new float [1];',
    'boolean [] tab3 = new boolean [10];',
    'char [] tab4 = new char [4];',
  ]);*/
};