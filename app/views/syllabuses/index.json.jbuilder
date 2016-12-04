json.current_page @syllabuses.current_page
json.total_pages @syllabuses.total_pages

json.syllabuses @syllabuses, partial: 'syllabuses/syllabus', as: :syllabus