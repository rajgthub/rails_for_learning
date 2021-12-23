
json.todos @todos do |todo|
    json.title todo.title
    json.id todo.id
    json.todo todo.des
end