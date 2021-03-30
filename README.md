# Search-and-pagination-using-AJAX
Dealing with ajax, pagination, search and SQL joins Pagination is the process of dividing your content into pages and load each page at a time to improve performance
• Showing the courses stored in the database paginated
• A button called 'Load more' should load the next page of the
courses (meaning that when the website is loaded for the first
time only 5 courses should appear, then when clicking load more
the next 5 courses should appear and so on)
• The information that should appear is: course name, course
description, department name and professor name
• An input text field with a button search used to search in the
fields that are displayed in the previous point, meaning that the
text entered should search in course name, course description,
professor name, department name. (So you will need to join all
your tables together)
• The search should be case insensitive
• The search results should also be paginated meaning that only 5
entries should appear and after clicking load more will load the
next page of the search results
• The search should also ignore the spaces, so for example if a
course is called database systems and I wrote ‘databasesystems’
it should be returned in the results. (Hint: use replace in SQL)
• The search should not search the exact word, it should search as
a substring. Example: If a teacher is called ahmed mohammed
then searching with ‘ham’ should return it,
• ALL requests are done by using AJAX
