WITH show AS (
    SELECT question_id, COUNT(*) * 1.0 AS num
    FROM Surveylog
    WHERE action = 'show' OR action = 'skip'
    GROUP BY question_id
), answer AS (
    SELECT question_id, COUNT(*) * 1.0 AS num
    FROM Surveylog
    WHERE action = 'answer'
    GROUP BY question_id
)
SELECT TOP 1 answer.question_id AS survey_log
FROM show
JOIN answer ON show.question_id = answer.question_id
ORDER BY (answer.num / show.num) DESC, answer.question_id