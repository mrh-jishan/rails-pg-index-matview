select users.id, users.first_name, users.last_name, count(r.label)
from users
         join roles_users ru on users.id = ru.user_id
         join roles r on ru.role_id = r.id
group by users.id, users.first_name, users.last_name;