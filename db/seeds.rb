admin = User.where(admin: true).first

Ticket.create title: "Get career coaching with 80,000 Hours", user: admin, permanent: true
Ticket.create title: "Get involved with EA Oxford", user: admin, permanent: true
