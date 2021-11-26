# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.find(1)

Event.create!(user: u, name: 'Code in the Dark', description: 'Free Flow Pizza', limit:'20', address:'CoderBunder, Shanghai', date: 'Sat, 04 Dec 2021'
    start_time: 'Sat, 04 Dec 2021 18:00:00.000000000 UTC +00:00', end_time:'Sat, 04 Dec 2021 21:00:00.000000000 UTC +00:00', img_url:'https://media.istockphoto.com/photos/crazy-female-programmer-under-manipulation-in-the-office-picture-id1330154453?b=1&k=20&m=1330154453&s=170667a&w=0&h=jgVnU0qWBp5yfDT8hvFkLUwbEM6nLukJD0y9hmcweKc=')

Event.create!(user: u, name: 'Second-hand Swap', description: '冬日断舍离', limit:'15', address:'Yanping Rd, Shanghai', date: 'Sun, 27 Nov 2021',
    start_time: 'Sun, 27 Nov 2021 12:30:00.000000000 UTC +00:00', end_time:'Sun, 27 Nov 2021 15:30:00.000000000 UTC +00:00', img_url:'https://media.istockphoto.com/photos/friends-exchanging-presents-at-gettogether-barbecue-party-picture-id1080426408?b=1&k=20&m=1080426408&s=170667a&w=0&h=0viuVXargGR8H4v4xl7e7Mov-ySrUeuBwbvVG_2pZzQ=')

Event.create!(user: u, name: 'Ancient Chinese Book Club', description: 'Read Zuo Zhuan（左传）with Silas', limit:'10', address:'Luohu, Shenzhen', date: 'Sun, 12 Dec 2021', start_time: 'Sun, 12 Dec 2021 14:00:00.000000000 UTC +00:00', end_time:'Sun, 12 Dec 2021 16:00:00.000000000 UTC +00:00', img_url:'https://media.istockphoto.com/photos/chinese-traditional-medicine-ancient-book-with-clipping-paths-picture-id92135111?b=1&k=20&m=92135111&s=170667a&w=0&h=ScYyK4yaQcc04E9ghiemoIM1YKRYXxpC09vkJYSn8GQ=')
