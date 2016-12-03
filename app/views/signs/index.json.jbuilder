json.current_page @signs.current_page
json.total_pages @signs.total_pages

json.signs @signs, partial: 'signs/sign', as: :sign